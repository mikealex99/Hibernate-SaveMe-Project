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
/**
 * Servlet implementation class GiftController
 */
@WebServlet("/deleteCufar2")
public class deleteCufar2Controller extends HttpServlet {
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
			case "/deleteCufar2":
				insertGift(request, response);
				break;
			default:
				insertGift(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	
	private void insertGift(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
		String Telefon= "null";
		int id = Integer.parseInt(request.getParameter("Id"));
		
		/* Adaugam data exacta 'an-luna-zi' la care utilizatorul incarca anuntul */
		String Data= request.getParameter("Data");
		
		//Stergem datele din DB,setandu-le 'null',exceptie facand 'Id' si 'Id_cufar' pentru a pastra logarea userului curent 
		Cufar cufarupdate=new Cufar();
		cufarupdate.setId(id);
		cufarupdate.setIdCufar(id_cufar);
		cufarupdate.setTelefon(Telefon);
		cufarupdate.setText(Telefon);
		cufarupdate.setTitlu(Telefon);
		cufarupdate.setData(Data);

		userDao.updateCufar(cufarupdate);
	
	    RequestDispatcher dispatcher = request.getRequestDispatcher("CufarulMagic.jsp");
	    dispatcher.forward(request, response);
		   
	}
}