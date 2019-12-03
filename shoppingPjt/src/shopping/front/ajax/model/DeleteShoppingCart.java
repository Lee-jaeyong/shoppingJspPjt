package shopping.front.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class DeleteShoppingCart implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cartIdx = request.getParameter("cartIdx");
			HttpSession session = request.getSession();
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			shoppingCartAndOrderDAO.deleteShoppingCart(cartIdx, session.getAttribute("userIdx").toString());
			response.getWriter().write("true");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
