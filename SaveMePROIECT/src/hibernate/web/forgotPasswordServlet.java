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

@WebServlet("/forgotPass")
public class forgotPasswordServlet extends HttpServlet {
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
			case "/forgotPass":
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
         User ex=userDao.selectProfil(Email);
         
     	//create instance object of the SendEmail Class
         SendEmailPass sm = new SendEmailPass();
     		//get the 6-digit code
         String Code = sm.getRandom();
         System.out.println("Cod parola: "+Code);
         
         
         User user = new User();
         user.setAdresa(ex.getAdresa());
         user.setCode(Code);
         user.setEmail(Email);
         user.setId(ex.getId());
         user.setIdCufar(ex.getIdCufar());
         user.setNume(ex.getNume());
         user.setPrenume(ex.getPrenume());
         user.setParola(ex.getParola());
         user.setTelefon(ex.getTelefon());
         user.setVerificat(ex.getVerificat());
         userDao.updateUser(user);
         
         //call the send email method
         boolean test = sm.sendEmail(user);
         
         //check if the email send successfully
         if(test){
             HttpSession session  = request.getSession();
             session.setAttribute("Reauthcode", user);
             
             RequestDispatcher dispatcher = request.getRequestDispatcher("verifyPass.jsp");
             dispatcher.forward(request, response);
         }else{
             RequestDispatcher dispatcher = request.getRequestDispatcher("verifyError.jsp");
             dispatcher.forward(request, response);
     	   }


		   
	}
}
