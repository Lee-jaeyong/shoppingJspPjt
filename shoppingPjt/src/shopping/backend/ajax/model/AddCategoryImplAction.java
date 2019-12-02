package shopping.backend.ajax.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.backend.model.AddCategory;
import shopping.filter.SecureString;

public class AddCategoryImplAction implements ShoppingService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SecureString sqString = new SecureString();
		String categoryName = sqString.cleanXSS(request.getParameter("categoryName"));
		String categoryType = request.getParameter("categoryType");
		try {
			AddCategory addCategory = new AddCategory(categoryType,categoryName);
			response.getWriter().write("true");
		} catch (Exception e) {
			try {
				response.getWriter().write("false");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}		
	}
}
