package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class SelectTotalOrderInfo implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			ArrayList<String[]> list = shoppingCartAndOrderDAO.selectTotalOrderInfo();
			response.getWriter().write(getJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<String[]> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"count\":\"" + list.get(i)[0] + "\",\"total\":\"" + list.get(i)[1] + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
