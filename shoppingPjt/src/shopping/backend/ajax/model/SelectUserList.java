package shopping.backend.ajax.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import shopping.action.ShoppingService;
import shopping.database.dao.UserDAO;
import shopping.database.dto.UserDTO;

public class SelectUserList implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String sortType = request.getParameter("sortType");
			String searchType = request.getParameter("searchType");
			String search = request.getParameter("searchInput");
			UserDAO userDAO = new UserDAO();
			int startBlock = pageNum / 10 * 10;
			int endBlock = startBlock + 10;
			int totalBlock = (int) Math.ceil(userDAO.selectUserCount(searchType, search) / 10.0);
			if (endBlock > totalBlock)
				endBlock = totalBlock;
			userDAO = new UserDAO();
			ArrayList<UserDTO> list = userDAO.selectUserList(pageNum, searchType, search);
			response.getWriter().write(getJson(list, startBlock, endBlock, totalBlock));
		} catch (Exception e) {
		}
	}

	private String getJson(ArrayList<UserDTO> list, int startBlock, int endBlock, int totalBlock) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", list);
			map.put("startBlock", startBlock);
			map.put("endBlock", endBlock);
			map.put("totalBlock", totalBlock);
			return new ObjectMapper().writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
	}

}
