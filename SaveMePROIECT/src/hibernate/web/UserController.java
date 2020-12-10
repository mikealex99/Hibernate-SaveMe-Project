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
import hibernate.model.Cufar;
import hibernate.model.User;

/**
 * Servlet implementation class inregajut
 */
@WebServlet("/inregajut")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HibernateDao userDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public void init() {
        userDao = new HibernateDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	        register(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	        response.sendRedirect("inregajut.jsp");
    }

   private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	    	
    Random rand = new Random();         
    //Id_Cufar-User va fi un numar generat random cuprins intre 0 si 9999999    	    	
    int Id_cufar = rand.nextInt(10000000);
    
    String Email = request.getParameter("Email");
    String Parola = request.getParameter("Parola");
    String Nume = request.getParameter("Nume");
    String Prenume = request.getParameter("Prenume");
    String Adresa= request.getParameter("Adresa");
    String Telefon= request.getParameter("Telefon");
    	        
    User user = new User();

    user.setEmail(Email);
    user.setParola(Parola);
    user.setNume(Nume);
    user.setPrenume(Prenume);
    user.setAdresa(Adresa);
    user.setTelefon(Telefon);
    user.setIdCufar(Id_cufar);
    	        
    userDao.saveUser(user);
  	     
    //inseram in 'Cufar' acelasi ID_cufar din 'Users vreau sa ajut'
    Cufar cufar = new Cufar();
    cufar.setIdCufar(Id_cufar);   	        
    userDao.saveCufar(cufar);
    	        
    RequestDispatcher dispatcher = request.getRequestDispatcher("logare.jsp");
    dispatcher.forward(request, response);
   }
}


