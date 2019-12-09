package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class SelectLackStockInfo implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			response.getWriter().write(Integer.toString(shoppingCartAndOrderDAO.selectLackStockInfo()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
