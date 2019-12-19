package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.EventDAO;

public class DeleteEvent implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			int eventIdx = Integer.parseInt(request.getParameter("idx"));
			EventDAO eventDAO = new EventDAO();
			if (eventDAO.deleteEvent(eventIdx))
				response.getWriter().write("이벤트 삭제 완료");
			else
				response.getWriter().write("이벤트 삭제 실패");
		} catch (Exception e) {
		}
	}

}
