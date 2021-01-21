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
import hibernate.model.User2;

/**
 * Servlet implementation class updateProfil
 */
@WebServlet("/updateProfil2Servlet")
public class updateProfil2 extends HttpServlet {
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
		int id_nev = Integer.parseInt(request.getParameter("Id_UserNev"));
		Nevoie exNevoie=userDao.selectUserNevoie(id_nev);
		int Id = Integer.parseInt(request.getParameter("Id_user"));
		
        String Email = request.getParameter("Email");
        String Parola = request.getParameter("Parola");
        String Nume = request.getParameter("Nume");
        String Prenume = request.getParameter("Prenume");
        String Adresa= request.getParameter("Adresa");
        String Verificat = request.getParameter("Verificat");
        String Code= request.getParameter("Code");

        String Telefon= request.getParameter("Telefon");
        
        User2 userupdate = new User2();
        
        userupdate.setId_UserNev(exNevoie.getId_UserNev());
        userupdate.setId(Id);
        userupdate.setEmail(Email);
        userupdate.setParola(Parola);
        userupdate.setNume(Nume);
        userupdate.setPrenume(Prenume);
        userupdate.setAdresa(Adresa);
        userupdate.setTelefon(Telefon);
        userupdate.setVerificat(Verificat);
        userupdate.setCode(Code);

		userDao.updateUser2(userupdate);
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("FormularStatus.jsp");
        dispatcher.forward(request, response);
	}

}
