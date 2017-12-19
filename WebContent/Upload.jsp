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
#cs{

}
</style>
<title> Cadastrados</title>
</head>
<body>
<div id="cs"align="center">
	<h2 style="margin-top:60px;">Arquivo adicionado com sucesso !</h2>
		
	<h6>Clique no botão abaixo para voltar para a pagina inical</h6>
	<form action="http://localhost:8080/LojaResource/Principal.jsp">
    <input type="submit" value="Pagina Inical" class="btn btn-info" />
</form>
</div>
</body>
</html>