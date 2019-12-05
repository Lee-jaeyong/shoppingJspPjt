package shopping.front.ajax.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.UserDAO;
import shopping.database.dto.UserDTO;

public class SelectUserInfo implements ShoppingService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			UserDAO userDAO = new UserDAO();
			String c_idx = request.getParameter("customer");
			UserDTO user = userDAO.selectUserInfo(c_idx);
			response.getWriter().write(getJson(user));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private String getJson(UserDTO user) {
		StringBuilder json = new StringBuilder();
		json.append("{\"userName\":\""+user.getUserName()+"\",\"userPhone\":\""+user.getUserPhone()+"\",\"userEmail\":\""+user.getUserEmail()+"\",\"userAddress\":\""+user.getUserAddress()+"\"}");
		return json.toString();
	}

}
