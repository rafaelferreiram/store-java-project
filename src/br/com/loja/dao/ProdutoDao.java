package br.com.loja.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.loja.domain.Produto;
import br.com.loja.factory.ConnectionFactory;



public class ProdutoDao {
	public void create(Produto produto) throws SQLException{
		String sql = "INSERT INTO produtos (nome,tipo,preco,taxa) VALUES(?,?,?,?)";

		Connection con = ConnectionFactory.connection();

		PreparedStatement stmt = con.prepareStatement(sql);


		stmt.setString(1, produto.getNome());
		stmt.setString(2, produto.getTipo());
		stmt.setDouble(3, produto.getPreco());
		stmt.setDouble(4, produto.getTaxa());

		System.out.println(stmt);
		stmt.executeUpdate();

	}

	public void delete(Produto produto) throws SQLException{
		String sql = "DELETE FROM produtos WHERE codigo=?";
		Connection con = ConnectionFactory.connection();

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setLong(1, produto.getCodigo());

		stmt.executeUpdate();
	}


	public Produto read(Produto produto) throws SQLException{
		String sql = "SELECT codigo, nome , tipo , preco , taxa FROM produtos WHERE codigo =?";

		Connection con = ConnectionFactory.connection();

		PreparedStatement stmt = con.prepareStatement(sql);

		stmt.setLong(1, produto.getCodigo());
		ResultSet rs = stmt.executeQuery();

		if(rs.next()){
			produto.setCodigo(rs.getLong("codigo"));
			produto.setNome(rs.getString("nome"));
			produto.setTipo(rs.getString("tipo"));
			produto.setPreco(rs.getDouble("preco"));
			produto.setTaxa(rs.getDouble("taxa"));

		}
		return produto;
	}

	public ArrayList<Produto>buscarPorDescricao(Produto produto)throws SQLException{
		String sql = "SELECT codigo,nome,tipo,preco,taxa FROM produtos WHERE nome LIKE ? ORDER BY nome ASC";

		Connection con = ConnectionFactory.connection();

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, "%"+ produto.getNome()+"%");

		ResultSet rs = stmt.executeQuery();
		ArrayList<Produto>lista = new ArrayList<Produto>();

		while(rs.next()){
			Produto item = new Produto();
			item.setCodigo(rs.getLong("codigo"));
			item.setNome(rs.getString("nome"));	
			item.setTipo(rs.getString("tipo"));
			item.setPreco(rs.getDouble("preco"));
			item.setTaxa(rs.getDouble("taxa"));

			lista.add(item);
		}
		return lista;

	}

	public ArrayList<Produto> listar() throws SQLException{
		String sql = "SELECT codigo,nome,tipo,preco,taxa FROM produtos ORDER BY codigo ASC ";
		Connection con = ConnectionFactory.connection();

		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		ArrayList<Produto>lista = new ArrayList<Produto>();

		while(rs.next()){
			Produto produto = new Produto();
			produto.setCodigo(rs.getLong("codigo"));
			produto.setNome(rs.getString("nome"));
			produto.setTipo(rs.getString("tipo"));
			produto.setPreco(rs.getDouble("preco"));
			produto.setTaxa(rs.getDouble("taxa"));

			lista.add(produto);
		}
		return lista;
	}

}

