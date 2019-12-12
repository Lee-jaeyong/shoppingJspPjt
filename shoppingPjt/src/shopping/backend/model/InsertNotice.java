package shopping.backend.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.NoticeDAO;
import shopping.database.dto.NoticeDTO;
import shopping.filter.SecureString;

public class InsertNotice implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("./adminNotice.admin");
		forward.setRedirect(false);
		try {
			request.setCharacterEncoding("utf-8");
			NoticeDTO notice = new NoticeDTO();
			notice.setNoticeTitle(new SecureString().cleanXSS(request.getParameter("noticeTitle")));
			notice.setNoticeContent(new SecureString().cleanXSS(request.getParameter("noticeContent")));
			notice.setNoticeStatus(Integer.parseInt(request.getParameter("noticeStatus")));
			notice.setNoticeStartDate(request.getParameter("datepicker1"));
			notice.setNoticeEndDate(request.getParameter("datepicker2"));
			NoticeDAO noticeDAO = new NoticeDAO();
			noticeDAO.insertNotice(notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
