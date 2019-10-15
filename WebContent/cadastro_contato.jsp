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
%>

<!DOCTYPE html>
<html class="ls-theme-orange ls-html-nobg ">
<head>

	<title>Cadastrar contato</title>

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

		<h1 class="ls-title-intro ls-ico-user-add ls-no-bg">Registrar Contato</h1>
		<div class="ls-box">
			
			<form action="GravarContatoServlet" method="post" class="ls-form ls-form-horizontal row" data-ls-module="form">
			
				<input type="hidden" value="<% out.print(usuario.getId()); %>" name="txtIdUsuario">
				
				<fieldset>
				
					<label class="ls-label col-md-6 col-xs-12"> <b
						class="ls-label-text">Nome:</b> <input type="text" name="txtNome"
						placeholder="Nome" class="ls-field" required maxlength="50">
					</label>
					
					 <label class="ls-label col-md-5 col-xs-12"> <b
						class="ls-label-text">E-mail:</b> <input type="email" name="txtEmail"
						placeholder="E-mail" class="ls-field" maxlength="40">
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Telefone:</b> <input type="text" name="txtTelefone"
						placeholder="Telefone" class="ls-field ls-mask-phone8_with_ddd" maxlength="10">
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Celular:</b> <input type="text" name="txtCelular"
						placeholder="Celular" class="ls-field ls-mask-phone9_with_ddd" maxlength="11">
					</label> 
					
					<label class="ls-label col-md-3"> <b class="ls-label-text">Nascimento:</b>
						<div class="ls-prefix-group">
							<input type="text" name="txtNascimento" class="datepicker ls-mask-date" id="datepicker"
								placeholder="dd/mm/aaaa" required> <a
								class="ls-label-text-prefix ls-ico-calendar"
								data-trigger-calendar="#datepicker" href="#"></a>
						</div>
					</label> 
					
					<label class="ls-label col-md-8 col-xs-12"> <b
						class="ls-label-text">Endereço:</b> <input type="text" name="txtEndereço"
						placeholder="Endereço" class="ls-field" required maxlength="50">
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Bairro:</b> <input type="text" name="txtBairro"
						placeholder="Bairro" class="ls-field" required maxlength="50">
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Cidade:</b> <input type="text" name="txtCidade"
						placeholder="Cidade" class="ls-field" required maxlength="50">
					</label>
					
					 <label class="ls-label col-md-4"> <b class="ls-label-text">Estado:</b>
						<div class="ls-custom-select">
							<select class="ls-custom" name="txtEstado" required>
								<option value="SP">São Paulo</option>
								<option value="RJ">Rio de Janeiro</option>
								<option value="PE">Pernambuco</option>
								<option value="GO">Goiás</option>
								<option value="RS">Rio Grande do Sul</option>
							</select>
						</div>
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">CEP:</b> <input type="text" name="txtCep"
						placeholder="CEP" class="ls-field ls-mask-cep" required maxlength="6">
					</label>

				</fieldset>
				
				<fieldset>
				
					<!-- Exemplo com Radio button -->
					<div class="ls-label col-md-4 col-xs-12" >
						<p>Tipo pessoa:</p>
						<label class="ls-label-text"> <input type="radio" 
							name="txtPessoa" class="ls-field-radio" value="F"> Fisica
						</label> <label class="ls-label-text"> <input type="radio"
							name="txtPessoa" class="ls-field-radio" value="J"> Juridica
						</label> 
					</div>
					
					 <label class="ls-label col-md-8 col-xs-12"> <b
						class="ls-label-text">Contato:</b> <input type="text" name="txtContato"
						placeholder="Contato na empresa" class="ls-field" maxlength="40">
					</label>
					
				</fieldset>

				<div class="ls-actions-btn">
					<button class="ls-btn" type="submit">Salvar</button>
					<a href="contato.jsp" class="ls-btn-danger">Cancelar</a>
				</div>

			</form>
				
		</div>
	</div>

	<%@include file="footer.html"%> </main>

</body>
</html>
	<%
		}
	%>