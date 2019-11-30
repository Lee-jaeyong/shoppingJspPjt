package shopping.front.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.controller.Action;
import shopping.controller.ActionForward;
import shopping.database.dao.UserDAO;
import shopping.database.dto.UserDTO;

public class LoginUser implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		try {
			request.setCharacterEncoding("utf-8");
			UserDAO userDAO = new UserDAO();
			UserDTO user = userDAO.userLogin(request.getParameter("loginId"), request.getParameter("loginPw"));
			if(user != null)
			{
				HttpSession session = request.getSession();
				session.setAttribute("userId", user.getUserIdenty());
				session.setAttribute("userIdx", user.getUserIdx());
				session.setAttribute("userName", user.getUserName());
				forward.setRedirect(true);
				forward.setPath("./index.do");
			}else
			{
				forward.setRedirect(true);
				forward.setPath("./index.do?error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
