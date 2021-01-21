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
import hibernate.model.Cufar;
import hibernate.model.User;

/**
 * Servlet implementation class updateProfil
 */
@WebServlet("/updateProfilServlet")
public class updateProfil extends HttpServlet {
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
			case "/updateUser":
				updateUser(request, response);
				break;
			default:
				updateUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	//Preluam valorile introduse de user si le incarcam in DB
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
		Cufar exCufar=userDao.selectCufar(id_cufar);
		int Id = Integer.parseInt(request.getParameter("Id_user"));	
		
        String Email = request.getParameter("Email");
        String Parola = request.getParameter("Parola");
        String Nume = request.getParameter("Nume");
        String Prenume = request.getParameter("Prenume");
        String Adresa= request.getParameter("Adresa");
        String Telefon= request.getParameter("Telefon");
        String Verificat = request.getParameter("Verificat");
        String Code= request.getParameter("Code");
        
        User userupdate = new User();
        
        userupdate.setIdCufar(exCufar.getIdCufar());
        userupdate.setId(Id);
        userupdate.setEmail(Email);
        userupdate.setParola(Parola);
        userupdate.setNume(Nume);
        userupdate.setPrenume(Prenume);
        userupdate.setAdresa(Adresa);
        userupdate.setTelefon(Telefon);
        userupdate.setVerificat(Verificat);
        userupdate.setCode(Code);
        
		userDao.updateUser(userupdate);
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("nevoiasi.jsp");
        dispatcher.forward(request, response);
	}

}
