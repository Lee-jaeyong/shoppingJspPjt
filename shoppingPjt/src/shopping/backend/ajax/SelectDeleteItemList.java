package shopping.backend.ajax;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;

/**
 * Servlet implementation class SelectDeleteItemList
 */
@WebServlet("/SelectDeleteItemList")
public class SelectDeleteItemList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectDeleteItemList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		try {
			ItemDAO itemDAO = new ItemDAO();
			ArrayList<ItemDTO> list = itemDAO.selectDeleteItemList(pageNum);
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}
	
	private String getJson(ArrayList<ItemDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		
		json.append("]}");
		return json.toString();
	}
}
