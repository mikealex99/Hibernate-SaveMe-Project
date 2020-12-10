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
@WebServlet("/updateCufar")
public class updateCufarController extends HttpServlet {
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
			case "/updateCufar":
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

	//Preluam valorile introduse de user si le introducem in DB
	private void insertGift(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
		int Id = Integer.parseInt(request.getParameter("Id"));
		String Text = request.getParameter("Text");
		String Titlu = request.getParameter("Titlu");
		String Telefon= request.getParameter("Telefon");		
		/* Adaugam data exacta 'an-luna-zi' la care utilizatorul incarca anuntul */
		String Data= request.getParameter("Data");
		
		Cufar cufarupdate=new Cufar();
		cufarupdate.setId(Id);
		cufarupdate.setIdCufar(id_cufar);
		cufarupdate.setTelefon(Telefon);
		cufarupdate.setText(Text);
		cufarupdate.setTitlu(Titlu);
		cufarupdate.setData(Data);

		userDao.updateCufar(cufarupdate);
	
	    RequestDispatcher dispatcher = request.getRequestDispatcher("UsersCufar.jsp");
	    dispatcher.forward(request, response);
		   
	}
}