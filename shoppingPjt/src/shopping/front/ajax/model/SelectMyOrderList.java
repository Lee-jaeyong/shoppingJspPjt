package shopping.front.ajax.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;
import shopping.database.dto.OrderDTO;

public class SelectMyOrderList implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String userIdx = "";
			if (request.getSession().getAttribute("userIdx") != null)
				userIdx = request.getSession().getAttribute("userIdx").toString();
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			ArrayList<OrderDTO> list = shoppingCartAndOrderDAO.selectOrderListByUser(userIdx);
			shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			ArrayList<HashMap<String, String>> orderDates = shoppingCartAndOrderDAO.selectOrderDateByUser(userIdx);
			response.getWriter().write(getJson(list, orderDates));
		} catch (Exception e) {
		}
	}

	private String getJson(ArrayList<OrderDTO> list, ArrayList<HashMap<String, String>> orderDates) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", list);
			map.put("orderDates", orderDates);
			return new ObjectMapper().writeValueAsString(map);
		} catch (Exception e) {
			return null;
		}
	}
}
