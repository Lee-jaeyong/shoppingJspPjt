package shopping.front.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ReviewDAO;
import shopping.database.dto.ReviewDTO;

public class InsertReview implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			String nowItemIdx = request.getParameter("itemIdx");
			String reviewOption = request.getParameter("reviewOption");
			String reviewContent = request.getParameter("reviewContent");
			String reviewStar = request.getParameter("checkStar");
			ReviewDTO review = new ReviewDTO(Integer.parseInt(request.getSession().getAttribute("userIdx").toString()),
					Integer.parseInt(nowItemIdx), reviewOption, reviewContent, Integer.parseInt(reviewStar));
			ReviewDAO reviewDAO = new ReviewDAO();
			if (reviewDAO.insertReview(review))
				response.getWriter().write("리뷰 등록 완료");
			else
				response.getWriter().write("리뷰 등록 실패");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
