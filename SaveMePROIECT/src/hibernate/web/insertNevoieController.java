package hibernate.web;


import java.io.IOException;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import hibernate.dao.HibernateDao;
import hibernate.model.Nevoie;

@WebServlet("/insertNevoie")
public class insertNevoieController extends HttpServlet {
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
			case "/insertNevoie":
				insertNevoie(request, response);
				break;
			default:
				insertNevoie(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	//Inseram informatii in tabelul 'Nevoie' din DB
	private void insertNevoie(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		 	
			String Bani = request.getParameter("Bani");
		 	int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
	        String Descriere = request.getParameter("Descriere");
	        String Haine = request.getParameter("Haine");
	        String Nume = request.getParameter("Nume");
	        String Prenume = request.getParameter("Prenume");
	        String Adresa= request.getParameter("Adresa");
	        String Adresa2= request.getParameter("Adresa2");
	        String Status = request.getParameter("Status");
	        String Document = request.getParameter("Document");
	        String 	Telefon= request.getParameter("Telefon");
	        String Mancare = request.getParameter("Mancare");
	        int CodPostal = Integer.parseInt(request.getParameter("CodPostal"));
	         
	        //obtinem data curenta	
	        LocalDate date = LocalDate.now();	
			Calendar data = Calendar.getInstance();
			
	        //obtinem ziua curenta
			DateTimeFormatter ziua = DateTimeFormatter.ofPattern("dd");
			
	        //obtinem anul curent
			DateTimeFormatter anul = DateTimeFormatter.ofPattern("yyyy");
			
	        Nevoie nevoie = new Nevoie();

	        nevoie.setBani(Bani);
	        nevoie.setStatus(Status);
	        nevoie.setId_UserNev(id_usernev);
	        nevoie.setDescriere(Descriere);
	        nevoie.setNume(Nume);
	        nevoie.setPrenume(Prenume);
	        nevoie.setAdresa(Adresa);
	        nevoie.setAdresa2(Adresa2);
	        nevoie.setTelefon(Telefon);
	        nevoie.setDocument(Document);
	        nevoie.setMancare(Mancare);
	        nevoie.setCodPostal(CodPostal);
	        nevoie.setHaine(Haine); 
	        nevoie.setLuna(data.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.ENGLISH ));
	        nevoie.setZiua(date.format(ziua));
	        nevoie.setAnul(date.format(anul));
	   
	        userDao.saveNevoie(nevoie);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("adminInterface.jsp");
	        dispatcher.forward(request, response);
		   
	}
}
