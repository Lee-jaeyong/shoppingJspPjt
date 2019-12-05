package shopping.front.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.ShoppingCartAndOrderDAO;
import shopping.database.dto.OrderDTO;

public class OrderInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/front/thankyou.jsp");
		forward.setRedirect(false);
		try {
			request.setCharacterEncoding("utf-8");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			String name = request.getParameter("name");
			String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
					+ request.getParameter("phone3");
			String email = request.getParameter("email");
			String address = request.getParameter("address") + "#" + request.getParameter("address2");
			String notes = request.getParameter("notes");
			String optionCount = request.getParameter("optionCount");
			String totalOrderList = "";
			if (!request.getParameter("shoppingCartItemList").equals(""))
				totalOrderList = request.getParameter("shoppingCartItemList");
			long totalSalePrice = Long.parseLong(request.getParameter("orderSubTotal"));
			int userIdx = Integer.parseInt(request.getParameter("myInfo"));
			String shoppingCartList = request.getParameter("totalOrderList");
			boolean orderType = Boolean.parseBoolean(request.getParameter("orderType"));
			OrderDTO orderDTO = new OrderDTO(userIdx, totalOrderList.split(","), optionCount.split(","), totalSalePrice,
					address, name, phone, email, notes, shoppingCartList.split(","));
			shoppingCartAndOrderDAO.insertShoppingCartToOrder(orderDTO,orderType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
