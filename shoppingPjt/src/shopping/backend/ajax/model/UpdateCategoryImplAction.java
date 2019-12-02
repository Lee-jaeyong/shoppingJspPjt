package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.CategoryDAO;
import shopping.filter.SecureString;

public class UpdateCategoryImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int categoryNumber = Integer.parseInt(request.getParameter("categoryNumber"));
		String categoryName = new SecureString().cleanXSS(request.getParameter("categoryUpdateName"));
		boolean categoryType = request.getParameter("categoryType").equals("true") ? true : false;
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			if (categoryDAO.updateCategory(categoryType,categoryNumber, categoryName))
				response.getWriter().write("true");
			else
				response.getWriter().write("false");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
