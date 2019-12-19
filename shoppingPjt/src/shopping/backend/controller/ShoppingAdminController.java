package shopping.backend.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.backend.model.AddItem;
import shopping.backend.model.ExcelFileUpload;
import shopping.backend.model.InsertEventExecute;
import shopping.backend.model.InsertNotice;
import shopping.backend.model.SelectItemInfo;
import shopping.backend.model.UpdateItem;
import shopping.backend.model.UpdateItemMainImg;
import shopping.backend.model.adminOrderListExcelUpload;
import shopping.database.dao.ItemDAO;

@WebServlet("/ShoppingAdminController")
public class ShoppingAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShoppingAdminController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/") + 1;
		String command = requestURI.substring(cmdIdx);

		ActionForward forward = new ActionForward();
		Action action = null;
		if (command.equals("")) {

		} else if (command.equals("adminIndex.admin")) {
			forward.setPath("WEB-INF/backend/index.jsp");
			forward.setRedirect(false);
			try {
				ItemDAO itemDAO = new ItemDAO();
				itemDAO.deleteItemCheck();
			} catch (SQLException | NamingException e) {
				e.printStackTrace();
			}
		} else if (command.equals("adminItemList.admin")) {
			forward.setPath("WEB-INF/backend/itemlist.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminAddItem.admin")) {
			if (request.getParameter("showItemInfoIdx") != null) {
				action = new SelectItemInfo();
				forward = action.execute(request, response);
			} else {
				forward.setPath("WEB-INF/backend/addItem.jsp");
				forward.setRedirect(false);
			}
		} else if (command.equals("adminAddItemExecute.admin")) {
			action = new AddItem();
			forward = action.execute(request, response);
		} else if (command.equals("adminCategoryManage.admin")) {
			forward.setPath("WEB-INF/backend/category.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminOrderList.admin")) {
			forward.setPath("WEB-INF/backend/orderlist.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminReview.admin")) {
			forward.setPath("WEB-INF/backend/review.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminAnswer.admin")) {
			forward.setPath("WEB-INF/backend/answer.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminExcelUpload.admin")) {
			action = new ExcelFileUpload();
			forward = action.execute(request, response);
		} else if (command.equals("adminOrderListExcelUpload.admin")) {
			action = new adminOrderListExcelUpload();
			forward = action.execute(request, response);
		} else if (command.equals("adminUpdateItemExecute.admin")) {
			action = new UpdateItem();
			forward = action.execute(request, response);
		} else if (command.equals("adminItemMainImgUpdate.admin")) {
			action = new UpdateItemMainImg();
			forward = action.execute(request, response);
		} else if (command.equals("adminDeleteItemList.admin")) {
			forward.setPath("WEB-INF/backend/deleteItemlist.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminNotice.admin")) {
			forward.setPath("WEB-INF/backend/notice.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminAddNotice.admin")) {
			forward.setPath("WEB-INF/backend/addNotice.jsp");
			forward.setRedirect(false);
		} else if (command.equals("addNoticeExecute.admin")) {
			action = new InsertNotice();
			forward = action.execute(request, response);
		} else if (command.equals("adminEvent.admin")) {
			forward.setPath("WEB-INF/backend/event.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminAddEvent.admin")) {
			forward.setPath("WEB-INF/backend/addEvent.jsp");
			forward.setRedirect(false);
		} else if (command.equals("addEventExecute.admin")) {
			action = new InsertEventExecute();
			forward = action.execute(request, response);
		}else if (command.equals("userList.admin")) {
			forward.setPath("WEB-INF/backend/userlist.jsp");
			forward.setRedirect(false);
		}
		
		if (forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}
}
