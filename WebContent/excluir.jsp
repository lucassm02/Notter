<%@page import="br.senai.sp.dao.ContatoDAO"%>
<%@page import="br.senai.sp.model.Contato"%>
<%@page import="br.senai.sp.model.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sun.java2d.pipe.SpanShapeRenderer.Simple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.Date"%>

<%
	if (session.getAttribute("usuario") == null) {
		response.sendRedirect("login.jsp");
	} else {

		Usuario usuario = new Usuario();

		/*usuario = (Usuario) request.getAttribute("user");
		*/

		usuario = (Usuario) session.getAttribute("usuario");

		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		Contato contato = new Contato();
		
		contato = (Contato) request.getAttribute("contato");
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Agenda</title>
</head>
<body>

	<div class="container">

		<%@include file="header.html"%>

		<div class="row">

			<div class="col-md-3">



			</div>

	

		</div>

		<div class="col-md-9">

			<div class="panel panel-success">
				<div class="panel-heading">
					<strong>Contatos 
				</div>
				<div class="panel-body">
				
				<div class="alert alert-warning" role="alert">
				<img alt="" src="imagens/question24.png" style="margin-right: 10px;">
				Confirma a exclusão do contato abaixo:</div>
				
				<h3>Dethalhes do contato:</h3>
				<p>Nome: <%= contato.getNome() %></p>
				<p>E-mail: <%= contato.getEmail() %></p>
				<p>Telefone: <%= contato.getTelefone() %></p>
				<p>Cidade: <%= contato.getCidade() %></p>
				
				<hr>
					
				<a href="ExcluirContatoServlet?id=<%= contato.getId() %>" class="btn btn-danger">Confirmar Exclusão</a>
				<a href="contato.jsp" class="btn btn-success">Voltar</a>
				</div>
			</div>

		</div>

	</div>

	<%@include file="footer.html"%>

	</div>

</body>
</html>
<%
	}
%>

