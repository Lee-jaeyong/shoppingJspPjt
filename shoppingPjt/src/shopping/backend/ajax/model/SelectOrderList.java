package shopping.backend.ajax.model;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ShoppingCartAndOrderDAO;

public class SelectOrderList implements ShoppingService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ShoppingCartAndOrderDAO shoppingCartAndOrderDAO = new ShoppingCartAndOrderDAO();
			response.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			String showType = request.getParameter("showType");
			String sortType = request.getParameter("sortType");
			
			response.getWriter().write(getJson());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getJson()
	{
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		
		json.append("}");
		return json.toString();
	}
}
