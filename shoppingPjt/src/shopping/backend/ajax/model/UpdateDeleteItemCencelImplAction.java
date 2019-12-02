package shopping.backend.ajax.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;

public class UpdateDeleteItemCencelImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int itemIdx = Integer.parseInt(request.getParameter("itemIdx"));
		try {
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.deleteItemCencel(itemIdx);
			response.getWriter().write("true");
		} catch (Exception e) {
			try {
				response.getWriter().write("false");
			} catch (IOException e1) {
			}
		}		
	}
}
