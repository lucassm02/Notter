<%@page import="br.senai.sp.model.Contato"%>
<%@page import="br.senai.sp.dao.ContatoDAO"%>
<%@page import="br.senai.sp.model.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.java2d.pipe.SpanShapeRenderer.Simple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.Date"%>

<%
	Usuario usuario = new Usuario();

	/*usuario = (Usuario) request.getAttribute("user");
	*/
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/locastyle.css">

<title>Agenda - Registrar</title>
</head>
<body>

	<div class="container">

		<%@include file="header.html"%>

		<div class="row">

			<div class="col-md-2"></div>

			<div class="col-md-8">

				<div class="panel panel-success">
					<div class="panel-heading">
						<strong>Cadastrar - se </strong>
					</div>
					<div class="panel-body">

						<form method="post" action="GravarUsuarioServlet">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtNome">Nome:</label> <input type="text"
										class="form-control" name="txtNome" maxlength="50"
										placeholder="Digite seu nome...">
								</div>
								<div class="form-group col-md-6">
									<label for="txtEmail">E-mail:</label> <input type="email"
										class="form-control" name="txtEmail" maxlength="40"
										placeholder="Digite seu e-mail...">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtSenha">Senha:</label> <input type="password"
										class="form-control" name="txtSenha" maxlength="8"
										placeholder="Digite sua senha...">
								</div>
								<div class="form-group col-md-6">
									<label for="txtResenha">Repetir Senha:</label> <input
										type="password" class="form-control" name="txtResenha"
										maxlength="8" placeholder="Repita sua senha...">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="txtTelefone">Telefone:</label> <input type="text"
										class="form-control phone-ddd-mask " name="txtTelefone"
										placeholder="Digite seu telefone...">
								</div>
								<div class="form-group col-md-4">
									<label for="txtCidade">Cidade:</label> <input type="text"
										class="form-control" name="txtCidade" maxlength="30"
										placeholder="Digite seu cidade...">
								</div>
								<div class="form-group col-lg-4">
									<label for="exampleInputEmail1">Data</label> <input type="date"
										class="form-control" id="exampleInputEmail1"
										placeholder="Insira seu emai aqui">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="txtSalario">Salario:</label> <input type="text"
										class="form-control simple-field-data-mask-reverse"
										name="txtSalario" data-mask="##.##0,00"
										data-mask-reverse="true" placeholder="Digite seu salario...">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="txtSexo">Sexo:</label> <br> <input
										type="radio" name="txtSexo" value="F"> Feminino <input
										type="radio" name="txtSexo" value="M"> Masculino
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-success">Gravar
										contato</button>
									<a href="login.jsp" class="btn btn-danger">Voltar</a>
								</div>
							</div>


						</form>

					</div>
				</div>

			</div>

			<div class="col-md-2"></div>

		</div>

		<%@include file="footer.html"%>

	</div>

</body>
</html>
<%
	
%>

