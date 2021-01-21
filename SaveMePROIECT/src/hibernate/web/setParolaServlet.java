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
import hibernate.model.User;

@WebServlet("/setPassword")
public class setParolaServlet extends HttpServlet {
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
			case "/setPassword":
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
    		int Id_cufar=Integer.parseInt(request.getParameter("Id_cufar"));     		
            String Parola = request.getParameter("Parola");
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Adresa= request.getParameter("Adresa");
            String Telefon= request.getParameter("Telefon");
            String Verificat= "Da";
            String code= request.getParameter("Code");
                       
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
	}
}
