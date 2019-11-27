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
 * Servlet implementation class UpdateStockServlet
 */
@WebServlet("/UpdateStockServlet")
public class UpdateStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateStockServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] updateStockIdx = request.getParameter("updateStockIdx").split(",");
		String[] updateStock = request.getParameter("updateStock").split(",");
		try {
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.updateStock(updateStockIdx, updateStock);
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		response.getWriter().write("true");
	}
}
