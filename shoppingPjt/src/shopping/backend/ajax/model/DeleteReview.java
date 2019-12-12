package shopping.backend.ajax.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ReviewDAO;

public class DeleteReview implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String reviewList = request.getParameter("reviewIdx");
			ReviewDAO reviewDAO = new ReviewDAO();
			String[] review = reviewList.split(",");
			for (int i = 0; i < review.length; i++) {
				reviewDAO = new ReviewDAO();
				if (!reviewDAO.deleteReview(review[i]))
					new Exception();
			}
			response.getWriter().write("리뷰 삭제 완료");
		} catch (Exception e) {
			try {
				response.getWriter().write("리뷰 삭제 실패");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

}
