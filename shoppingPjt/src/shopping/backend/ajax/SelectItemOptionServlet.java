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
import shopping.database.dto.ItemOptionDTO;

/**
 * Servlet implementation class SelectItemOptionServlet
 */
@WebServlet("/SelectItemOptionServlet")
public class SelectItemOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectItemOptionServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ItemDAO itemDAO;
		try {
			itemDAO = new ItemDAO();
			ArrayList<ItemOptionDTO> list = itemDAO.selectItemOption(Integer.parseInt(request.getParameter("itemIdx")));
			response.getWriter().write(getJson(list));
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ItemOptionDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"options\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"opSize\":\"" + list.get(i).getOpSize() + "\",\"opColor\":\"" + list.get(i).getOpColor()
					+ "\",\"itemStock\":\"" + list.get(i).getOpStock() + "\",\"opIdx\":\"" + list.get(i).getOpIdx()
					+ "\"}");
			if(i != list.size()-1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
