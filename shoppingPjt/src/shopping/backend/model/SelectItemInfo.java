package shopping.backend.model;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.controller.Action;
import shopping.controller.ActionForward;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;

public class SelectItemInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/backend/addItem.jsp");
		forward.setRedirect(false);
		try {
			ItemDAO itemDAO = new ItemDAO();
			ItemDTO item = itemDAO.selectItemInfo(Integer.parseInt(request.getParameter("showItemInfoIdx")));
			request.setAttribute("item", item);
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		return forward;
	}

}
