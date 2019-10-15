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

import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.model.Contato;

@WebServlet("/GravarContatoServlet")
public class GravarContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GravarContatoServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ContatoDAO contatoDAO = new ContatoDAO();
		Contato contato = new Contato();
		
		java.util.Date dataUtil = new java.util.Date();

		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		try {
			dataUtil = (Date) formatter.parse(request.getParameter("txtNascimento"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
		
		contato.setNome(request.getParameter("txtNome"));
		contato.setEmail(request.getParameter("txtEmail"));
		contato.setTelefone(request.getParameter("txtTelefone"));
		contato.setCelular(request.getParameter("txtCelular"));
		contato.setLogradouro(request.getParameter("txtEndereço"));
		contato.setBairro(request.getParameter("txtBairro"));
		contato.setCidade(request.getParameter("txtCidade"));
		contato.setEstado(request.getParameter("txtEstado"));
		contato.setCep(request.getParameter("txtCep"));
		contato.setPessoa(request.getParameter("txtPessoa"));
		contato.setContato(request.getParameter("txtContato"));
		contato.setDtNasc(dataSql);
		contato.setIdUsuario(Integer.parseInt((request.getParameter("txtIdUsuario"))));
		
		contatoDAO.gravar(contato);
		
		response.sendRedirect("contato.jsp");
		
	}

}
