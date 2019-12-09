package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemOptionDTO;

public class SelectShowLackOptions implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			ItemDAO itemDAO = new ItemDAO();
			ArrayList<ItemOptionDTO> list = itemDAO.selectShowLackOptions();
			response.getWriter().write(getJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ItemOptionDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"opIdx\":\"" + list.get(i).getOpIdx() + "\",\"itemName\":\"" + list.get(i).getItemName()
					+ "\",\"opSize\":\"" + list.get(i).getOpSize() + "\",\"opColor\":\"" + list.get(i).getOpColor()
					+ "\",\"opStock\":\"" + list.get(i).getOpStock() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
