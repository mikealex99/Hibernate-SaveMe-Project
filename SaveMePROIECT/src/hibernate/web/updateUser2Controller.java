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

@WebServlet("/updateUser2")
public class updateUser2Controller extends HttpServlet {
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
			case "/updateUser2":
				updateUser2(request, response);
				break;
			default:
				updateUser2(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	//Preluam valorile introduse de user si le adaugam in DB
	private void updateUser2(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("ID"));
        String Utilizator = request.getParameter("Utilizator");
        
        System.out.println("Id: "+id);
        System.out.println("Utilizator: "+Utilizator);
		
		int id_user = Integer.parseInt(request.getParameter("Id_user"));
		int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
        String Email = request.getParameter("Email");
        String Parola = request.getParameter("Parola");
        String Nume = request.getParameter("Nume");
        String Prenume = request.getParameter("Prenume");
        String Adresa= request.getParameter("Adresa");
        String Telefon= request.getParameter("Telefon");
        String Verificat = request.getParameter("Verificat");
        String Code= request.getParameter("Code");
        
        User2 userupdate = new User2();
        
        userupdate.setId(id_user);
        userupdate.setId_UserNev(id_usernev);
        userupdate.setEmail(Email);
        userupdate.setParola(Parola);
        userupdate.setNume(Nume);
        userupdate.setPrenume(Prenume);
        userupdate.setAdresa(Adresa);
        userupdate.setTelefon(Telefon);
        userupdate.setVerificat(Verificat);
        userupdate.setCode(Code);

		userDao.updateUser2(userupdate);

        RequestDispatcher dispatcher = request.getRequestDispatcher("UsersVrAjut.jsp");
        dispatcher.forward(request, response);
	}

}

