package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class DeleteOrderInfo implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			String orderIdx = request.getParameter("orderIdx");
			int status = shoppingCartAndOrderDAO.deleteOrderInfo(orderIdx);
			if (status == -1)
				response.getWriter().write("이미 배송된 주문은 취소할 수 없습니다.");
			else if (status == 1)
				response.getWriter().write("주문이 취소되었습니다.");
			else if (status == 0)
				response.getWriter().write("주문 취소 중 오류가 발생했습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
