package shopping.backend.model;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import shopping.controller.Action;
import shopping.controller.ActionForward;
import shopping.database.dao.ItemDAO;

public class UpdateItemMainImg implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./adminItemList.do");
		File file = null;
		String savePath = request.getRealPath("uploadImage");
		int maxSize = 5 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			int itemIdx = Integer.parseInt(multi.getParameter("inputChangeMainImgIdx"));
			File fileEx = new File(savePath + "\\" + multi.getParameter("originMainImg"));
			fileEx.delete();
			String itemMainImg = "";
			Enumeration efiles = multi.getFileNames();
			while (efiles.hasMoreElements()) {
				String name = (String) efiles.nextElement();
				file = multi.getFile(name);
				String str = file.getName();
				itemMainImg = str;
			}
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.updateItemMainImg(itemIdx, itemMainImg);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("예외 발생 : " + e);
		}
		return forward;
	}

}
