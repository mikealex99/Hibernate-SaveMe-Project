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

/**
 * Servlet implementation class FormularServlet
 */
@WebServlet("/checkFormular")
public class FormularServlet extends HttpServlet {
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

	//Redirectionare catre 'FormularStatus.jsp'
	private void checkFormular(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		int id_user = Integer.parseInt(request.getParameter("Id_UserNev"));
		
		Nevoie existingNevoie = userDao.selectUserNevoie(id_user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularStatus.jsp");
		request.setAttribute("user", existingNevoie);
		dispatcher.forward(request, response);
	}
}
