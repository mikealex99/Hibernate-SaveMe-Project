package hibernate.web;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hibernate.dao.HibernateDao;
import hibernate.dao.SendMessAdmin;
import hibernate.model.Nevoie;
import hibernate.model.User2;

@WebServlet("/updateNevoie")
public class updateNevoieController extends HttpServlet {
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
			case "/updateNevoie":
				updateNevoie(request, response);
				break;
			default:
				updateNevoie(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	//Preluam valorile introduse de user si le introducem in DB
	private void updateNevoie(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int ID = Integer.parseInt(request.getParameter("ID"));
        String Utilizator = request.getParameter("Utilizator");
        
        System.out.println("Id: "+ID);
        System.out.println("Utilizator: "+Utilizator);
		
		int id = Integer.parseInt(request.getParameter("Id"));
		int id_USERNEV = Integer.parseInt(request.getParameter("Id_UserNev"));
		
		User2 exUser2=userDao.selectUserProfil2(id_USERNEV);
		String Email=exUser2.getEmail();
		System.out.println("Email: "+Email);
		
		//Create instance of sendEmail
		SendMessAdmin sm=new SendMessAdmin();
		
	 	String Bani = request.getParameter("Bani");
        String Descriere = request.getParameter("Descriere");
        String Haine = request.getParameter("Haine");
        String Document = request.getParameter("Document");
        String Nume = request.getParameter("Nume");
        String Prenume = request.getParameter("Prenume");
        String Adresa= request.getParameter("Adresa");
        String Adresa2= request.getParameter("Adresa2");
        String Telefon= request.getParameter("Telefon");
        String Mancare = request.getParameter("Mancare");
        String Status = request.getParameter("Status");
        int CodPostal = Integer.parseInt(request.getParameter("CodPostal"));
        String Ziua = request.getParameter("Ziua");
        String Anul = request.getParameter("Anul");
        String Luna = request.getParameter("Luna");
        String MesajAdmin = request.getParameter("MesajAdmin");
        
        Nevoie nevoie = new Nevoie();
        nevoie.setId(id);
        nevoie.setId_UserNev(id_USERNEV);
        nevoie.setBani(Bani);
        nevoie.setDescriere(Descriere);
        nevoie.setNume(Nume);
        nevoie.setPrenume(Prenume);
        nevoie.setAdresa(Adresa);
        nevoie.setAdresa2(Adresa2);
        nevoie.setTelefon(Telefon);
        nevoie.setStatus(Status);
        nevoie.setMancare(Mancare);
        nevoie.setCodPostal(CodPostal);
        nevoie.setHaine(Haine);
        nevoie.setDocument(Document);
        nevoie.setLuna(Luna);
        nevoie.setZiua(Ziua);
        nevoie.setAnul(Anul);
        nevoie.setMesajAdmin(MesajAdmin);
   
        userDao.updateNevoie(nevoie);
        
        
        
      //call the send email method
        boolean test = sm.sendEmail(nevoie);
        
        //check if the email send successfully
        if(test){
            HttpSession session  = request.getSession();
            session.setAttribute("SendMess", nevoie);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("UsersNevoie.jsp");
            dispatcher.forward(request, response);
        }else{
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.html");
            dispatcher.forward(request, response);
    	   }

	}

}

