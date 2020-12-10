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
 * Servlet implementation class insertGiftServlet
 */
@WebServlet("/addGift")
public class insertGiftServlet extends HttpServlet {
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

			case "/editUser":
				editUser(request, response);
				break;
			default:
				editUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	//Redirectionare catre pagina 'adaugaGift.jsp'
	private void editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		int Id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
		
		User existingUser = userDao.selectUser(Id_cufar);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("adaugaGift.jsp");
		request.setAttribute("cufar", existingUser);
		dispatcher.forward(request, response);
	}

}
