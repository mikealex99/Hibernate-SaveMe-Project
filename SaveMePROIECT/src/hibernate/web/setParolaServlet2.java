package hibernate.web;


import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.dao.HibernateDao;
import hibernate.model.User2;

@WebServlet("/setPassword2")
public class setParolaServlet2 extends HttpServlet {
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
			case "/setPassword2":
				setParola(request, response);
				break;
			default:
				setParola(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	
	private void setParola(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

         	String Email = request.getParameter("Email");              
     		int Id = Integer.parseInt(request.getParameter("Id_user"));	
    		int Id_UserNev=Integer.parseInt(request.getParameter("Id_UserNev"));     		
            String Parola = request.getParameter("Parola");
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Adresa= request.getParameter("Adresa");
            String Telefon= request.getParameter("Telefon");
            String Verificat= "Da";
            String code= request.getParameter("Code");
                       
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
                          
 	        RequestDispatcher dispatcher = request.getRequestDispatcher("nevoieform.jsp");
 	        dispatcher.forward(request, response);		   
	}
}
