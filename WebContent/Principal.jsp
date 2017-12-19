<%@page import="br.com.loja.domain.servlet.ImportacaoServlet"%>
<%@page import="br.com.loja.domain.Produto"%>
<%@page import="java.util.List"%>
<%@page import="br.com.loja.dao.ProdutoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap\css\reset.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.13/jquery.mask.min.js"></script>
<style>
body{
	background-image:url("https://wallpaperscraft.com/image/blue_light_line_65813_1920x1080.jpg");
}
#logo{
width:80px;
heigth:60px;
margin-top:-2px;
margin-left:2px;
}

#nc{
width:100px;
height:50px;
margin-left: 600px;
}
</style>
<title>Tabela de Produtos</title>
</head>
<body>
	<div><a href="http://localhost:8080/LojaResource/Principal.jsp"><img id ="logo"src="https://media-exp2.licdn.com/mpr/mpr/shrink_200_200/AAEAAQAAAAAAAAxOAAAAJDlhM2NhYzQyLThjOGItNDdkMi1iNmE1LWM2ODcyMzg2NjQxZA.png"></a>
	</div>
	<div class="container" align="center">
		<form action="adicionaproduto" method="post" style="margin-top:30px;">
			Nome: <input type="text" name="nome" id="name" placeholder="Nome" style="width:200px; border-radius: 10%;"/><br/> 
			Tipo : <input type="text" name="tipo" id="tipo" placeholder="Tipo" style="width:207px; border-radius: 10%;"/><br /> 
			Preço: <input type="text" name="preco" id="preco" placeholder="R$ 0.00" maxlength="9" style="width:200px; border-radius: 10%;"/><br /> 
			Taxa : <input type="text" name="taxa" id="taxa" placeholder="0.00%" maxlength="6" style="width:206px; border-radius: 10%;"/><br> <br>
				<div align="center" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
					<div align="right" class="btn-group mr-2" style="margin-left:450px;">
		    			<input type="submit" value="Gravar" class="btn btn-success"></input>
		    			<input type="reset" value="Limpar" class="btn btn-danger"></input>		
					</div>
				</div>
			
		</form>
			<br>
				<form id="importararquivo" action="ImportacaoServlet" method="POST" enctype="multipart/form-data">
				    <input type="file" value="Importar" id="fileUpload" name="fileUpload" onchange="verificaExtensao(this)"/> 
				    <input type="submit" value="Adicionar arquivo" class="btn btn-primary"/>   
				</form>
				
				   
			<script>
			$(document).ready(function(){
				$('[id=preco]').mask("######0.000,00", {reverse: true});
				$('[id=taxa]').mask('##0.0%', {reverse: true});
				
			});
			
			function verificaExtensao($input) {
				  var extPermitidas = ['csv'];
				  var extArquivo = $input.value.split('.').pop();

				  if(typeof extPermitidas.find(function(ext){ return extArquivo == ext; }) == 'undefined') {
				    alert('Extensão "' + extArquivo + '" não permitida! \nFavor selecionar arquivo do tipo ".csv"');
				  } 
				}
				
				function confirmarRemover(val){
					var url = 'http://localhost:8080/LojaResource/Remover?codigo='+ $(val).attr("data-id");
					if(confirm('Deseja mesmo remover este item ?')){
						window.location = url;
					}
				
					
				}
			
			</script>
		
	</div>
	<br>
	<br>
	<div class="container" align="center" style="background-color: #ffffff;">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Codigo</th>
					<th scope="col">Nome</th>
					<th scope="col">Tipo</th>
					<th scope="col">Preco</th>
					<th scope="col">Taxa</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<%
				Produto p1 = new Produto();
				ProdutoDao dao = new ProdutoDao();
				List<Produto> produtos = dao.listar();
				for (Produto produto : produtos) {
			%>
			<tr>
				<th scope="row"><%=produto.getCodigo()%></th>
				<td><%=produto.getNome() + "\t"%></td>
				<td><%=produto.getTipo() + "\t"%></td>
				<td><%="R$ "+produto.getPreco() + "\t"%></td>
				<td><%=produto.getTaxa() + "%"%></td>
				<td><button <%="data-id='"+produto.getCodigo()+"'"%> class="btn btn-danger" onclick="confirmarRemover(this)">Remover</button></td>
				
			</tr>
			<%
				}
			%>
			
 
		</table>
	</div>
	
	
</body>
</html>