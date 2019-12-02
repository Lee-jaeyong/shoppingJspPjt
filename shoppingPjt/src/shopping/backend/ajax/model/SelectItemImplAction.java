package shopping.backend.ajax.model;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;
import shopping.filter.SecureString;

public class SelectItemImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");

		String searchItemType = request.getParameter("searchItemType");
		String searchItemTitle = request.getParameter("searchItemTitle");
		String searchItemSmallCategory = new SecureString().cleanXSS(request.getParameter("searchItemSmallCategory"));
		String searchItemBefore = request.getParameter("searchItemBefore");
		String searchItemAfter = request.getParameter("searchItemAfter");
		String searchItemStatus = request.getParameter("searchItemStatus");

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
					searchItemSmallCategory, searchItemBefore, searchItemAfter, searchItemStatus);
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
