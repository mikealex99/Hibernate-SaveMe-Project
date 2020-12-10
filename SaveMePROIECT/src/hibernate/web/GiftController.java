package hibernate.web;


import java.io.IOException;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
@WebServlet("/insertGift")
public class GiftController extends HttpServlet {
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
			case "/insertGift":
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

	//Adaugam informatii in tabelul 'Cufar' din DB
	private void insertGift(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
		Cufar exCufar=userDao.selectCufar(id_cufar);
		int Id = Integer.parseInt(request.getParameter("Id"));
		String Text = request.getParameter("Text");
		String Titlu = request.getParameter("Titlu");
		String Telefon= request.getParameter("Telefon");
		
		/* Adaugam data exacta 'an-luna-zi' la care utilizatorul incarca anuntul */
		LocalDate date = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		Cufar cufarupdate=new Cufar();
		cufarupdate.setId(Id);
		cufarupdate.setIdCufar(exCufar.getIdCufar());
		cufarupdate.setTelefon(Telefon);
		cufarupdate.setText(Text);
		cufarupdate.setTitlu(Titlu);
		cufarupdate.setData(date.format(formatter));

		userDao.updateCufar(cufarupdate);
		System.out.println("updateComplete .......................................... ID: "+exCufar.getIdCufar());
	
	    RequestDispatcher dispatcher = request.getRequestDispatcher("CufarulMagic.jsp");
	    dispatcher.forward(request, response);
		   
	}
}