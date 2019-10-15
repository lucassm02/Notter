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
		

		String modal = "";

		try {
			modal = request.getParameter("modal").toString();
		} catch (Exception e) {
		}
%>

<!DOCTYPE html>
<html class="ls-theme-orange ls-html-nobg ">
<head>

	<title>Contatos</title>

	<meta charset="utf-8">
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-title" content="Painel 2">
	
	<link rel="icon" sizes="192x192" href="imagens/icone.ico">
  <link rel="apple-touch-icon" href="imagens/icone.ico">
	
	
	<script src="js/mediaqueries-ie.js" type="text/javascript"></script>
	<script src="js/html5shiv.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="css/locastylev2.css">
	
</head>
<body
	class="documentacao documentacao_exemplos documentacao_exemplos_painel2 documentacao_exemplos_painel2_home documentacao_exemplos_painel2_home_index">

	<%@include file="header.html"%>

	<%@include file="aside.html"%>

	<main class="ls-main ">

	<div class="container-fluid">

		<h1 class="ls-title-intro ls-ico-users ls-no-bg">Contatos</h1>
		<div class="ls-box">
			<table class="ls-table ls-table-striped ls-bg-header">
				<thead>
					<tr>
						<th>Nome</th>
						<th class="hidden-xs">E-mail</th>
						<th class="hidden-xs">Telefone</th>
						<th class="hidden-xs"></th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<Contato> contatos = new ArrayList<>();

							ContatoDAO contatoDAO = new ContatoDAO();
							contatos = contatoDAO.listacontatos(usuario.getId());
							
							

							for (Contato listacontatos : contatos) {
					%>

					<tr>

						<td><a href="contatos.jsp" class="" data-ls-module="popover" 
								data-trigger="hover" data-title="<%= listacontatos.getNome().toUpperCase() %> " data-content="
																							  	<p><strong>E-mail:</strong> <%= listacontatos.getEmail() %></p> 
																				  				<p><strong>Telefone: </strong> <%= listacontatos.getTelefone() %><p> 
																				  				<p><strong>Celular: </strong> <%= listacontatos.getCelular() %><p>  
																								  <p><strong>Nascimento: <%= df.format(listacontatos.getDtNasc()) %> </strong></p>
																									<p><strong>Endereço:</strong> <%= listacontatos.getLogradouro() %>
																									<p><strong>Bairro:</strong> <%= listacontatos.getBairro() %></p>
																									<p><strong>Cidade:</strong> <%= listacontatos.getCidade() %></p>
																									<p><strong>Estado:</strong> <%= listacontatos.getEstado() %></p>
																									<p><strong>CEP:</strong> <%= listacontatos.getCep() %></p>
																									<p><strong>Pessoa:</strong> <%= (listacontatos.getPessoa().equals("F") ? "Fisica" : "Juridica" ) %></p>
																									<p><strong>Contato:</strong> <%= listacontatos.getContato() %></p> " data-placement="right">  
							<%
	 							out.print(listacontatos.getNome());
							%>					
 						</a></td>
						<td class="hidden-xs">
							<%
								out.print(listacontatos.getEmail());
							%>
						</td>
						<td>
							<%
								out.print(listacontatos.getTelefone());
							%>
						</td>
						<td><a
							href="ListarContatoServlet?id=<%=listacontatos.getId() %>&tela=editar"
							class="ls-ico-pencil ls-btn"></a> <a
							href="ListarContatoServlet?id=<%=listacontatos.getId() %>&tela=excluir&modal=abrir"
							class="ls-ico-close ls-btn-danger"></a></td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>

			<div class="ls-group-btn">
				<a href="cadastro_contato.jsp" class="ls-btn-primary ls-ico-user">Adicionar</a>
			</div>
			
			<div class="<%= (modal.equals("abrir")) ? "ls-modal ls-opened" : "ls-modal" %>" id="myAwesomeModal">
				  <div class="ls-modal-small">
				    <div class="ls-modal-header">
				      <a data-dismiss="modal" href="contato.jsp">&times;</a>
				      <h4 class="ls-modal-title">Excluir</h4>
				    </div>
				    <div class="ls-modal-body" id="myModalBody">
				      	<div class="ls-alert-danger ls-ico-question ls-ico-right" role="alert">
									Confirma a exclusão do contato abaixo</div>
								<%try{%>
									<h3>Dethalhes do contato:</h3>
									<br>
									<p><strong>Nome:</strong> <%= contato.getNome() %></p> 
									<p><strong>E-mail:</strong> <%= contato.getEmail() %><p> 
									<p><strong>Nascimento:</strong> <%= df.format(contato.getDtNasc()) %></p> 
									<p><strong>Endereço:</strong> <%= contato.getLogradouro() %></p> 
									<%}catch (Exception e) {
									}%>
																																										
				    </div>
				    <div class="ls-modal-footer">
				      <a class="ls-btn ls-float-right" href="contato.jsp">Voltar</a>
				      <a class="ls-btn-danger" href="ExcluirContatoServlet?id=<% try {
																																									out.print(contato.getId());
																																								} catch (Exception e) {
																																											} %>" >Excluir</a>
				      
				      
				    </div>
				  </div>
				</div><!-- /.modal -->
			

		</div>
	</div>

	<%@include file="footer.html"%>
	
	</main>
	
</body>
</html>
	<%
		}
	%>