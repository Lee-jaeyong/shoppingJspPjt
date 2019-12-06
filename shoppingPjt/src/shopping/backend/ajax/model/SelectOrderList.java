package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;
import shopping.database.dto.OrderDTO;

public class SelectOrderList implements ShoppingService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			String showType = request.getParameter("showType");
			String sortType = request.getParameter("sortType");
			String search = request.getParameter("search");
			String searchType = request.getParameter("searchType");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String showOrderStatus = request.getParameter("showOrderStatus");
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			int totalCount = shoppingCartAndOrderDAO.selectOrderCount(showOrderStatus);
			int startBlock = Integer.parseInt(pageNum) / 10 * 10;
			int endBlock = startBlock + 10;
			int totalBlock = (int) Math.ceil(totalCount / Integer.parseInt(showType));
			if (endBlock > totalBlock)
				endBlock = totalBlock;
			shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			int todayOrderCount = shoppingCartAndOrderDAO.selectTodayOrderCount();
			shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			response.getWriter().write(getJson(shoppingCartAndOrderDAO.selectOrderList(pageNum, sortType, showType,
					searchType, search, startDate, endDate,showOrderStatus), startBlock, endBlock, totalBlock,todayOrderCount));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getJson(ArrayList<OrderDTO> list, int startBlock, int endBlock, int totalBlock,int todayOrderCount) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");

		for (int i = 0; i < list.size(); i++) {
			json.append("{\"oiIdx\":\"" + list.get(i).getOrderIdx() + "\",\"orderCode\":\"" + list.get(i).getOrderCode()
					+ "\",\"orderStatus\":\"" + list.get(i).getOrderStatus() + "\",\"itemName\":\""
					+ list.get(i).getItemName() + "\",\"relationOrder\":\"" + list.get(i).getRelationOrderCount()
					+ "\",\"orderCount\":\"" + list.get(i).getTotalOrderCount() + "\",\"orderCustomer\":\""
					+ list.get(i).getName() + "\",\"orderTotalSalePrice\":\"" + list.get(i).getOrderTotalSalePrice()
					+ "\",\"orderdate\":\"" + list.get(i).getOrderDate() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}

		json.append("],\"startBlock\":\"" + startBlock + "\",\"endBlock\":\"" + endBlock + "\",\"totalBlock\":\""
				+ totalBlock + "\",\"todayOrderCount\":\""+todayOrderCount+"\"}");
		return json.toString();
	}
}
