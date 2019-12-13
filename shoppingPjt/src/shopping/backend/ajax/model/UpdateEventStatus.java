package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.EventDAO;
import shopping.database.dto.EventDTO;

public class UpdateEventStatus implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String eventIdx = request.getParameter("eventIdx");
			String status = request.getParameter("status");
			if (status.equals("1")) {
				if (!new EventDAO().selectCheckEvent())
					response.getWriter().write("이벤트는 3개까지 등록 가능합니다.");
				else {
					updateStatus(eventIdx, status, response);
				}
			} else {
				updateStatus(eventIdx, status, response);
			}
		} catch (Exception e) {
		}
	}
	private void updateStatus(String eventIdx,String status, HttpServletResponse response) {
		try {
			EventDTO event = new EventDTO();
			event.setEventIdx(Integer.parseInt(eventIdx));
			event.setStatus(Integer.parseInt(status));
			if (new EventDAO().updateEventStatus(event))
				response.getWriter().write("이벤트 상태 수정 완료");
			else
				response.getWriter().write("이벤트 상태 수정 실패");
		}catch (Exception e) {
		}
	}
}
