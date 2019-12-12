package shopping.backend.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.NoticeDAO;
import shopping.database.dto.NoticeDTO;
import shopping.filter.SecureString;

public class UpdateNotice implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			NoticeDTO notice = new NoticeDTO();
			notice.setNoticeIdx(Integer.parseInt(request.getParameter("noticeIdx")));
			notice.setNoticeTitle(new SecureString().cleanXSS(request.getParameter("noticeTitle")));
			notice.setNoticeContent(new SecureString().cleanXSS(request.getParameter("noticeContent")));
			NoticeDAO noticeDAO = new NoticeDAO();
			if(noticeDAO.updateNoticeInfo(notice))
				response.getWriter().write("수정 완료");
			else
				response.getWriter().write("수정 실패");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
