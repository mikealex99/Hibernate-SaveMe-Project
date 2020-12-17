package hibernate.web;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;
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


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

@WebServlet("/nevoieform")
public class NevoieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HibernateDao userDao;
		
	  /*
    create images folder at, C:\Users\alexa\eclipse-workspace\git\Hibernate-SaveMe-Project\SaveMePROIECT\WebContent\Imagini
    */

   public static final String UPLOAD_DIR = "Imagini";
   public String dbFileName = "";
	

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
        
		//get the file chosen by the user
		Part part = request.getPart("Document");
							
		String fileName = extractFileName(part);//file name
		
		 String applicationPath = getServletContext().getRealPath("");
	     String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
	     System.out.println("applicationPath:" + applicationPath);
	     File fileUploadDirectory = new File(uploadPath);
	     
	     if (!fileUploadDirectory.exists()) {
	            fileUploadDirectory.mkdirs();
	        }
	     
	     System.out.println("Filename: "  + fileName);
	     String savePath = "C:\\Users\\alexa\\git\\Hibernate-SaveMe-Project\\SaveMePROIECT\\WebContent\\Imagini" + File.separator + fileName;
	     System.out.println("savePath: " + savePath);
	     String sRootPath = new File(savePath).getAbsolutePath();
	     System.out.println("sRootPath: " + sRootPath);
	     
	     
	     /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/

        part.write(savePath + File.separator);
		
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
        nevoie.setDocument(fileName);
        
		nevoie.setId(Id);
		nevoie.setId_UserNev(exNev.getId_UserNev());
        
		userDao.updateNevoie(nevoie);
		
		System.out.println("updateComplete .......................................... ID: "+Id);
		System.out.println("updateComplete .......................................... ID_USERNEV: "+exNev.getId_UserNev());
        RequestDispatcher dispatcher = request.getRequestDispatcher("FormularStatus.jsp");
        dispatcher.forward(request, response);
    	    }
	
	private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}


