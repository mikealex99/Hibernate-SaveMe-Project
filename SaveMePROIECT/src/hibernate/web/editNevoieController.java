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
import hibernate.model.Nevoie;

@WebServlet("/editNevoie")
public class editNevoieController extends HttpServlet {
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

			case "/editNevoie":
				editNevoie(request, response);
				break;
			default:
				editNevoie(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	//Redirectionare catre 'nevoie-form.jsp'
	private void editNevoie(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("Id"));
		
		Nevoie existingNevoie = userDao.selectNevoie(id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("nevoie-form.jsp");
		request.setAttribute("nevoie", existingNevoie);
		dispatcher.forward(request, response);
		
	}
}
