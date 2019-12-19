package shopping.backend.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.CategoryDAO;
import shopping.database.dto.CategoryDTO;

public class SelectRepresentCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/backend/mainCategory.jsp");
		forward.setRedirect(false);
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> list = categoryDAO.selectRepresentCategory();
			categoryDAO = new CategoryDAO();
			request.setAttribute("count", categoryDAO.selectRepresentCategoryCount());
			request.setAttribute("representList", list);
		} catch (Exception e) {
		}
		return forward;
	}

}
