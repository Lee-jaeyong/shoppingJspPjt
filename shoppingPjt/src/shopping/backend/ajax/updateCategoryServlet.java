package shopping.backend.ajax;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.database.dao.CategoryDAO;
import shopping.database.dto.CategoryDTO;

@WebServlet("/updateCategoryServlet")
public class updateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateCategoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int categoryNumber = Integer.parseInt(request.getParameter("categoryNumber"));
		String categoryName = request.getParameter("categoryUpdateName");
		boolean categoryType = request.getParameter("categoryType").equals("true") ? true : false;
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			if (categoryDAO.updateCategory(categoryType,categoryNumber, categoryName))
				response.getWriter().write("true");
			else
				response.getWriter().write("false");
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}
}
