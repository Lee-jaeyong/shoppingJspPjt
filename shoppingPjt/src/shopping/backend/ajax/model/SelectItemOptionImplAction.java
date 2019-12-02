package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemOptionDTO;

public class SelectItemOptionImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		ItemDAO itemDAO;
		try {
			itemDAO = new ItemDAO();
			ArrayList<ItemOptionDTO> list = itemDAO.selectItemOption(Integer.parseInt(request.getParameter("itemIdx")));
			response.getWriter().write(getJson(list));
		} catch (Exception e) {
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
