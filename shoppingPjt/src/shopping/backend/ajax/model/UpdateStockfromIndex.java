package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;

public class UpdateStockfromIndex implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String opIdx = request.getParameter("opIdx");
			String stock = request.getParameter("stock");
			ItemDAO itemDAO = new ItemDAO();
			if (itemDAO.updateStockFromIndex(opIdx, stock))
				response.getWriter().write("재고 수정 완료");
			else
				response.getWriter().write("재고 수정 실패");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
