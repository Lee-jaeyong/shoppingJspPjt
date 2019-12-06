package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class UpdateOrderStatus implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			String orderIdx = request.getParameter("orderIdx");
			shoppingCartAndOrderDAO.updateOrderStatus(orderIdx);
			response.getWriter().write("true");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
