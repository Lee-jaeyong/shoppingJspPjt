package shopping.backend.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.CategoryDAO;

public class DeleteRepresentCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("./adminMainCategory.admin");
		forward.setRedirect(true);
		try {
			String savePath = request.getRealPath("uploadRepresentCategory");
			File fileEx = new File(savePath + "\\" + request.getParameter("representPath"));
			fileEx.delete();
			String representIdx = request.getParameter("representIdx");
			CategoryDAO categoryDAO = new CategoryDAO();
			categoryDAO.deleteRepresentCategory(representIdx);
		} catch (Exception e) {
		}
		return forward;
	}

}
