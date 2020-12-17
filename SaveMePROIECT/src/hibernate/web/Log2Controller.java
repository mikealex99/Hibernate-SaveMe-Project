package hibernate.web;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.dao.HibernateDao;

/**
 * Servlet implementation class LogController
 */
@WebServlet("/logarenev")

public class Log2Controller extends HttpServlet {
    private static final long serialVersionUID = 1L ;
    private HibernateDao userDao;

    public void init() {
        userDao = new HibernateDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	response.sendRedirect("logarenevoi.jsp");
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
        String Email = request.getParameter("Email");
        String Parola = request.getParameter("Parola");
       
        	
            if (userDao.validare(Email, Parola)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("nevoieform.jsp");
                dispatcher.forward(request, response);
            } else {         	
                RequestDispatcher dispatcher = request.getRequestDispatcher("errorLogin2.jsp");
                dispatcher.forward(request, response);           
            }
            
    }
}