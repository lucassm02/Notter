package br.senai.sp.servlets;

import java.io.IOException;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Usuario;


@WebServlet("/GravarUsuarioServlet")
public class GravarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GravarUsuarioServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = new Usuario();
	
		
		 java.util.Date dataUtil = new java.util.Date();
		
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		try {
			dataUtil = (Date)formatter.parse(request.getParameter("txtNascimento"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
		java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
	    
		
		String email = request.getParameter("txtEmail");
		Boolean verf = usuarioDAO.verificarEmail(email);
		
		String senha = request.getParameter("txtSenha");
		String reSenha = request.getParameter("txtResenha");
		
		String salario = request.getParameter("txtSalario"); 
		
		if(verf == true && senha.equals(reSenha)) {
			
			usuario.setNome(request.getParameter("txtNome"));
			usuario.setEmail(request.getParameter("txtEmail"));
			usuario.setSenha(request.getParameter("txtSenha"));
			usuario.setTelefone(request.getParameter("txtTelefone"));
			usuario.setCidade(request.getParameter("txtCidade"));
			usuario.setDtNasc(dataSql);
			usuario.setSexo(request.getParameter("txtSexo"));
			usuario.setSalario(Double.valueOf(salario.replace(".", "").replace(",", ".")));
		
			
			usuarioDAO.gravar(usuario);
			
			response.sendRedirect("login.jsp?sucesso=1");
			
		} else if(verf == false && !senha.equals(reSenha)) {
			
			response.sendRedirect("login.jsp?erro=4#myAwesomeModal");
			
		}else if (verf == false){
			
			response.sendRedirect("login.jsp?erro=2#myAwesomeModal");
			
		}else if (!senha.equals(reSenha)) {
			
			response.sendRedirect("login.jsp?erro=3#myAwesomeModal");
			
		}
		
	}

}
