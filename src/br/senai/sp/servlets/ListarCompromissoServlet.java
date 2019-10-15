package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.model.Compromisso;


@WebServlet("/ListarCompromissoServlet")
public class ListarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ListarCompromissoServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		 int id = Integer.parseInt(request.getParameter("id"));
		 String target = request.getParameter("tela");
		 
		 String arquivo = "";
		 
		 if (target.equals("editar")){
			 arquivo = "editarCmp.jsp";
		 }else if (target.equals("excluir")) {
			 arquivo = "index.jsp";
		 }else if (target.equals("excluirHist")) {
			 arquivo = "histCmp.jsp";
		 }
		 
		 Compromisso compromisso = new Compromisso();
		 CompromissoDAO compromissoDAO = new CompromissoDAO();
		 compromisso = compromissoDAO.getCompromisso(id);
		 
		 
		 request.setAttribute("compromisso", compromisso);
		 
		 RequestDispatcher rd = request.getRequestDispatcher(arquivo);
		 rd.forward(request, response);
	}

}
