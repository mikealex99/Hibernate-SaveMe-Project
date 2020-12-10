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
import hibernate.model.Nevoie;

@WebServlet("/updNevoie")
public class updateNevoieServlet extends HttpServlet {
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
			case "/updateNevoie":
				updateNevoie(request, response);
				break;
			default:
				updateNevoie(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	//Preluam valorile introduse de user si le introducem in DB
	private void updateNevoie(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("Id"));
		int id_USERNEV = Integer.parseInt(request.getParameter("Id_UserNev"));
	 	String Bani = request.getParameter("Bani");
        String Descriere = request.getParameter("Descriere");
        String Haine = request.getParameter("Haine");
        String Document = request.getParameter("Document");
        String Nume = request.getParameter("Nume");
        String Prenume = request.getParameter("Prenume");
        String Adresa= request.getParameter("Adresa");
        String Adresa2= request.getParameter("Adresa2");
        String Telefon= request.getParameter("Telefon");
        String Mancare = request.getParameter("Mancare");
        String Status = request.getParameter("Status");
        int CodPostal = Integer.parseInt(request.getParameter("CodPostal"));
        String Ziua = request.getParameter("Ziua");
        String Anul = request.getParameter("Anul");
        String Luna = request.getParameter("Luna");
        
        Nevoie nevoie = new Nevoie();
        nevoie.setId(id);
        nevoie.setId_UserNev(id_USERNEV);
        nevoie.setBani(Bani);
        nevoie.setDescriere(Descriere);
        nevoie.setNume(Nume);
        nevoie.setPrenume(Prenume);
        nevoie.setAdresa(Adresa);
        nevoie.setAdresa2(Adresa2);
        nevoie.setTelefon(Telefon);
        nevoie.setStatus(Status);
        nevoie.setMancare(Mancare);
        nevoie.setCodPostal(CodPostal);
        nevoie.setHaine(Haine);
        nevoie.setDocument(Document);
        nevoie.setLuna(Luna);
        nevoie.setZiua(Ziua);
        nevoie.setAnul(Anul);
   
        userDao.updateNevoie(nevoie);

        RequestDispatcher dispatcher = request.getRequestDispatcher("FormularStatus.jsp");
        dispatcher.forward(request, response);
	}

}

