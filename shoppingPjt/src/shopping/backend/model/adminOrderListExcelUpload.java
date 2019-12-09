package shopping.backend.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class adminOrderListExcelUpload implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/backend/excel/OrderExcelUpload.jsp");
		forward.setRedirect(false);
		try {
			String status = request.getParameter("status");
			String[] header = new String[] { "주문자 명", "상품명", "주문 수량", "주 소", "주문 일" };
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			ArrayList<String[]> list = shoppingCartAndOrderDAO.selectOrderExcelUpload(header, status);
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
