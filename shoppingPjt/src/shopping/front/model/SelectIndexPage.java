package shopping.front.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.CategoryDAO;
import shopping.database.dao.EventDAO;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.CategoryDTO;
import shopping.database.dto.EventDTO;
import shopping.database.dto.ItemDTO;

public class SelectIndexPage implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/front/index.jsp");
		forward.setRedirect(false);
		try {
			EventDAO eventDAO = new EventDAO();
			ItemDAO itemDAO = new ItemDAO();
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<EventDTO> list = eventDAO.selectEventList(0, 1);
			ArrayList<ItemDTO> itemList = itemDAO.selectNewItemList();
			ArrayList<CategoryDTO> categoryList = categoryDAO.selectRepresentCategory();
			request.setAttribute("eventList", list);
			request.setAttribute("newItem", itemList);
			request.setAttribute("representCategory", categoryList);
		} catch (Exception e) {
		}
		return forward;
	}

}
