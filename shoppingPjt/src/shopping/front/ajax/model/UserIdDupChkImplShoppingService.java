package shopping.front.ajax.model;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.UserDAO;
import shopping.filter.SecureString;

public class UserIdDupChkImplShoppingService implements ShoppingService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SecureString secure = new SecureString();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		String inputId = secure.cleanXSS(request.getParameter("inputId"));
		
		try {
			UserDAO dao = new UserDAO();
			int dup = dao.selectDupUserId(inputId);
				response.getWriter().write(Integer.toString(dup));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}


}
