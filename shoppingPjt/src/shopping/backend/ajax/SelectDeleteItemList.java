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
		response.setCharacterEncoding("utf-8");
		try {
			ItemDAO itemDAO = new ItemDAO();
			ArrayList<ItemDTO> list = itemDAO.selectDeleteItemList();
			response.getWriter().write(getJson(list));
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ItemDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"itemIdx\":\"" + list.get(i).getItemIdx() + "\",\"itemCode\":\"" + list.get(i).getItemCode()
					+ "\",\"itemMainImg\":\"" + list.get(i).getItemMainImg() + "\",\"itemName\":\""
					+ list.get(i).getItemName() + "\",\"itemPrice\":\""+list.get(i).getItemPrice()+ "\",\"itemSalePrice\":\"" + list.get(i).getItemSalePrice()
					+ "\",\"removeDate\":\"" + list.get(i).getRemoveDate() + "\",\"removeExecuteDate\":\""
					+ list.get(i).getRemoveExecuteDate() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
