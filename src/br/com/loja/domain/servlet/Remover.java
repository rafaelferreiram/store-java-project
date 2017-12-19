package br.com.loja.domain.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.loja.dao.ProdutoDao;
import br.com.loja.domain.Produto;

/**
 * Servlet implementation class Remover
 */
@WebServlet("/Remover")
public class Remover extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// buscando os parametros no request
		Long codigo = Long.parseLong(request.getParameter("codigo"));
			
		// monta um objeto contato
		Produto produto = new Produto();
		produto.setCodigo(codigo);
		
		ProdutoDao dao = new ProdutoDao();
		try {
			dao.delete(produto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String redirectURL = "http://localhost:8080/LojaResource/Principal.jsp";
		response.sendRedirect(redirectURL);


	}   
}
