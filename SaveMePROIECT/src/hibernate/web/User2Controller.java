package hibernate.web;

import java.io.IOException;
import java.util.Random;

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
 * Servlet implementation class inregajut
 */
@WebServlet("/inregnevoi")
public class User2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HibernateDao userDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

   public void init() {
        userDao = new HibernateDao();
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	        register2(request, response);
  }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	        response.sendRedirect("inregnevoi.jsp");
  }

   private void register2(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	    	
     Random rand = new Random(); 	        
     // Id_User-Nevoias va fi un numar cuprins intre 0-9999999    	    	
     int Id_UserNev = rand.nextInt(10000000);
    	    	
     String Email = request.getParameter("Email");
     String Parola = request.getParameter("Parola");
     String Nume = request.getParameter("Nume");
     String Prenume = request.getParameter("Prenume");
     String Adresa= request.getParameter("Adresa");
     String Telefon= request.getParameter("Telefon");
    	        
     User2 user = new User2();

     user.setId_UserNev(Id_UserNev);
     user.setEmail(Email);
     user.setParola(Parola);
     user.setNume(Nume);
     user.setPrenume(Prenume);
     user.setAdresa(Adresa);
     user.setTelefon(Telefon);
	        
     userDao.saveUser2(user);
    	        
    	 
    //inseram in 'Nevoie' acelasi ID din 'Users am nevoie de ajutor'
     Nevoie nev = new Nevoie();
     nev.setId_UserNev(Id_UserNev);   	        
     userDao.saveNevoie(nev);
    	       

    RequestDispatcher dispatcher = request.getRequestDispatcher("logarenevoi.jsp");
    dispatcher.forward(request, response);
    }
}


