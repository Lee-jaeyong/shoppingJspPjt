package shopping.backend.ajax.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.ShoppingService;
import shopping.database.dao.ItemDAO;

public class UpdateItemStatusImplAction implements ShoppingService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String[] itemIdx = request.getParameter("chkIdx").split(",");
		int status = Integer.parseInt(request.getParameter("status"));
		
		try {
			ItemDAO itemDAD = new ItemDAO();
			itemDAD.updateStatus(itemIdx,status);
			response.getWriter().write("true");
		}catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().write("false");
			} catch (IOException e1) {
			}
		}		
	}
}
