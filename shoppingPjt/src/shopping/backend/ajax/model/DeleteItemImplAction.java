package shopping.backend.ajax.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;

public class DeleteItemImplAction implements ShoppingService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int itemIdx = Integer.parseInt(request.getParameter("data"));
		try {
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.deleteItem(itemIdx);
			response.getWriter().write("true");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().write("false");
			} catch (IOException e1) {
			}
		}		
	}
}
