package shopping.backend.ajax;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.model.AddCategory;

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCategoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String categoryName = request.getParameter("categoryName");
		String categoryType = request.getParameter("categoryType");
		try {
			AddCategory addCategory = new AddCategory(categoryType,categoryName);
			response.getWriter().write("true");
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			response.getWriter().write("false");
		}
	}
}
