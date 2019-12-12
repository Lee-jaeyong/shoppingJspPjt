package shopping.backend.ajax.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.NoticeDAO;
import shopping.database.dto.NoticeDTO;

public class SelectNotice implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			NoticeDAO noticeDAO = new NoticeDAO();
			ArrayList<NoticeDTO> list = noticeDAO.selectNoticeList(pageNum);
			response.getWriter().write(getJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<NoticeDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"noticeIdx\":\"" + list.get(i).getNoticeIdx() + "\",\"noticeTitle\":\""
					+ list.get(i).getNoticeTitle() + "\",\"noticeContent\":\"" + list.get(i).getNoticeContent()
					+ "\",\"noticeStartDate\":\"" + list.get(i).getNoticeStartDate() + "\",\"noticeEndDate\":\""
					+ list.get(i).getNoticeEndDate() + "\",\"noticeStatus\":\"" + list.get(i).getNoticeStatus()
					+ "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
