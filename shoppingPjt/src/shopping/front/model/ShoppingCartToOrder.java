package shopping.front.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;

public class ShoppingCartToOrder implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/front/checkout.jsp");
		forward.setRedirect(false);
		try {
			String shoppingCartList = request.getParameter("sendShoppingCartList");
			request.setAttribute("totalList", shoppingCartList);
			request.setAttribute("sendShoppingCartTotal", request.getParameter("sendShoppingCartTotal"));
			request.setAttribute("sendShoppingCartSubTotal", request.getParameter("sendShoppingCartSubTotal"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}


}
