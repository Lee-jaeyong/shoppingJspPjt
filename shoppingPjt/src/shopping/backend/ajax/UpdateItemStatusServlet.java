package shopping.backend.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.database.dao.ItemDAO;

/**
 * Servlet implementation class UpdateItemStatusServlet
 */
@WebServlet("/UpdateItemStatusServlet")
public class UpdateItemStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateItemStatusServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] itemIdx = request.getParameter("chkIdx").split(",");
		int status = Integer.parseInt(request.getParameter("status"));
		
		try {
			ItemDAO itemDAD = new ItemDAO();
			itemDAD.updateStatus(itemIdx,status);
			response.getWriter().write("true");
		}catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("false");
		}
	}
}
