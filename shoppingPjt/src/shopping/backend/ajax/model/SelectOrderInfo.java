package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;
import shopping.database.dto.OrderDTO;

public class SelectOrderInfo implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String orderIdx = request.getParameter("orderIdx");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			ArrayList<OrderDTO> order = shoppingCartAndOrderDAO.selectOrderInfo(orderIdx);
			response.getWriter().write(getJson(order));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<OrderDTO> order) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < order.size(); i++) {
			json.append("{\"orderinfoIdx\":\"" + order.get(i).getOrderIdx() + "\",\"orderCustomer\":\""
					+ order.get(i).getName() + "\",\"orderCustomerPhone\":\"" + order.get(i).getPhone()
					+ "\",\"orderAddress\":\"" + order.get(i).getAddress() + "\",\"orderCustomerRequest\":\""
					+ order.get(i).getNotes() + "\",\"itemName\":\"" + order.get(i).getItemName() + "\",\"opColor\":\""
					+ order.get(i).getItemColor() + "\",\"opSize\":\"" + order.get(i).getItemSize()
					+ "\",\"orderCount\":\"" + order.get(i).getTotalOrderCount() + "\"}");
			if (i != order.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
