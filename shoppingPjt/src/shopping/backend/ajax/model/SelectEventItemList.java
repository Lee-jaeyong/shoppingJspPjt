package shopping.backend.ajax.model;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;

public class SelectEventItemList implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String categoryNum = request.getParameter("categoryNum");
			String search = request.getParameter("search");
			ItemDAO itemDAO = new ItemDAO();
			ArrayList<ItemDTO> list = itemDAO.selectEventItem(pageNum, search, categoryNum);
			itemDAO = new ItemDAO();
			int totalCount = itemDAO.selectCountItem(categoryNum, "itemName", search,"1");
			int startBlock = pageNum / 5 * 5;
			int endBlock = startBlock + 5;
			int totalBlock = (int) Math.ceil(totalCount / (5.0));
			if (endBlock > totalBlock)
				endBlock = totalBlock;
			response.getWriter().write(getJson(list, startBlock, endBlock, totalBlock));
		} catch (Exception e) {
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
