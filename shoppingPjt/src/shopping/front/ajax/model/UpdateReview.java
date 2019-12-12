package shopping.front.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ReviewDAO;
import shopping.database.dto.ReviewDTO;
import shopping.filter.SecureString;

public class UpdateReview implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String reviewIdx = request.getParameter("reviewIdx");
			String reviewContent = request.getParameter("reviewContent");
			ReviewDAO reviewDAO = new ReviewDAO();
			ReviewDTO review = new ReviewDTO();
			review.setReviewIdx(Integer.parseInt(reviewIdx));
			review.setReviewContent(new SecureString().cleanXSS(reviewContent));
			if (reviewDAO.updateReivew(review))
				response.getWriter().write("리뷰가 수정되었습니다.");
			else
				response.getWriter().write("리뷰 수정 실패하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
