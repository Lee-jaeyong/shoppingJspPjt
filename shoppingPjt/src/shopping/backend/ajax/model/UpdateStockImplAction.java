package shopping.backend.ajax.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;

public class UpdateStockImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String[] updateStockIdx = request.getParameter("updateStockIdx").split(",");
		String[] updateStock = request.getParameter("updateStock").split(",");
		try {
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.updateStock(updateStockIdx, updateStock);
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		try {
			response.getWriter().write("true");
		} catch (IOException e) {
		}
	}
}
