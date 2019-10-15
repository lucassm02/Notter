<%@page import="br.senai.sp.dao.CompromissoDAO"%>
<%@page import="br.senai.sp.model.Compromisso"%>
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
		
		Compromisso compromisso = new Compromisso();
		
		compromisso = (Compromisso) request.getAttribute("compromisso");
		

		String modal = "";

		try {
			modal = request.getParameter("modal").toString();
		} catch (Exception e) {
		}
		
		
%>

<!DOCTYPE html>
<html class="ls-theme-orange ls-html-nobg ">
<head>

	<title>Compromissos</title>

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

		<h1 class="ls-title-intro ls-ico-calendar ls-no-bg">Compromissos</h1>
		<div class="ls-box">
		
				 <div data-ls-module="collapse" data-target="#0" class="ls-collapse ">
		    <a href="#" class="ls-collapse-header">
		      <h3 class="ls-collapse-title">Prioridade Alta</h3>
		    </a>
		    <div class="ls-collapse-body" id="0">
		    
		     <table class="ls-table ls-table-striped">
						<thead>
							<tr>
								<th>Nome</th>
								<th class="hidden-xs">Local</th>
								<th class="hidden-xs">Assunto</th>
								<th class="hidden-xs">Data e Hora</th>
								<th class="hidden-xs"></th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Compromisso> compromissos = new ArrayList<>();
		
									CompromissoDAO compromissoDAO = new CompromissoDAO();
									compromissos = compromissoDAO.listacompromissosPrioridade(usuario.getId(), "A");
									
									
		
									for (Compromisso prioridadeA : compromissos) {
							%>
		
							<tr>
		
								<td><a href="contatos.jsp" class="" data-ls-module="popover" 
								data-trigger="hover" data-title="<%= prioridadeA.getNome().toUpperCase() %> " data-content="
																									<p><strong>Assunto:</strong> <%= prioridadeA.getAssunto() %></p> 
																				  				<p><strong>Contato:</strong> <%= prioridadeA.getContato() %><p>
																				  				<p><strong>Telefone:</strong> <%= prioridadeA.getTelefone() %><p> 
																				  				<p><strong>Celular:</strong> <%= prioridadeA.getCelular() %><p>  
																									<p><strong>Data: <%= df.format(prioridadeA.getDataInicio()) %> </strong> até <strong><%= df.format(prioridadeA.getDataFim()) %></strong></p>
																									<p><strong>Hora: </strong> das <strong><%= prioridadeA.getHoraInicio() %>H</strong> até <strong><%= prioridadeA.getHoraFim() %>H</strong><p>   
																									<p><strong>Local:</strong> <%= prioridadeA.getLocal() %>
																									<p><strong>Descrição:</strong> <%= prioridadeA.getDescricao() %> " data-placement="right"> 
									<%
			 							out.print(prioridadeA.getNome());
									%>					
		 						 </a></td>
								<td class="hidden-xs">
									<%
										out.print(prioridadeA.getLocal());
									%>
								</td>
								<td>
									<%
										out.print(prioridadeA.getAssunto());
									%>
								</td>
									<td>
									<%
										out.print( df.format(prioridadeA.getDataInicio()) + " as " +  prioridadeA.getHoraInicio());
									%>
								</td>
								<td><a
									href="ListarCompromissoServlet?id=<%=prioridadeA.getId() %>&tela=editar"
									class="ls-ico-pencil ls-btn"></a> <a
									href="ListarCompromissoServlet?id=<%=prioridadeA.getId() %>&tela=excluir&modal=abrir"
									class="ls-ico-close ls-btn-danger"></a></td>
									
									
							</tr>
		
							<%
								}
							%>
						</tbody>
					</table>
					
		    </div>
		  </div>
		  
		  <div data-ls-module="collapse" data-target="#0" class="ls-collapse ">
		    <a href="#" class="ls-collapse-header">
		      <h3 class="ls-collapse-title">Prioridade Media</h3>
		    </a>
		    <div class="ls-collapse-body" id="1">
		      
		      <table class="ls-table ls-table-striped">
						<thead>
							<tr>
								<th>Nome</th>
								<th class="hidden-xs">Local</th>
								<th class="hidden-xs">Assunto</th>
								<th class="hidden-xs">Data e Hora</th>
								<th class="hidden-xs"></th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Compromisso> compromissosM = new ArrayList<>();
		
							compromissosM = compromissoDAO.listacompromissosPrioridade(usuario.getId(), "M");
									
									
		
									for (Compromisso prioridadeM : compromissosM) {
							%>
		
							<tr>
		
								<td><a href="contatos.jsp" class="" data-ls-module="popover" 
								data-trigger="hover" data-title="<%= prioridadeM.getNome().toUpperCase() %> " data-content="
																							  	<p><strong>Assunto:</strong> <%= prioridadeM.getAssunto() %></p> 
																				  				<p><strong>Contato:</strong> <%= prioridadeM.getContato() %><p>
																				  				<p><strong>Telefone: </strong> <%= prioridadeM.getTelefone() %><p> 
																				  				<p><strong>Celular: </strong> <%= prioridadeM.getCelular() %><p>  
																								  <p><strong>Data: <%= df.format(prioridadeM.getDataInicio()) %> </strong> até <strong><%= df.format(prioridadeM.getDataFim()) %></strong></p>
																									<p><strong>Hora: </strong> das <strong><%= prioridadeM.getHoraInicio() %>H</strong> até <strong><%= prioridadeM.getHoraFim() %>H</strong><p>
																									<p><strong>Local:</strong> <%= prioridadeM.getLocal() %>
																									<p><strong>Descrição:</strong> <%= prioridadeM.getDescricao() %> " data-placement="right">
																									 
									<%
			 							out.print(prioridadeM.getNome());
									%>					
		 						 </a></td>
								<td class="hidden-xs">
									<%
										out.print(prioridadeM.getLocal());
									%>
								</td>
								<td>
									<%
										out.print(prioridadeM.getAssunto());
									%>
								</td>
									<td>
									<%
										out.print( df.format(prioridadeM.getDataInicio()) + " as " +  prioridadeM.getHoraInicio());
									%>
								</td>
								<td><a
									href="ListarCompromissoServlet?id=<%=prioridadeM.getId() %>&tela=editar"
									class="ls-ico-pencil ls-btn"></a> <a
									href="ListarCompromissoServlet?id=<%=prioridadeM.getId() %>&tela=excluir&modal=abrir"
									class="ls-ico-close ls-btn-danger"></a></td>
									
									
							</tr>
		
							<%
								}
							%>
						</tbody>
					</table>
		      
		    </div>
		  </div>
		  
		    <div data-ls-module="collapse" data-target="#0" class="ls-collapse ">
		    <a href="#" class="ls-collapse-header">
		      <h3 class="ls-collapse-title">Prioridade Baixa</h3>
		    </a>
		    <div class="ls-collapse-body" id="2">
						
						<table class="ls-table ls-table-striped">
						<thead>
							<tr>
								<th>Nome</th>
								<th class="hidden-xs">Local</th>
								<th class="hidden-xs">Assunto</th>
								<th class="hidden-xs">Data e Hora</th>
								<th class="hidden-xs"></th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Compromisso> compromissosB = new ArrayList<>();
		
									compromissosB = compromissoDAO.listacompromissosPrioridade(usuario.getId(), "B");
									
									
		
									for (Compromisso prioridadeB : compromissosB) {
							%>
		
							<tr>
		
								<td><a href="contatos.jsp" class="" data-ls-module="popover" 
								data-trigger="hover" data-title="<%= prioridadeB.getNome().toUpperCase() %> " data-content="
																							  	<p><strong>Assunto:</strong> <%= prioridadeB.getAssunto() %></p> 
																				  				<p><strong>Contato:</strong> <%= prioridadeB.getContato() %><p>
																				  				<p><strong>Telefone:</strong> <%= prioridadeB.getTelefone() %><p> 
																				  				<p><strong>Celular:</strong> <%= prioridadeB.getCelular() %><p>  
																									<p><strong>Data: <%= df.format(prioridadeB.getDataInicio()) %> </strong> até <strong><%= df.format(prioridadeB.getDataFim()) %></strong></p>
																									<p><strong>Hora: </strong> das <strong><%= prioridadeB.getHoraInicio() %>H</strong> até <strong><%= prioridadeB.getHoraFim() %>H</strong><p>
																									<p><strong>Local:</strong> <%= prioridadeB.getLocal() %>
																									<p><strong>Descrição:</strong> <%= prioridadeB.getDescricao() %> " data-placement="right">
									<%
			 							out.print(prioridadeB.getNome());
									%>					
		 						 </a></td>
								<td class="hidden-xs">
									<%
										out.print(prioridadeB.getLocal());
									%>
								</td>
								<td>
									<%
										out.print(prioridadeB.getAssunto());
									%>
								</td>
									<td>
									<%
										out.print( df.format(prioridadeB.getDataInicio()) + " as " +  prioridadeB.getHoraInicio());
									%>
								</td>
								<td><a
									href="ListarCompromissoServlet?id=<%=prioridadeB.getId() %>&tela=editar"
									class="ls-ico-pencil ls-btn"></a> <a
									href="ListarCompromissoServlet?id=<%=prioridadeB.getId() %>&tela=excluir&modal=abrir"
									class="ls-ico-close ls-btn-danger"></a></td>
									
									
							</tr>
		
							<%
								}
							%>
						</tbody>
					</table>
						
		    </div>
		  </div>
		

			<div class="ls-group-btn">
				<a href="cadastroCmp.jsp" class="ls-btn-primary ls-ico-user">Adicionar</a>
			</div>
				
				
				<div class="<%= (modal.equals("abrir")) ? "ls-modal ls-opened" : "ls-modal" %>" id="myAwesomeModal">
				  <div class="ls-modal-small">
				    <div class="ls-modal-header">
				      <a data-dismiss="modal" href="index.jsp">&times;</a>
				      <h4 class="ls-modal-title">Excluir</h4>
				    </div>
				    <div class="ls-modal-body" id="myModalBody">
				      	<div class="ls-alert-danger ls-ico-question ls-ico-right" role="alert">
									Confirma a exclusão do compromisso abaixo</div>
								<%try{%>
									<h3>Dethalhes do compromisso:</h3>
									<br>
									<p><strong>Nome:</strong> <%= compromisso.getNome() %></p> 
									<p><strong>Assunto:</strong> <%= compromisso.getAssunto() %><p> 
									<p><strong>Data:</strong> <%= df.format(compromisso.getDataInicio()) %></p> 
									<p><strong>Local:</strong> <%= compromisso.getLocal() %></p> 
									<%}catch (Exception e) {
									}%>
																																										
				    </div>
				    <div class="ls-modal-footer">
				      <a class="ls-btn ls-float-right" href="index.jsp">Voltar</a>
				      <a class="ls-btn-danger" href="ExcluirCompromissoervlet?id=<% try {
																																									out.print(compromisso.getId());
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