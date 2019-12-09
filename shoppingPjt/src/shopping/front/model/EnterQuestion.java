package shopping.front.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.QuestionDAO;
import shopping.filter.SecureString;

public class EnterQuestion implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		SecureString secure = new SecureString();
		try {
			request.setCharacterEncoding("utf-8");
			QuestionDAO dao = new QuestionDAO();
			
			String userIdx = secure.cleanXSS(request.getParameter("userIdx"));
			String title = secure.cleanXSS(request.getParameter("title"));
			String mainTxt = request.getParameter("mainTxt");
			if(dao.insertQuestion(userIdx, title, mainTxt)) {
				//질문등록 완료
				forward.setRedirect(true);
				forward.setPath("./qna.do");
			} else {
				//질문등록실패
				forward.setRedirect(true);
				forward.setPath("./question.do?fail");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
