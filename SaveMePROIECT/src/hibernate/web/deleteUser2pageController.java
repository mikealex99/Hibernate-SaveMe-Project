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


@WebServlet("/deleteUser2page")
public class deleteUser2pageController extends HttpServlet {
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
			case "/deleteUser2":
				deleteUser2(request, response);
				break;
			default:
				deleteUser2(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	private void deleteUser2(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {		
		//Daca stergem Userul stergem si nevoiasul introdus de acesta
		
		int id_user = Integer.parseInt(request.getParameter("Id_user"));
		int Id_UserNev = Integer.parseInt(request.getParameter("Id_UserNev"));
		
		Nevoie exNev=userDao.selectUserNevoie(Id_UserNev);
		userDao.deleteUser2(id_user);
		System.out.println("Userul "+id_user+" a fost sters.");
		
		userDao.deleteNevoie(exNev.getId());
		System.out.println("Nevoiasul "+exNev.getId()+" a fost sters.");
				
        RequestDispatcher dispatcher = request.getRequestDispatcher("homeDel.html");
        dispatcher.forward(request, response);
        
	}
}
