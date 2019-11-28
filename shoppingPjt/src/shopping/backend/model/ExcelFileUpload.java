package shopping.backend.model;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.controller.Action;
import shopping.controller.ActionForward;
import shopping.database.dao.ItemDAO;

public class ExcelFileUpload implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("WEB-INF/backend/excel/excelUpload.jsp");
		forward.setRedirect(false);
		String[] query = request.getParameter("query").split(",");
		String[] header = request.getParameter("header").split(",");
		ArrayList<String> newHeader = new ArrayList<String>();
		boolean chkHeader = true;

		for (int i = 0; i < header.length; i++) {
			if (header[i].equals("옵션및 재고"))
				chkHeader = false;
			else
				newHeader.add(header[i]);
		}
		if (!chkHeader) {
			newHeader.add("사이즈");
			newHeader.add("색상");
			newHeader.add("재고");
		}
		header = new String[newHeader.size()];
		for (int i = 0; i < header.length; i++)
			header[i] = newHeader.get(i);
		try {
			ItemDAO itemDAO = new ItemDAO();
			request.setAttribute("list", itemDAO.selectItemFromExcel(query, header));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
