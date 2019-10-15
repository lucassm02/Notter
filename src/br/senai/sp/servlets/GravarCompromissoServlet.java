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

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.model.Compromisso;


@WebServlet("/GravarCompromissoServlet")
public class GravarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public GravarCompromissoServlet() {
        super();
      
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CompromissoDAO compromissoDAO = new CompromissoDAO();
		Compromisso compromisso = new Compromisso();
		
		 java.util.Date dataInicioUtil = new java.util.Date();
		 java.util.Date dataFimUtil = new java.util.Date();
			
			DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			try {
				dataInicioUtil = (Date)formatter.parse(request.getParameter("txtDataInicio"));
				dataFimUtil = (Date)formatter.parse(request.getParameter("txtDataFim"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
			java.sql.Date dataInicioSql = new java.sql.Date(dataInicioUtil.getTime());
			java.sql.Date dataFimSql = new java.sql.Date(dataFimUtil.getTime());
		
		compromisso.setNome(request.getParameter("txtNome"));
		compromisso.setAssunto(request.getParameter("txtAssunto"));
		compromisso.setContato(request.getParameter("txtContato"));
		compromisso.setDescricao(request.getParameter("txtDescricao"));
		compromisso.setLocal(request.getParameter("txtLocal"));
		compromisso.setTelefone(request.getParameter("txtTelefone"));
		compromisso.setCelular(request.getParameter("txtCelular"));
		compromisso.setDataInicio(dataInicioSql);
		compromisso.setDataFim(dataFimSql);
		compromisso.setHoraInicio(request.getParameter("txtHoraInicio"));
		compromisso.setHoraFim(request.getParameter("txtHoraFim"));
		compromisso.setPrioridade(request.getParameter("txtPrioridade"));
		compromisso.setIdUsuario(request.getParameter("txtIdUsuario"));
		
		compromissoDAO.gravar(compromisso);
		
		response.sendRedirect("index.jsp");
		
	}

}
