package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.NoticeDAO;

public class UpdateNoticeStatus implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String[] noticeIdx = request.getParameter("noticeIdx").split(",");
			int noticeStatus = Integer.parseInt(request.getParameter("noticeStatus"));
			for (int i = 0; i < noticeIdx.length; i++)
			{
				NoticeDAO noticeDAO = new NoticeDAO();
				noticeDAO.updateNotice(noticeIdx[i], noticeStatus);
			}
			response.getWriter().write("개시 상태가 변경되었습니다.");
		} catch (Exception e) {
			try {
				response.getWriter().write("개시 상태 변경중 문제가 발생했습니다.");
			} catch (Exception e1) {
			}
		}
	}

}
