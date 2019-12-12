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
			int showType = Integer.parseInt(request.getParameter("showType"));
			int startBlock = pageNum / 5 * 5;
			int endBlock = startBlock + 5;
			NoticeDAO noticeDAO = new NoticeDAO();
			int totalCount = noticeDAO.selectTotalCount(showType);
			int totalBlock = (int) Math.ceil(totalCount / (5 * 1.0));
			if (endBlock > totalBlock)
				endBlock = totalBlock;
			noticeDAO = new NoticeDAO();
			ArrayList<NoticeDTO> list = noticeDAO.selectNoticeList(pageNum,showType);
			response.getWriter().write(getJson(list, startBlock, endBlock, totalBlock));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<NoticeDTO> list, int startBlock, int endBlock, int totalBlock) {
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
		json.append("],\"startBlock\":\"" + startBlock + "\",\"endBlock\":\"" + endBlock + "\",\"totalBlock\":\""
				+ totalBlock + "\"}");
		return json.toString();
	}
}
