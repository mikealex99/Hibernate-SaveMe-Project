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
import hibernate.model.User2;

@WebServlet("/editUser2")
public class editUser2Controller extends HttpServlet {
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

			case "/editUser2":
				editUser2(request, response);
				break;
			default:
				editUser2(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	//Redirectionare catre 'user2-form.jsp'
	private void editUser2(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		int id_user = Integer.parseInt(request.getParameter("Id_user"));
		
		User2 existingUser2 = userDao.selectUser2(id_user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("user2-form.jsp");
		request.setAttribute("user2", existingUser2);
		dispatcher.forward(request, response);
	}

}
