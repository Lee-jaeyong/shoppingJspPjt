package shopping.backend.model;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.CategoryDAO;

public class InsertRepresentCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("./adminMainCategory.admin");
		forward.setRedirect(true);
		File file = null;
		String savePath = request.getRealPath("uploadRepresentCategory");
		int maxSize = 20 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			int smallCategory = Integer.parseInt(multi.getParameter("category"));
			String fileName = "";
			Enumeration efiles = multi.getFileNames();
			while (efiles.hasMoreElements()) {
				String name = (String) efiles.nextElement();
				file = multi.getFile(name);
				String str = file.getName();
				fileName = str;
			}
			CategoryDAO categoryDAO = new CategoryDAO();
			categoryDAO.insertRepresentCategory(smallCategory, fileName);
		} catch (Exception e) {
		}
		return forward;
	}

}
