package shopping.front.ajax.model;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;

public class FrontSelectItemImplShoppingService implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			ItemDAO itemDAO = new ItemDAO();
			int pageNum = 0;
			String sortType = "itemIdx";
			if (request.getParameter("pageNum") != null)
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			if(request.getParameter("sortType") != null)
				sortType = request.getParameter("sortType");
			int showType = 8;
			int showBlock = 10;
			int startBlock = pageNum / showType * showBlock;
			int endBlock = startBlock + showBlock;
			int totalBlock;
			String category = "41";
			if (request.getParameter("category") != null)
				category = request.getParameter("category");
			totalBlock = (int) Math.ceil(itemDAO.selectCountItem() / (showBlock * 1.0));
			if (totalBlock < endBlock)
				endBlock = totalBlock;
			itemDAO = new ItemDAO();
			ArrayList<ItemDTO> list = itemDAO.selectItem(pageNum, sortType, showType,
					"", "", category, "", "", "1");
			response.getWriter().write(getJson(list, startBlock, endBlock, totalBlock));
		} catch (Exception e) {
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
