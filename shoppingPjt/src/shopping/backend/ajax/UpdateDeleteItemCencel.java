package shopping.backend.ajax;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.database.dao.ItemDAO;

/**
 * Servlet implementation class UpdateDeleteItemCencel
 */
@WebServlet("/UpdateDeleteItemCencel")
public class UpdateDeleteItemCencel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public UpdateDeleteItemCencel() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemIdx = Integer.parseInt(request.getParameter("itemIdx"));
		try {
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.deleteItemCencel(itemIdx);
			response.getWriter().write("true");
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			response.getWriter().write("false");
		}
	}
}
