package hibernate.web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hibernate.dao.HibernateDao;
import hibernate.model.User;

/**
 * Servlet implementation class LogController
 */
@WebServlet("/logare")

public class LogController extends HttpServlet {
    private static final long serialVersionUID = 1L ;
    private HibernateDao userDao;

    public void init() {
        userDao = new HibernateDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	response.sendRedirect("logare.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            authenticate(request, response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //Daca emailul si parola corespund cu cele din DB atunci se realizeaza logarea
    private void authenticate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String Parola = request.getParameter("Parola");
    	String Email = request.getParameter("Email");
        User ex=userDao.selectProfil(Email);
        
        String verificat = ex.getVerificat();
        System.out.println("CHECK CODE: "+verificat);
        System.out.println("Email: "+Email);
        
        // Daca email-ul si parola sunt corecte logarea se realizeaza cu succes; 
        // se deschide pagina 'nevoiasi.jsp'
        
            if (userDao.validate(Email, Parola) && verificat.equals("Da")) {	
            	HttpSession session = request.getSession();
            	session.setAttribute("user", Email);
            	
            	RequestDispatcher dispatcher = request.getRequestDispatcher("nevoiasi.jsp");
                dispatcher.forward(request, response);
            } else if(userDao.validate(Email, Parola) && verificat.equals("Nu")){           	
                RequestDispatcher dispatcher = request.getRequestDispatcher("verify.jsp");
                dispatcher.forward(request, response);
            }
            else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("errorLogin.jsp");
                dispatcher.forward(request, response);
            }
    }
}