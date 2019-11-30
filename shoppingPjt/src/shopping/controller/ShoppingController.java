package shopping.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.model.AddItem;
import shopping.backend.model.ExcelFileUpload;
import shopping.backend.model.SelectItemInfo;
import shopping.backend.model.UpdateItem;
import shopping.backend.model.UpdateItemMainImg;
import shopping.database.dao.ItemDAO;
import shopping.front.model.AddUser;

@WebServlet("/ShoppingAdminController")
public class ShoppingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShoppingController() {
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

		} else if (command.equals("adminIndex.do")) {
			forward.setPath("WEB-INF/backend/index.jsp");
			forward.setRedirect(false);
			try {
				ItemDAO itemDAO = new ItemDAO();
				itemDAO.deleteItemCheck();
			} catch (SQLException | NamingException e) {
				e.printStackTrace();
			}
		} else if (command.equals("adminItemList.do")) {
			forward.setPath("WEB-INF/backend/itemlist.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminAddItem.do")) {
			if (request.getParameter("showItemInfoIdx") != null) {
				action = new SelectItemInfo();
				forward = action.execute(request, response);
			} else {
				forward.setPath("WEB-INF/backend/addItem.jsp");
				forward.setRedirect(false);
			}
		} else if (command.equals("adminAddItemExecute.do")) {
			action = new AddItem();
			forward = action.execute(request, response);
		} else if (command.equals("adminCategoryManage.do")) {
			forward.setPath("WEB-INF/backend/category.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminOrderList.do")) {
			forward.setPath("WEB-INF/backend/orderlist.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminReview.do")) {
			forward.setPath("WEB-INF/backend/review.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminAnswer.do")) {
			forward.setPath("WEB-INF/backend/answer.jsp");
			forward.setRedirect(false);
		} else if (command.equals("adminExcelUpload.do")) {
			action = new ExcelFileUpload();
			forward = action.execute(request, response);
		} else if (command.equals("adminUpdateItemExecute.do")) {
			action = new UpdateItem();
			forward = action.execute(request, response);
		} else if (command.equals("adminItemMainImgUpdate.do")) {
			action = new UpdateItemMainImg();
			forward = action.execute(request, response);
		} else if (command.equals("adminDeleteItemList.do")) {
			forward.setPath("WEB-INF/backend/deleteItemlist.jsp");
			forward.setRedirect(false);
		}
		//// 프론트////
		  else if (command.equals("index.do")) {
			forward.setPath("WEB-INF/front/index.jsp");
			forward.setRedirect(false);
		} else if (command.equals("shop.do")) {
			forward.setPath("WEB-INF/front/shop.jsp");
			forward.setRedirect(false);
		} else if (command.equals("single.do")) {
			forward.setPath("WEB-INF/front/shop-single.jsp");
			forward.setRedirect(false);
		} else if (command.equals("cart.do")) {
			forward.setPath("WEB-INF/front/cart.jsp");
			forward.setRedirect(false);
		} else if (command.equals("order.do")) {
			forward.setPath("WEB-INF/front/checkout.jsp");
			forward.setRedirect(false);
		} else if (command.equals("join.do")) {
			forward.setPath("WEB-INF/front/join.jsp");
			forward.setRedirect(false);
		} else if(command.equals("joinSubmit.do")) {
			action = new AddUser();
			forward = action.execute(request, response);
		} else if (command.equals("thankyou.do")) {
			forward.setPath("WEB-INF/front/thankyou.jsp");
			forward.setRedirect(false);
		} else if (command.equals("qna.do")) {
			forward.setPath("WEB-INF/front/q-and-a.jsp");
			forward.setRedirect(false);
		} else if (command.equals("question.do")) {
			forward.setPath("WEB-INF/front/question.jsp");
			forward.setRedirect(false);
		} else if(command.equals("userAddress.do")) {
			forward.setPath("WEB-INF/front/address/jusoPopup.jsp");
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
