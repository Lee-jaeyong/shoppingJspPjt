package shopping.backend.model;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.ItemDAO;
import shopping.database.dto.ItemDTO;
import shopping.filter.SecureString;

public class UpdateItem implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./adminItemList.admin");
		File file = null;
		String savePath = request.getRealPath("uploadImage");
		int maxSize = 5 * 1024 * 1024;
		try {
			SecureString sqString = new SecureString();
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			String changeStatus = multi.getParameter("changeStatus");
			String itemDetailImg = multi.getParameter("originItemDetailImg");

			if (changeStatus.equals("true")) {
				File fileEx = new File(savePath + "\\" + itemDetailImg);
				fileEx.delete();
			}
			int itemIdx = Integer.parseInt(multi.getParameter("itemIdx"));
			String itemName = sqString.cleanXSS(multi.getParameter("itemName"));
			String itemManufacuter = sqString.cleanXSS(multi.getParameter("itemManufacturer"));
			String itemOrigin = sqString.cleanXSS(multi.getParameter("itemOrigin"));
			String itemContent = sqString.cleanXSS(multi.getParameter("itemContent"));
			int itemPrice = Integer.parseInt(multi.getParameter("itemPrice"));
			int itemSalePrice = Integer.parseInt(multi.getParameter("itemSaleprice"));

			if (changeStatus.equals("true")) {
				Enumeration efiles = multi.getFileNames();
				while (efiles.hasMoreElements()) {
					String name = (String) efiles.nextElement();
					file = multi.getFile(name);
					String str = file.getName();
					itemDetailImg = str;
				}
			}
			ItemDAO itemDAO = new ItemDAO();
			itemDAO.updateItem(new ItemDTO(itemIdx, itemName, itemDetailImg, itemPrice, itemSalePrice, itemManufacuter,
					itemOrigin, itemContent));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("예외 발생 : " + e);
		}
		return forward;
	}

}
