<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
	String erro = ""; 
	String sucesso = "";

	try {
		erro = request.getParameter("erro").toString();
	} catch (Exception e) {
	}
	
	try {
		sucesso = request.getParameter("sucesso").toString();
	} catch (Exception e) {
	}
	
%>

<!DOCTYPE html>
<html class="ls-theme-orange">
<head>
	<meta charset="ISO-8859-1">
	
	<link rel="icon" sizes="192x192" href="imagens/icone.ico">
  <link rel="apple-touch-icon" href="imagens/icone.ico">
  
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/locastylev2.css">
	<title>Login</title>
</head>
<body
	class="documentacao documentacao_exemplos documentacao_exemplos_login-screen documentacao_exemplos_login-screen_index">

	<div class="ls-login-parent">
		<div class="ls-login-inner">
			<div class="ls-login-container">
				<div class="ls-login-box">
					<h1 class="ls-login-logo">
						<img title="Logo login" src="imagens/Font.png" />
					</h1>
					<form role="form" class="ls-form ls-login-form"
						action="LoginServlet" method="post">

						<%
							if (erro.equals("1")) {
								out.print("<div class='ls-alert-danger' role='alert'>Usuario ou senha incorreto.</div>");
							} 
						if (sucesso.equals("1")) {
								out.print("<div class='ls-alert-success ls-sm-space'><strong>Sucesso!</strong> Registro efetuado com sucesso.</div>");
							}
						%>

						<fieldset>

							<label class="ls-label"> <b
								class="ls-label-text ls-hidden-accessible">Usuário</b> <input
								class="ls-login-bg-user ls-field-lg" type="text" name="txtEmail"
								autocomplete="off" placeholder="Usuário" required autofocus>
							</label> <label class="ls-label"> <b
								class="ls-label-text ls-hidden-accessible">Senha</b>
								<div class="ls-prefix-group ls-field-lg">
									<input id="password_field" class="ls-login-bg-password"
										name="txtSenha" type="password" placeholder="Senha" required>
									<a class="ls-label-text-prefix ls-toggle-pass ls-ico-eye"
										data-toggle-class="ls-ico-eye, ls-ico-eye-blocked"
										data-target="#password_field" href="#"></a>
								</div>
							</label>

							<p>
								<a class="ls-login-forgot" href="forgot-password">Esqueci
									minha senha</a>
							</p>

							<input type="submit" value="Entrar"
								style="background-color: #DB480B;"
								class="ls-btn-primary ls-btn-block ls-btn-lg">
							<p class="ls-txt-center ls-login-signup">
								Não possui uma conta no Notter ? <a  data-ls-module="modal" data-target="#myAwesomeModal" >Cadastre-se
									agora</a>
							</p>

						</fieldset>
					</form>
				</div>

			</div>
		</div>
	</div>
	
	
 <form action="GravarUsuarioServlet" method="post" class="ls-form ls-form-horizontal row" data-ls-module="form">
	
		<div class="ls-modal" id="myAwesomeModal" style="margin-top: -60px">
		  <div class="ls-modal-large">
		    <div class="ls-modal-header">
		      <button data-dismiss="modal">&times;</button>
		      <h4 class="ls-modal-title">Registrar - se </h4>
		    </div>
		    
		   
		    
		    <div class="ls-modal-body" id="myModalBody">
		    
		    
							
									<%
								
								if(erro.equals("3") || erro.equals("4") ){
									
								%>
								
									<div class="ls-alert-danger ls-sm-space"><strong>Aviso!</strong> As senhas não conhecidem.</div>
									
								<%
								
								}
								
								%>
							
							<fieldset>
							
								<label class="ls-label col-md-6 col-xs-12"> <b
									class="ls-label-text">Nome:</b> <input type="text" name="txtNome"
									placeholder="Nome" class="ls-field" required maxlength="50">
								</label>
								
								<%
								
								if(erro.equals("2") || erro.equals("4")){
									
								%>
									<label class="ls-label col-md-4 ls-error">
								    <b class="ls-label-text">E-mail:</b>
								    <input type="email" name="txtEmail" placeholder="E-mail" class="ls-field">
								    <small class="ls-help-message">E-mail já registrado.</small>
								  </label>
									
								<%
								
								}else{
								
								%>
								
									<label class="ls-label col-md-6 col-xs-12"> <b
									class="ls-label-text">E-mail:</b> <input type="email" name="txtEmail"
									placeholder="E-mail" class="ls-field" required maxlength="40">
								</label>
								
								<%
								
								}
								
								%>
								
								 <label class="ls-label col-md-6 col-xs-12"> <b
									class="ls-label-text">Senha:</b> <input type="password" name="txtSenha"
									placeholder="Senha" class="ls-field" required maxlength="40">
								</label>
								
								
								<label class="ls-label col-md-6 col-xs-12"> <b
									class="ls-label-text">Repetir Senha:</b> <input type="password" name="txtResenha"
									placeholder="Repitir Senha" class="ls-field" required maxlength="50">
								</label>  
								
								<label class="ls-label col-md-4 col-xs-12"> <b
									class="ls-label-text">Telefone:</b> <input type="text" name="txtTelefone"
									placeholder="Telefone" class="ls-field ls-mask-phone8_with_ddd">
								</label>
								
								 <label class="ls-label col-md-4 col-xs-12"> <b
									class="ls-label-text">Celular:</b> <input type="text" name="txtCelular"
									placeholder="Celular" class="ls-field ls-mask-phone9_with_ddd">
								</label>
								
								<label class="ls-label col-md-4 col-xs-12"> <b
									class="ls-label-text">Cidade:</b> <input type="text" name="txtCidade"
									placeholder="Cidade" class="ls-field">
								</label>
								
								<label class="ls-label col-md-3"> <b class="ls-label-text">Nascimento:</b>
									<div class="ls-prefix-group">
										<input type="text" name="txtNascimento" class="datepicker ls-mask-date" id="datepicker"
											placeholder="dd/mm/aaaa" required> <a
											class="ls-label-text-prefix ls-ico-calendar"
											data-trigger-calendar="#datepicker" href="#"></a>
									</div>
								</label> 
								
								<label class="ls-label col-md-4 col-xs-12"> <b
									class="ls-label-text">Salario:</b> <input type="text" name="txtSalario"
									placeholder="Salario" class="ls-field ls-mask-money" maxlength="7">
								</label>
								
								<div class="ls-label col-md-4 col-xs-12" >
							<p>Sexo:</p>
							<label class="ls-label-text"> <input type="radio" 
								name="txtSexo" class="ls-field-radio" value="M"> Masculino
							</label> <label class="ls-label-text"> <input type="radio" 
								name="txtSexo" class="ls-field-radio" value="F"> Feminino
							</label> 
						</div>
								
			</fieldset>
					
		    </div>
		    
		    <div class="ls-modal-footer">
		      <button class="ls-btn ls-float-right" data-dismiss="modal">Cancelar</button>
		      <button type="submit" class="ls-btn-primary">Registrar</button>
		    </div>
		    
		  
		    
		  
		    
		  </div>
		  
		
		
		</div><!-- /.modal -->

 </form>

	<script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
	<script src="js/locastyle.js" type="text/javascript"></script>


</body>
</html>