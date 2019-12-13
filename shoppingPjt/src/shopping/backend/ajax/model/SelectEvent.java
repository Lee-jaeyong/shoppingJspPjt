package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.EventDAO;
import shopping.database.dto.EventDTO;

public class SelectEvent implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			ArrayList<EventDTO> list = new EventDAO().selectEventList(pageNum);
			int totalCount = new EventDAO().selectCount();
			int startBlock = pageNum / 5 * 5;
			int endBlock = startBlock + 5;
			int totalBlock = (int) Math.ceil(totalCount / 5.0);
			if (endBlock > totalBlock)
				endBlock = totalBlock;
			response.getWriter().write(getJson(list, startBlock, endBlock, totalBlock));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<EventDTO> list, int startBlock, int endBlock, int totalBlock) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"eventIdx\":\"" + list.get(i).getEventIdx() + "\",\"eventTitle\":\""
					+ list.get(i).getEventTitle() + "\",\"eventItemIdx\":\"" + list.get(i).getEventItemIdx()
					+ "\",\"eventImg\":\"" + list.get(i).getEventImg() + "\",\"eventStart\":\""
					+ list.get(i).getEventStart() + "\",\"eventEnd\":\"" + list.get(i).getEventEnd()
					+ "\",\"itemName\":\"" + list.get(i).getItemName() + "\",\"status\":\"" + list.get(i).getStatus()
					+ "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("],\"startBlock\":\"" + startBlock + "\",\"endBlock\":\"" + endBlock + "\",\"totalBlock\":\""
				+ totalBlock + "\"}");
		return json.toString();
	}
}
