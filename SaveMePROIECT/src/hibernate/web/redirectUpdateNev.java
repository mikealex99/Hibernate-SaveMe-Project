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


/**
 * Servlet implementation class insertGiftServlet
 */
@WebServlet("/updDirect")
public class redirectUpdateNev extends HttpServlet {
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


	//Redirectionare catre 'editNevoie.jsp'
	private void editUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String Email=request.getParameter("Email");
		
		if(Email==null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.html");
			dispatcher.forward(request, response);
		}else {
		int id_user = Integer.parseInt(request.getParameter("Id_UserNev"));
		User2 existingUserProfil2 = userDao.selectUserProfil2(id_user);              
		
        System.out.println("User: "+id_user);
        System.out.println("Email: "+Email);
        
		RequestDispatcher dispatcher = request.getRequestDispatcher("editNevoie.jsp");
		request.setAttribute("user2", existingUserProfil2);
		dispatcher.forward(request, response);
	}
  }
}
