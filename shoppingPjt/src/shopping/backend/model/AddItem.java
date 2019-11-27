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
import shopping.database.dto.ItemDTO;
import shopping.filter.SecureString;

public class AddItem implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./adminAddItem.do");
		String fileName = "";
		String fileLength = "";
		File file = null;
		String savePath = request.getRealPath("uploadImage");
		int maxSize = 5 * 1024 * 1024;
		try {
			SecureString sqString = new SecureString();
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			int smCategoryNumber = Integer.parseInt(multi.getParameter("smallCategory"));
			String itemName = sqString.cleanXSS(multi.getParameter("itemName"));
			String itemManufacuter = sqString.cleanXSS(multi.getParameter("itemManufacturer"));
			String itemOrigin = sqString.cleanXSS(multi.getParameter("itemOrigin"));
			String itemContent = sqString.cleanXSS(multi.getParameter("itemContent"));
			int itemStatus = Integer.parseInt(multi.getParameter("itemStatus"));
			int itemPrice = Integer.parseInt(multi.getParameter("itemPrice"));
			int itemSalePrice = Integer.parseInt(multi.getParameter("itemSaleprice"));
			String[] color = multi.getParameterValues("opColorArea");
			String[] size = multi.getParameterValues("opSizeArea");
			String[] img = new String[2];
			for(int i =0;i<color.length;i++)
				color[i] = sqString.cleanXSS(color[i]);
			for(int i =0;i<size.length;i++)
				size[i] = sqString.cleanXSS(size[i]);
			Enumeration efiles = multi.getFileNames();
			int i = 0;
			while (efiles.hasMoreElements()) {
				String name = (String) efiles.nextElement();
				file = multi.getFile(name);
				String str = file.getName();
				img[i++] = str;
			}
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.insertItem(new ItemDTO(itemName, itemStatus, img[0], itemPrice, itemSalePrice, img[1], itemManufacuter, itemOrigin,
					itemContent, size, color), smCategoryNumber);
		} catch (Exception e) {
			System.out.print("예외 발생 : " + e);
		}
		return forward;
	}

}
