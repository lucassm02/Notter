package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;


@WebServlet("/ExcluirCompromissoervlet")
public class ExcluirCompromissoervlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ExcluirCompromissoervlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("id"));

		CompromissoDAO compromissoDAO = new CompromissoDAO();
		
		compromissoDAO.excluir(id);
		
		response.sendRedirect("index.jsp");
	}

}
