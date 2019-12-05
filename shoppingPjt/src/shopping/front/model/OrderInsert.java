package shopping.front.model;

import java.sql.SQLException;

import javax.naming.NamingException;
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
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			String name = request.getParameter("name");
			String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
					+ request.getParameter("phone3");
			String email = request.getParameter("email");
			String address = request.getParameter("address") + "#" + request.getParameter("address2");
			String notes = request.getParameter("notes");
			String optionCount = request.getParameter("optionCount");
			String totalOrderList = request.getParameter("totalOrderList");
			long totalSalePrice = Long.parseLong(request.getParameter("orderSubTotal"));
			int userIdx = Integer.parseInt(request.getParameter("myInfo"));
			String shoppingCartList = request.getParameter("shoppingCartItemList");
			OrderDTO orderDTO = new OrderDTO(userIdx, totalOrderList.split(","), optionCount.split(","), totalSalePrice,
					address, name, phone, email, notes, shoppingCartList.split(","));
					System.out.println(orderDTO.getShoppingCartList()[0]);
			shoppingCartAndOrderDAO.insertShoppingCartToOrder(orderDTO);
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		return forward;
	}

}
