package shopping.backend.ajax.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ChartDAO;
import shopping.database.dto.ChartDTO;

public class SelectAreaChart implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ChartDAO chartDAO = new ChartDAO();
			ArrayList<ChartDTO> list = chartDAO.selectAreaChart();
			response.getWriter().write(getJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getJson(ArrayList<ChartDTO> list) {
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"count\":\"" + list.get(i).getCount() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		return json.toString();
	}

}
