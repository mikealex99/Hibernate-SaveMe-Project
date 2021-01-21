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
import hibernate.dao.SendEmailPass;
import hibernate.model.User;
/**
 * Servlet implementation class GiftController
 */
@WebServlet("/ReVerifyPass")
public class ReverifyPassServlet extends HttpServlet {
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
			case "/ReVerifyPass":
				ReVerify(request, response);
				break;
			default:
				ReVerify(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	
	private void ReVerify(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
	    String Email = request.getParameter("Email");
	    String Parola = request.getParameter("Parola");
	    String Nume = request.getParameter("Nume");
	    String Prenume = request.getParameter("Prenume");
	    String Adresa= request.getParameter("Adresa");
	    String Telefon= request.getParameter("Telefon");
	    String Verificat=request.getParameter("Verificat");
 		int Id = Integer.parseInt(request.getParameter("Id_user"));	
		int Id_cufar=Integer.parseInt(request.getParameter("Id_cufar"));
		
		
		//create instance object of the SendEmail Class
	    SendEmailPass sm = new SendEmailPass();
			//get the 6-digit code
	    String Code = sm.getRandom();
	    System.out.println("Code: "+Code);
	    
	    User userupdate = new User();
        
        userupdate.setId(Id);
        userupdate.setIdCufar(Id_cufar);
        userupdate.setEmail(Email);
        userupdate.setParola(Parola);
        userupdate.setCode(Code);
        userupdate.setNume(Nume);
        userupdate.setPrenume(Prenume);
        userupdate.setAdresa(Adresa);
        userupdate.setTelefon(Telefon);
        userupdate.setVerificat(Verificat);
        
		userDao.updateUser(userupdate);
		
		//call the send email method
	    boolean test = sm.sendEmail(userupdate);
	    
	  //check if the email send successfully
	    if(test){
	        HttpSession session  = request.getSession();
	        session.setAttribute("Reauthcode", userupdate);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("verifyPass.jsp");
	        dispatcher.forward(request, response);
	    }else{
	        RequestDispatcher dispatcher = request.getRequestDispatcher("verifyError.jsp");
	        dispatcher.forward(request, response);
		   }
		
		
		
		
	}
}