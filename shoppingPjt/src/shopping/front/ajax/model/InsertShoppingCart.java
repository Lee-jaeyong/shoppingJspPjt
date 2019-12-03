package shopping.front.ajax.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class InsertShoppingCart implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String userId = request.getParameter("userId");
			String shoppingCartCount = request.getParameter("shoppingCartCount");
			String optionIdx = request.getParameter("optionIdx");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			if(shoppingCartAndOrderDAO.insertShoppingCart(userId, shoppingCartCount, optionIdx))
				response.getWriter().write("true");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().write("false");
			} catch (IOException e1) {
			}
		}
	}
}
