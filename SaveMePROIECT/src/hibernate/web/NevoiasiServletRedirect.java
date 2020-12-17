package hibernate.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.dao.HibernateDao;
import hibernate.model.User;

/**
 * Servlet implementation class FormularServlet
 */
@WebServlet("/nevoiasiServlet")
public class NevoiasiServletRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HibernateDao userDao;

	public void init() {
		userDao = new HibernateDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {

			case "/checkFormular":
				checkFormular(request, response);
				break;
			default:
				checkFormular(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	//Redirectionare catre pagina 'nevoiasi.jsp'
	private void checkFormular(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {		
		String Email=request.getParameter("Email");
		
		if(Email==null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.html");
			dispatcher.forward(request, response);
		}else {
		int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
		User existingUser = userDao.selectUser(id_cufar);
        
        System.out.println("User: "+id_cufar);
        System.out.println("Email: "+Email);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("nevoiasi.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
		}
	}
}
