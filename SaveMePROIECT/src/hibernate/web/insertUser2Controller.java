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

@WebServlet("/insertUser2")
public class insertUser2Controller extends HttpServlet {
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
			case "/insertUser2":
				insertUser2(request, response);
				break;
			default:
				insertUser2(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	//Preluam valorile introduse de utilizator si adaugam informatiile in tabelul 'User2' din DB
	private void insertUser2(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
	       
			String Email = request.getParameter("Email");
	        String Parola = request.getParameter("Parola");
	        String Nume = request.getParameter("Nume");
	        String Prenume = request.getParameter("Prenume");
	        String Adresa= request.getParameter("Adresa");
	        String Telefon= request.getParameter("Telefon");
	        
	        User2 user = new User2();

	        user.setEmail(Email);
	        user.setParola(Parola);
	        user.setNume(Nume);
	        user.setPrenume(Prenume);
	        user.setAdresa(Adresa);
	        user.setTelefon(Telefon);
	   
	        userDao.saveUser2(user);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("UsersVrAjut.jsp");
	        dispatcher.forward(request, response);
		   
	}
}
