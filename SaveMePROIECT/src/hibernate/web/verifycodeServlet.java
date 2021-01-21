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
import hibernate.model.User;

@WebServlet("/VerifyCode")
public class verifycodeServlet extends HttpServlet {
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
			case "/VerifyCode":
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
         User user= (User) session.getAttribute("authcode");
         
         String code = request.getParameter("authcode");
         String Email = request.getParameter("Email");
         
         if(code.equals(user.getCode())){
             System.out.println("Verification Done");
             System.out.println("Email: "+Email);
                         
     		int Id = Integer.parseInt(request.getParameter("Id_user"));	
    		int Id_cufar=Integer.parseInt(request.getParameter("Id_cufar"));
     		
            String Parola = request.getParameter("Parola");
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Adresa= request.getParameter("Adresa");
            String Telefon= request.getParameter("Telefon");
            String Verificat= "Da";
                       
            User userupdate = new User();
            
            userupdate.setId(Id);
            userupdate.setIdCufar(Id_cufar);
            userupdate.setEmail(Email);
            userupdate.setParola(Parola);
            userupdate.setCode(code);
            userupdate.setNume(Nume);
            userupdate.setPrenume(Prenume);
            userupdate.setAdresa(Adresa);
            userupdate.setTelefon(Telefon);
            userupdate.setVerificat(Verificat);
            
    		userDao.updateUser(userupdate);
                          
 	        RequestDispatcher dispatcher = request.getRequestDispatcher("nevoiasi.jsp");
 	        dispatcher.forward(request, response);
         }else{
             System.out.println("Incorrect verification code");
             
 	        RequestDispatcher dispatcher = request.getRequestDispatcher("verifyError.jsp");
 	        dispatcher.forward(request, response);
         }


		   
	}
}
