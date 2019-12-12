package shopping.front.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ReviewDAO;
import shopping.database.dto.ReviewDTO;

public class SelectReview implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String page = request.getParameter("pageNum");
			String itemNum = request.getParameter("itemNum");
			ReviewDAO reviewDAO = new ReviewDAO();
			ArrayList<ReviewDTO> list = reviewDAO.selectReview(Integer.parseInt(page), Integer.parseInt(itemNum));
			reviewDAO = new ReviewDAO();
			int count = reviewDAO.selectReviewCount(Integer.parseInt(itemNum));
			int totalPage = (int) Math.ceil((count / (5 * 1.0)));
			response.getWriter().write(getJson(list, totalPage));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ReviewDTO> list, int totalPage) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"userName\":\"" + list.get(i).getUserName() + "\",\"reviewTitle\":\""
					+ list.get(i).getReviewTitle() + "\",\"reviewContent\":\"" + list.get(i).getReviewContent()
					+ "\",\"reviewDate\":\"" + list.get(i).getReviewDate() + "\",\"reviewStar\":\""
					+ list.get(i).getReviewStar() + "\",\"userIdx\":\"" + list.get(i).getReviewUserIdx()
					+ "\",\"reviewIdx\":\"" + list.get(i).getReviewIdx() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("],\"totalPage\":\"" + totalPage + "\"}");
		return json.toString();
	}

}
