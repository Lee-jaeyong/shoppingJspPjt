package shopping.front.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;
import shopping.database.dto.ShoppingCartDTO;

public class SelectShoppingCart implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			ArrayList<ShoppingCartDTO> list = shoppingCartAndOrderDAO
					.selectShoppingCart(request.getParameter("userIdx"));
			response.getWriter().write(getJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ShoppingCartDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"cartIdx\":\"" + list.get(i).getCartIdx() + "\",\"cartItemOpidx\":\""
					+ list.get(i).getItemOpIdx() + "\",\"cartUserIdx\":\"" + list.get(i).getCartUserIdx()
					+ "\",\"itemMainImg\":\"" + list.get(i).getItemMainImg() + "\",\"itemName\":\""
					+ list.get(i).getItemName() + "\",\"itemSalePrice\":\"" + list.get(i).getItemSalePrice()
					+ "\",\"cartCount\":\"" + list.get(i).getCartCount() + "\",\"itemPrice\":\""
					+ list.get(i).getItemPrice() + "\",\"optionColor\":\"" + list.get(i).getOptionColor()
					+ "\",\"optionSize\":\"" + list.get(i).getOptionSize() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
