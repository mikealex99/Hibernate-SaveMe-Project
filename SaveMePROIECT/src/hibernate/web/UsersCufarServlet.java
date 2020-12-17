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
import hibernate.model.Admin;


/**
 * Servlet implementation class insertGiftServlet
 */
@WebServlet("/UsersCufarServlet")
public class UsersCufarServlet extends HttpServlet {
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

	//Redirectionare catre pagina 'UsersAjut.jsp'
	private void editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {		
		String Utilizator=request.getParameter("Utilizator");
	
		if(Utilizator==null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.html");
			dispatcher.forward(request, response);
		}else {
		int id = Integer.parseInt(request.getParameter("ID"));
		Admin existingAdmin = userDao.selectUserProfilId(id);              
		
        System.out.println("Id: "+id);
        System.out.println("Utilizator: "+Utilizator);
        
		RequestDispatcher dispatcher = request.getRequestDispatcher("UsersCufar.jsp");
		request.setAttribute("admin", existingAdmin);
		dispatcher.forward(request, response);
		}
        
	}

}
