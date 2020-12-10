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


@WebServlet("/deleteNevoiepage")
public class deleteNevoiepageController extends HttpServlet {
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
			case "/deleteNevoie":
				deleteNevoie(request, response);
				break;
			default:
				deleteNevoie(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}


	private void deleteNevoie(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int Id_UserNev = Integer.parseInt(request.getParameter("Id_UserNev"));
		int Id = Integer.parseInt(request.getParameter("Id"));   	
        String var = "null";
		
		//Stergem datele din DB,setandu-le 'null',exceptie facand 'Id' si 'Id_UserNev' pentru a pastra logarea userului curent 
		  Nevoie nevoie = new Nevoie();
	        nevoie.setBani(var);
	        nevoie.setStatus(var);
	        nevoie.setDescriere(var);
	        nevoie.setNume(var);
	        nevoie.setPrenume(var);
	        nevoie.setAdresa(var);
	        nevoie.setAdresa2(var);
	        nevoie.setTelefon(var);
	        nevoie.setMancare(var);
	        nevoie.setCodPostal(0);
	        nevoie.setHaine(var);
	        nevoie.setLuna(var);
	        nevoie.setZiua(var);
	        nevoie.setAnul(var);
	        nevoie.setDocument(var);
	        nevoie.setId(Id);
			nevoie.setId_UserNev(Id_UserNev);
	        
			userDao.updateNevoie(nevoie);
	
	        RequestDispatcher dispatcher = request.getRequestDispatcher("FormularStatus.jsp");
	        dispatcher.forward(request, response);
	        System.out.println("Nevoiasul  Id:"+Id+" a fost sters.");
	}
}
