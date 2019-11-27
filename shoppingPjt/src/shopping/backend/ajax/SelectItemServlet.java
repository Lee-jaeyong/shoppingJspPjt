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
import shopping.database.dto.ItemOptionDTO;

/**
 * Servlet implementation class SelectItemServlet
 */
@WebServlet("/SelectItemServlet")
public class SelectItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectItemServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String searchItemType = request.getParameter("searchItemType");
		String searchItemTitle = request.getParameter("searchItemTitle");
		String searchItemSmallCategory = request.getParameter("searchItemSmallCategory");
		String searchItemBefore = request.getParameter("searchItemBefore");
		String searchItemAfter = request.getParameter("searchItemAfter");

		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String sortType = request.getParameter("sortType");
		int showType = Integer.parseInt(request.getParameter("showType"));
		int showBlock = 10;
		int startBlock = pageNum / showType * showBlock;
		int endBlock = startBlock + showBlock;
		int totalBlock;
		try {
			ItemDAO itemDAO = new ItemDAO();
			totalBlock = (int) Math.ceil(itemDAO.selectCountItem() / (showBlock * 1.0));
			if (totalBlock < endBlock)
				endBlock = totalBlock;
			itemDAO = new ItemDAO();
			ArrayList<ItemDTO> list = itemDAO.selectItem(pageNum, sortType, showType, searchItemType, searchItemTitle,
					searchItemSmallCategory, searchItemBefore, searchItemAfter);
			response.getWriter().write(getJson(list, startBlock, endBlock, totalBlock));
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ItemDTO> list, int startBlock, int endBlock, int totalBlock)
			throws SQLException, NamingException {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"itemIdx\":\"" + list.get(i).getItemIdx() + "\",\"itemCode\":\"" + list.get(i).getItemCode()
					+ "\",\"itemMainImg\":\"" + list.get(i).getItemMainImg() + "\",\"itemName\":\""
					+ list.get(i).getItemName() + "\",\"itemStatus\":\"" + list.get(i).getItemStatus()
					+ "\",\"itemPrice\":\"" + list.get(i).getItemPrice() + "\",\"itemSalePrice\":\""
					+ list.get(i).getItemSalePrice() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("],\"startBlock\":\"" + startBlock + "\",\"endBlock\":\"" + endBlock + "\",\"totalBlock\":\""
				+ totalBlock + "\"}");
		return json.toString();
	}
}
