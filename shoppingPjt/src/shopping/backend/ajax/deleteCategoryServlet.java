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

@WebServlet("/deleteCategoryServlet")
public class deleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public deleteCategoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] categoryNumbers = request.getParameter("data").split(",");
		boolean categoryType = request.getParameter("type").equals("true") ? true : false;
		CategoryDAO categoryDAO = null;
		try {
			categoryDAO = new CategoryDAO();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (NamingException e1) {
			e1.printStackTrace();
		}
		try {
			categoryDAO.deleteCategory(categoryType, categoryNumbers);
		} catch (SQLException e) {
			response.getWriter().write("false");
		}
		response.getWriter().write("true");
	}
}
