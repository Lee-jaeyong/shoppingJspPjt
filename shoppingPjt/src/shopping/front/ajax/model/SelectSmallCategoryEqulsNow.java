package shopping.front.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.CategoryDAO;
import shopping.database.dto.CategoryDTO;

public class SelectSmallCategoryEqulsNow implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> list = categoryDAO
					.selectSmallCategoryEquelsInput(request.getParameter("smallCategory"));
			response.getWriter().write(getJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<CategoryDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"categoryName\":\"" + list.get(i).getCategoryName() + "\",\"categoryNum\":\""
					+ list.get(i).getCategoryChkIdx() + "\",\"categoryStatus\":\"" + list.get(i).getCategoryStatus()
					+ "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}
}
