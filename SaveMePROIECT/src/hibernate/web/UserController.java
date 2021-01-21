package hibernate.web;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hibernate.dao.HibernateDao;
import hibernate.dao.SendEmail;
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
    String Verificat="Nu";
    
	//create instance object of the SendEmail Class
    SendEmail sm = new SendEmail();
		//get the 6-digit code
    String Code = sm.getRandom();
    System.out.println("Code: "+Code);
    
    User user = new User();
    
    user.setEmail(Email);
    user.setParola(Parola);
    user.setNume(Nume);
    user.setPrenume(Prenume);
    user.setAdresa(Adresa);
    user.setTelefon(Telefon);
    user.setIdCufar(Id_cufar);
    user.setCode(Code);
    user.setVerificat(Verificat);
    
    userDao.saveUser(user);
  	     
    //inseram in 'Cufar' acelasi ID_cufar din 'Users vreau sa ajut'
    Cufar cufar = new Cufar();
    cufar.setIdCufar(Id_cufar);   	        
    userDao.saveCufar(cufar);
    	        
    
  //call the send email method
    boolean test = sm.sendEmail(user);
    
  //check if the email send successfully
    if(test){
        HttpSession session  = request.getSession();
        session.setAttribute("authcode", user);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("verify.jsp");
        dispatcher.forward(request, response);
    }else{
        RequestDispatcher dispatcher = request.getRequestDispatcher("verifyError.jsp");
        dispatcher.forward(request, response);
	   }
    

   }
}


