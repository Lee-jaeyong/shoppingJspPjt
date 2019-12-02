package shopping.backend.ajax.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.CategoryDAO;

public class UpdateCategoryStatusImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			if(request.getParameter("type").equals("true"))
			categoryDAO.updateCategoryStatus(Integer.parseInt(request.getParameter("categoryNumber")),
					Integer.parseInt(request.getParameter("status")));
			else
				categoryDAO.updateSmallCategoryStatus(request.getParameter("data").split(","),Integer.parseInt(request.getParameter("status")));
			response.getWriter().write("true");
		} catch (Exception e) {
			try {
				response.getWriter().write("false");
			} catch (IOException e1) {
			}
		}		
	}
}
