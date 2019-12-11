package shopping.front.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;
import shopping.filter.SecureString;

public class SelectSearchItem implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String search = new SecureString().cleanXSS(request.getParameter("item"));
			ItemDAO itemDAO = new ItemDAO();
			ArrayList<ItemDTO> list = itemDAO.selectSearchItem(search);
			response.getWriter().write(getJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ItemDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"itemIdx\":\"" + list.get(i).getItemIdx() + "\",\"itemCode\":\"" + list.get(i).getItemCode()
					+ "\",\"itemMainImg\":\"" + list.get(i).getItemMainImg() + "\",\"itemName\":\""
					+ list.get(i).getItemName() + "\",\"itemStatus\":\"" + list.get(i).getItemStatus()
					+ "\",\"itemPrice\":\"" + list.get(i).getItemPrice() + "\",\"itemSalePrice\":\""
					+ list.get(i).getItemSalePrice() + "\", \"itemInfo\":\"" + list.get(i).getItemContent() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
