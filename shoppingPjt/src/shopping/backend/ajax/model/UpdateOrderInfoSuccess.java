package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class UpdateOrderInfoSuccess implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			String orderIdx = request.getParameter("orderIdx");
			if(shoppingCartAndOrderDAO.updateOrderInfoSuccess(orderIdx))
				response.getWriter().write("배송 완료 상태로 변경하였습니다.");
			else
				response.getWriter().write("배송 상태 변경 후 완료 처리해주시기 바랍니다.");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
