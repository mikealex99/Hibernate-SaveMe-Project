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
import hibernate.model.User2;

@WebServlet("/VerifyCodePass2")
public class verifyCodePasswordServlet2 extends HttpServlet {
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
			case "/VerifyCodePass2":
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
		 	
		 HttpSession session = request.getSession();
         User2 user= (User2) session.getAttribute("Reauthcode2");
         
         String code = request.getParameter("Reauthcode2");
         String Email = request.getParameter("Email");
         
         if(code.equals(user.getCode())){
             System.out.println("Verification Done");
             System.out.println("Email: "+Email);
                         
     		int Id = Integer.parseInt(request.getParameter("Id_user"));	
    		int Id_UserNev=Integer.parseInt(request.getParameter("Id_UserNev"));
     		
            String Parola = request.getParameter("Parola");
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Adresa= request.getParameter("Adresa");
            String Telefon= request.getParameter("Telefon");
            String Verificat= "Da";
                       
            User2 userupdate = new User2();
            
            userupdate.setId(Id);
            userupdate.setId_UserNev(Id_UserNev);
            userupdate.setEmail(Email);
            userupdate.setParola(Parola);
            userupdate.setCode(code);
            userupdate.setNume(Nume);
            userupdate.setPrenume(Prenume);
            userupdate.setAdresa(Adresa);
            userupdate.setTelefon(Telefon);
            userupdate.setVerificat(Verificat);
            
    		userDao.updateUser2(userupdate);
                          
 	        RequestDispatcher dispatcher = request.getRequestDispatcher("setparola2.jsp");
 	        dispatcher.forward(request, response);
         }else{
             System.out.println("Incorrect verification code");
             
 	        RequestDispatcher dispatcher = request.getRequestDispatcher("verifyError.jsp");
 	        dispatcher.forward(request, response);
         }


		   
	}
}
