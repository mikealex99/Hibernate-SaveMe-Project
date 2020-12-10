package hibernate.web;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import hibernate.dao.HibernateDao;

import hibernate.model.Nevoie;

/**
 * Servlet implementation class nevoieform
 */

@MultipartConfig

@WebServlet("/nevoieform")
public class NevoieController extends HttpServlet {
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
			case "/insertNev":
				insertNev(request, response);
				break;
			default:
				insertNev(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	//Preluam valorile introduse de user si le inseram in DB
	private void insertNev(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
		Nevoie exNev=userDao.selectUserNevoie(id_usernev);
		int Id = Integer.parseInt(request.getParameter("Id"));
    	
        String Bani = request.getParameter("Bani");
        String Status = request.getParameter("Status");
        String Descriere = request.getParameter("Descriere");
        String Haine = request.getParameter("Haine");
        String Nume = request.getParameter("Nume");
        String Prenume = request.getParameter("Prenume");
        String Adresa= request.getParameter("Adresa");
        String Adresa2= request.getParameter("Adresa2");
        String Telefon= request.getParameter("Telefon");
        String Mancare = request.getParameter("Mancare");
        int CodPostal = Integer.parseInt(request.getParameter("CodPostal"));
        
        //obtinem luna curenta
		LocalDate date = LocalDate.now();		
		Calendar luna = Calendar.getInstance();
		
        //obtinem ziua curenta
		DateTimeFormatter ziua = DateTimeFormatter.ofPattern("dd");
		
        //obtinem anul curent
		DateTimeFormatter anul = DateTimeFormatter.ofPattern("yyyy");
        
		//preluam fisierul ales de user
		Part filePartDoc = request.getPart("Document");		
		//InputStream pentru a stoca fisierul
	    InputStream fileInputStream = filePartDoc.getInputStream();
	    File fileToSave = new File("C:\\Users\\alexa\\eclipse-workspace\\SaveMePROIECT\\WebContent\\Imagini",filePartDoc.getSubmittedFileName());
		Files.copy(fileInputStream, fileToSave.toPath(), StandardCopyOption.REPLACE_EXISTING);	
		String fileUrl =""+ filePartDoc.getSubmittedFileName();
		
        Nevoie nevoie = new Nevoie();

        nevoie.setBani(Bani);
        nevoie.setStatus(Status);
        nevoie.setDescriere(Descriere);
        nevoie.setNume(Nume);
        nevoie.setPrenume(Prenume);
        nevoie.setAdresa(Adresa);
        nevoie.setAdresa2(Adresa2);
        nevoie.setTelefon(Telefon);
        nevoie.setMancare(Mancare);
        nevoie.setCodPostal(CodPostal);
        nevoie.setHaine(Haine);
        nevoie.setLuna(luna.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.ENGLISH ));
        nevoie.setZiua(date.format(ziua));
        nevoie.setAnul(date.format(anul));
        nevoie.setDocument(fileUrl);
		nevoie.setId(Id);
		nevoie.setId_UserNev(exNev.getId_UserNev());
        
		userDao.updateNevoie(nevoie);
		
		System.out.println("updateComplete .......................................... ID: "+Id);
		System.out.println("updateComplete .......................................... ID_USERNEV: "+exNev.getId_UserNev());
        RequestDispatcher dispatcher = request.getRequestDispatcher("FormularStatus.jsp");
        dispatcher.forward(request, response);
   }
}


