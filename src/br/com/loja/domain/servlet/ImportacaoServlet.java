package br.com.loja.domain.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.com.loja.dao.ProdutoDao;
import br.com.loja.domain.Produto;

@WebServlet("/ImportacaoServlet")
@MultipartConfig
public class ImportacaoServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Part filePart = request.getPart("fileUpload");
		InputStream is = filePart.getInputStream();
		try {
			leitura(is);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String redirectURL = "http://localhost:8080/LojaResource/Upload.jsp";
		response.sendRedirect(redirectURL);
		
	}

	public static void leitura(InputStream arquivo ) throws IOException, SQLException {
		try {
			InputStreamReader isr = new InputStreamReader(arquivo);
			BufferedReader br = new BufferedReader(isr);

			String s = br.readLine();
				  

			while (s != null) {
				Produto p1 = new Produto();
				String nome, tipo;
				double preco, taxa;
				StringTokenizer st = null;
							
				 st = new StringTokenizer(s, ";");
				 		
				nome = st.nextToken();
				tipo = st.nextToken();
				preco = Double.parseDouble(st.nextToken());
				taxa = Double.parseDouble(st.nextToken());

				p1.setNome(nome);
				p1.setTipo(tipo);
				p1.setPreco(preco);
				p1.setTaxa(taxa);

				ProdutoDao dao = new ProdutoDao();
				dao.create(p1);
				
				s = br.readLine(); // pular a linha para voltar
			}

			br.close();
			

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}