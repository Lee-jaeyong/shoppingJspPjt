package shopping.backend.model;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.database.dao.EventDAO;
import shopping.database.dto.EventDTO;
import shopping.filter.SecureString;

public class InsertEventExecute implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./adminEvent.admin");
		String savePath = request.getRealPath("uploadBest");
		int maxSize = 20 * 1024 * 1024;
		File file;
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			SecureString sqString = new SecureString();
			EventDTO event = new EventDTO();
			event.setEventItemIdx(Integer.parseInt(multi.getParameter("itemIdx")));
			if(!multi.getParameter("datepicker1").equals(""))
			{
				event.setEventStart(multi.getParameter("datepicker1"));
				event.setEventEnd(multi.getParameter("datepicker2"));
			}
			else
			{
				event.setEventStart("");
				event.setEventEnd("");
			}
			event.setEventTitle(multi.getParameter("eventTitle"));
			Enumeration efiles = multi.getFileNames();
			int i = 0;
			while (efiles.hasMoreElements()) {
				String name = (String) efiles.nextElement();
				file = multi.getFile(name);
				String str = file.getName();
				event.setEventImg(str);
			}
			EventDAO eventDAO = new EventDAO();
			eventDAO.insertEvent(event);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
