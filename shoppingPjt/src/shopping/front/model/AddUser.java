package shopping.front.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.controller.Action;
import shopping.controller.ActionForward;
import shopping.database.dao.UserDAO;
import shopping.database.dto.UserDTO;
import shopping.filter.SecureString;

public class AddUser implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		try {
			request.setCharacterEncoding("utf8");

			UserDTO dto = null;
			SecureString secure = new SecureString();

			String userName = secure.cleanXSS(request.getParameter("inputName"));
			String userId = secure.cleanXSS(request.getParameter("inputId"));
			String userPw = secure.cleanXSS(request.getParameter("inputPw"));
			userPw = secure.MD5(userPw);
			String userPhone = secure.cleanXSS(request.getParameter("inputPh1") + request.getParameter("inputPh2")
					+ request.getParameter("inputPh3"));
			String userEmail = secure.cleanXSS(request.getParameter("inputEmail"));
			String userBirth = secure.cleanXSS(request.getParameter("inputBirth") + request.getParameter("inputSex"));
			String userAddress = (request.getParameter("searchAddress") + "#" + secure.cleanXSS(request.getParameter("inputAddress")));
			
			dto = new UserDTO(userId, userName, userPw, userEmail, userPhone, userBirth, userAddress, 1001);
			UserDAO dao = new UserDAO();
			dao.insertUser(dto);
			forward.setRedirect(true);
			forward.setPath("./index.do?success");
		} catch (Exception e) {
			e.printStackTrace();
			forward.setRedirect(false);
			forward.setPath("./join.do?error");
		}
		return forward;
	}

}
