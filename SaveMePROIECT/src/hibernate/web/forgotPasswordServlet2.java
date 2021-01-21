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
import hibernate.dao.SendEmailPass2;
import hibernate.model.User2;

@WebServlet("/forgotPass2")
public class forgotPasswordServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HibernateDao userDao;
    
    /**
     * @see HttpServlet#HttpServlet()
     */

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
			case "/forgotPass2":
				verify(request, response);
				break;
			default:
				verify(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	
	private void verify(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		 	

         String Email = request.getParameter("Email");
         User2 ex=userDao.selectProfil2(Email);
         
     	//create instance object of the SendEmail Class
         SendEmailPass2 sm = new SendEmailPass2();
     		//get the 6-digit code
         String Code = sm.getRandom();
         System.out.println("Cod parola: "+Code);
         
         
         User2 user = new User2();
         user.setAdresa(ex.getAdresa());
         user.setCode(Code);
         user.setEmail(Email);
         user.setId(ex.getId());
         user.setId_UserNev(ex.getId_UserNev());
         user.setNume(ex.getNume());
         user.setPrenume(ex.getPrenume());
         user.setParola(ex.getParola());
         user.setTelefon(ex.getTelefon());
         user.setVerificat(ex.getVerificat());
         userDao.updateUser2(user);
         
         //call the send email method
         boolean test = sm.sendEmail(user);
         
         //check if the email send successfully
         if(test){
             HttpSession session  = request.getSession();
             session.setAttribute("Reauthcode2", user);
             
             RequestDispatcher dispatcher = request.getRequestDispatcher("verifyPass2.jsp");
             dispatcher.forward(request, response);
         }else{
             RequestDispatcher dispatcher = request.getRequestDispatcher("verifyError.jsp");
             dispatcher.forward(request, response);
     	   }


		   
	}
}
