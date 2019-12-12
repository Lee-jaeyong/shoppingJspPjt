package shopping.front.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ReviewDAO;

public class DeleteReview implements ShoppingService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String reviewIdx = request.getParameter("reviewIdx");
			ReviewDAO reviewDAO = new ReviewDAO();
			if(reviewDAO.deleteReview(reviewIdx))
				response.getWriter().write("리뷰 삭제 완료");
			else
				response.getWriter().write("리뷰 삭제 실패");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
