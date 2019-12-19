package shopping.front.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class DeleteOrderByUser implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String orderCode = request.getParameter("orderIdx");
			String comment = request.getParameter("comment");
			String userIdx = request.getSession().getAttribute("userIdx").toString();
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			if (shoppingCartAndOrderDAO.deleteOrderByUser(orderCode, comment, userIdx))
				response.getWriter().write("주문이 취소되었습니다.");
			else
				response.getWriter().write("주문이 취소 중 오류가 발생했습니다.");
		} catch (Exception e) {
		}
	}

}
