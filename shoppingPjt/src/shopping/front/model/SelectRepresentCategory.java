package shopping.front.model;

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
		forward.setPath("WEB-INF/front/shop.jsp");
		forward.setRedirect(false);
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> list = categoryDAO.selectRepresentCategory();
			request.setAttribute("representList", list);
		}catch (Exception e) {
		}
		return forward;
	}

}
