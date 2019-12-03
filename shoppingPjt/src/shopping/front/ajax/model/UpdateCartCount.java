package shopping.front.ajax.model;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class UpdateCartCount implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String idx = request.getParameter("cartIdx");
			String type = request.getParameter("type");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			shoppingCartAndOrderDAO.updateShoppingCartCount(idx, type);
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}

	}

}
