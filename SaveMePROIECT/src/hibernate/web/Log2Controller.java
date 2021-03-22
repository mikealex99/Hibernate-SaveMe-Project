package hibernate.web;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.dao.HibernateDao;
import hibernate.model.User2;

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
        User2 ex=userDao.selectProfil2(Email);
        
        String verificat = ex.getVerificat();
        System.out.println("CHECK CODE: "+verificat);
        System.out.println("Email: "+Email);
       
        // Daca email-ul si parola sunt corecte logarea se realizeaza cu succes; 
        // se deschide pagina 'nevoieform.jsp'	
            if (userDao.validare(Email, Parola) && verificat.equals("Da")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("nevoieform.jsp");
                dispatcher.forward(request, response);
            }else if(userDao.validare(Email, Parola) && verificat.equals("Nu")){           	
                RequestDispatcher dispatcher = request.getRequestDispatcher("verify2.jsp");
                dispatcher.forward(request, response);
            } 
            else {         	
                RequestDispatcher dispatcher = request.getRequestDispatcher("errorLogin2.jsp");
                dispatcher.forward(request, response);           
            }
            
    }
}