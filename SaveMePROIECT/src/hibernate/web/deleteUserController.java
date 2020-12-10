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
import hibernate.model.Cufar;


@WebServlet("/deleteUser")
public class deleteUserController extends HttpServlet {
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
			case "/deleteUser":
				deleteUser(request, response);
				break;
			default:
				deleteUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		//Daca stergem Userul stergem si giftul acestuia		
		int id_user = Integer.parseInt(request.getParameter("Id_user"));
		int id_usercufar = Integer.parseInt(request.getParameter("Id_cufar"));
		
		Cufar exCufar=userDao.selectCufar(id_usercufar);
		userDao.deleteUser(id_user);
		System.out.println("Userul "+id_user+" a fost sters.");
		
		userDao.deleteCufar(exCufar.getId());
		System.out.println("Gift-ul "+id_usercufar+" a fost sters.");
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("UsersAjut.jsp");
        dispatcher.forward(request, response);
        
	}
}
