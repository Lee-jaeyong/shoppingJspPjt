package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ReviewDAO;
import shopping.database.dto.ReviewDTO;

public class SelectReviewAll implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			int categorySearch = 0;
			if (request.getParameter("searchCategory") != null && !request.getParameter("searchCategory").equals("0"))
				categorySearch = Integer.parseInt(request.getParameter("searchCategory"));
			String searchInput = request.getParameter("searchInputSend");
			String searchType = request.getParameter("searchTypeSend");
			String sortType = request.getParameter("sortType");
			ReviewDAO reviewDAO = new ReviewDAO();
			ArrayList<ReviewDTO> list = reviewDAO.selectReviewAll(Integer.parseInt(pageNum), categorySearch,
					searchInput, searchType,sortType);
			reviewDAO = new ReviewDAO();
			int totalCount = reviewDAO.selectAllCount();
			int startBlock = Integer.parseInt(pageNum) / 10 * 10;
			int endBlock = startBlock + 10;
			int totalBlock = (int) Math.ceil(totalCount / (10 * 1.0));
			if (endBlock > totalBlock)
				endBlock = totalBlock;
			response.getWriter().write(getJson(list, startBlock, endBlock, totalBlock));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ReviewDTO> list, int startBlock, int endBlock, int totalBlock) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"userName\":\"" + list.get(i).getUserName() + "\",\"reviewTitle\":\""
					+ list.get(i).getReviewTitle() + "\",\"reviewContent\":\"" + list.get(i).getReviewContent()
					+ "\",\"reviewDate\":\"" + list.get(i).getReviewDate() + "\",\"reviewStar\":\""
					+ list.get(i).getReviewStar() + "\",\"userIdenty\":\"" + list.get(i).getUserIdenty()
					+ "\",\"itemName\":\"" + list.get(i).getItemName() + "\",\"reviewIdx\":\""
					+ list.get(i).getReviewIdx() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("],\"startBlock\":\"" + startBlock + "\",\"endBlock\":\"" + endBlock + "\",\"totalBlock\":\""
				+ totalBlock + "\"}");
		return json.toString();
	}
}
