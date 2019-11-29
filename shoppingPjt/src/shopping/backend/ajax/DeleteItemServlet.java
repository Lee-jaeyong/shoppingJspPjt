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
 * Servlet implementation class DeleteItemServlet
 */
@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteItemServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemIdx = Integer.parseInt(request.getParameter("data"));
		try {
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.deleteItem(itemIdx);
			response.getWriter().write("true");
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			response.getWriter().write("false");
		}
	}
}
