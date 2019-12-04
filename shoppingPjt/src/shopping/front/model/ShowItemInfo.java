package shopping.front.model;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.CategoryDAO;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;

public class ShowItemInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/front/single.jsp");
		forward.setRedirect(false);
		if (request.getParameter("itemNumber") == null) {
			forward.setPath("index.do");
			forward.setRedirect(true);
			return forward;
		}
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			ItemDAO itemDAO = new ItemDAO();
			String[] info = categoryDAO.selectCategoryIntoSingle(request.getParameter("itemNumber"));
			ItemDTO itemDTO = itemDAO.selectItemInfo(Integer.parseInt(request.getParameter("itemNumber")));
			itemDAO = new ItemDAO();
			ArrayList<ItemDTO> itemOption = itemDAO.selectItemOptionSingle(request.getParameter("itemNumber")); 
			request.setAttribute("categoryInfo", info);
			request.setAttribute("itemInfo", itemDTO);
			request.setAttribute("itemOption", itemOption);
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		return forward;
	}

}
