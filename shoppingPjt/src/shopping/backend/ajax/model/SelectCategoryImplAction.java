package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.CategoryDAO;
import shopping.database.dto.CategoryDTO;
import shopping.filter.SecureString;

public class SelectCategoryImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf8");
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> list = categoryDAO.selectCategory();
			categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> smallList = categoryDAO.selectSmallCategory();
			response.getWriter().write(getJson(list, smallList));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<CategoryDTO> list, ArrayList<CategoryDTO> smallList) {
		SecureString sqString = new SecureString();
		StringBuilder str = new StringBuilder();
		str.append("{\"category\":[");
		for (int i = 0; i < list.size(); i++) {
			str.append("{\"categoryName\" : \"" + sqString.returnString(list.get(i).getCategoryName())
					+ "\",\"categoryChkIdx\" : \"" + list.get(i).getCategoryChkIdx() + "\",\"categoryStatus\" : \""
					+ list.get(i).getCategoryStatus() + "\"}");
			if (i != list.size() - 1)
				str.append(",");
		}
		str.append("], \"smallCategory\" : [");
		for (int i = 0; i < smallList.size(); i++) {
			str.append("{\"categoryName\" : \"" + sqString.returnString(smallList.get(i).getCategoryName())
					+ "\",\"categoryChkIdx\" : \"" + smallList.get(i).getCategoryChkIdx()
					+ "\", \"categoryHighIdx\" : \"" + smallList.get(i).getCategoryHighIdx()
					+ "\",\"categoryStatus\" : \"" + smallList.get(i).getCategoryStatus() + "\"}");
			if (i != smallList.size() - 1)
				str.append(",");
		}
		str.append("]}");
		return str.toString();
	}
}
