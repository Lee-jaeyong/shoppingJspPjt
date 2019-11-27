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
import shopping.filter.SecureString;

@WebServlet("/SelectCategoryServlet")
public class SelectCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectCategoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf8");
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> list = categoryDAO.selectCategory();
			categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> smallList = categoryDAO.selectSmallCategory();
			response.getWriter().write(getJson(list, smallList));
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<CategoryDTO> list, ArrayList<CategoryDTO> smallList) {
		SecureString sqString = new SecureString();
		StringBuilder str = new StringBuilder();
		str.append("{\"category\":[");
		for (int i = 0; i < list.size(); i++) {
			str.append("{\"categoryName\" : \"" + sqString.returnString(list.get(i).getCategoryName())
					+ "\",\"categoryChkIdx\" : \"" + list.get(i).getCategoryChkIdx() + "\",\"categoryStatus\" : \""
					+ list.get(i).getCategoryStatus() + "\"}");
			if (i != list.size() - 1)
				str.append(",");
		}
		str.append("], \"smallCategory\" : [");
		for (int i = 0; i < smallList.size(); i++) {
			str.append("{\"categoryName\" : \"" + sqString.returnString(smallList.get(i).getCategoryName())
					+ "\",\"categoryChkIdx\" : \"" + smallList.get(i).getCategoryChkIdx()
					+ "\", \"categoryHighIdx\" : \"" + smallList.get(i).getCategoryHighIdx()
					+ "\"}");
			if (i != smallList.size() - 1)
				str.append(",");
		}
		str.append("]}");
		return str.toString();
	}
}
