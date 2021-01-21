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
import hibernate.dao.SendEmail2;
import hibernate.model.User2;
/**
 * Servlet implementation class GiftController
 */
@WebServlet("/ReVerify2")
public class ReVerifyServlet2 extends HttpServlet {
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
			case "/ReVerify2":
				ReVerify2(request, response);
				break;
			default:
				ReVerify2(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	
	private void ReVerify2(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
	    String Email = request.getParameter("Email");
	    String Parola = request.getParameter("Parola");
	    String Nume = request.getParameter("Nume");
	    String Prenume = request.getParameter("Prenume");
	    String Adresa= request.getParameter("Adresa");
	    String Telefon= request.getParameter("Telefon");
	    String Verificat=request.getParameter("Verificat");
 		int Id = Integer.parseInt(request.getParameter("Id_user"));	
		int Id_UserNev=Integer.parseInt(request.getParameter("Id_UserNev"));
		
		
		//create instance object of the SendEmail Class
	    SendEmail2 sm = new SendEmail2();
			//get the 6-digit code
	    String Code = sm.getRandom();
	    System.out.println("Code: "+Code);
	    
	    User2 userupdate = new User2();
        
        userupdate.setId(Id);
        userupdate.setId_UserNev(Id_UserNev);
        userupdate.setEmail(Email);
        userupdate.setParola(Parola);
        userupdate.setCode(Code);
        userupdate.setNume(Nume);
        userupdate.setPrenume(Prenume);
        userupdate.setAdresa(Adresa);
        userupdate.setTelefon(Telefon);
        userupdate.setVerificat(Verificat);
        
		userDao.updateUser2(userupdate);
		
		//call the send email method
	    boolean test = sm.sendEmail(userupdate);
	    
	  //check if the email send successfully
	    if(test){
	        HttpSession session  = request.getSession();
	        session.setAttribute("authcode2", userupdate);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("verify2.jsp");
	        dispatcher.forward(request, response);
	    }else{
	        RequestDispatcher dispatcher = request.getRequestDispatcher("verifyError.jsp");
	        dispatcher.forward(request, response);
		   }
		
		
		
		
	}
}