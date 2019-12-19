package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.CategoryDAO;

public class SelectRepresentCategoryCheck implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			int categoryIdx = Integer.parseInt(request.getParameter("representCategory"));
			CategoryDAO categoryDAO = new CategoryDAO();
			if (categoryDAO.selectRepresentCategory(categoryIdx))
				response.getWriter().write("true");
			else
				response.getWriter().write("false");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
