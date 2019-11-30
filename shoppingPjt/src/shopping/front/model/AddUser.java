package shopping.front.model;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.controller.Action;
import shopping.controller.ActionForward;
import shopping.database.dao.UserDAO;
import shopping.database.dto.UserDTO;
import shopping.filter.SecureString;

public class AddUser implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		UserDTO dto = null;
		SecureString secure = new SecureString();
		
		
		String userName = secure.cleanXSS(request.getParameter("inputName"));
		String userId = secure.cleanXSS(request.getParameter("inputId"));
		String userPw = secure.cleanXSS(request.getParameter("inputPw"));
		userPw = secure.MD5(userPw);
		String userPhone = secure.cleanXSS(request.getParameter("inputPh1") + request.getParameter("inputPh2") + request.getParameter("inputPh3"));
		String userEmail = secure.cleanXSS(request.getParameter("inputEmail"));
		String userBirth = secure.cleanXSS(request.getParameter("inputBirth") + request.getParameter("inputSex"));
		String userAddress = secure.cleanXSS(request.getParameter("searchAddress") + request.getParameter("inputAddress"));
		
		dto = new UserDTO(userId, userName, userPw, userEmail, userPhone, userBirth, userAddress, 1001);
		
		try {
			UserDAO dao = new UserDAO();
			boolean re = dao.insertUser(dto);
			if(re) {//완료
				forward.setRedirect(true);
				forward.setPath("./index.do");
			}else {//오류
				forward.setRedirect(false);
				forward.setPath("./join.do");
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		
		return forward;
	}
	
}
