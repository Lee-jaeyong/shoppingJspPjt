package shopping.front.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.front.model.AddUser;
import shopping.front.model.EnterQuestion;
import shopping.front.model.LoginUser;
import shopping.front.model.LogoutUser;
import shopping.front.model.OrderInsert;
import shopping.front.model.SelectIndexPage;
import shopping.front.model.SelectRepresentCategory;
import shopping.front.model.ShoppingCartToOrder;
import shopping.front.model.ShowItemInfo;

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

		if (command.equals("index.do")) {
			action = new SelectIndexPage();
			forward = action.execute(request, response);
		} else if (command.equals("shop.do")) {
			action = new SelectRepresentCategory();
			forward = action.execute(request, response);
		} else if (command.equals("loginAction.do")) {
			action = new LoginUser();
			forward = action.execute(request, response);
		} else if (command.equals("single.do")) {
			action = new ShowItemInfo();
			forward = action.execute(request, response);
		} else if (command.equals("logoutAction.do")) {
			action = new LogoutUser();
			forward = action.execute(request, response);
		}else if (command.equals("cart.do")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("userIdx") != null)
			{
				forward.setPath("WEB-INF/front/cart.jsp");
				forward.setRedirect(false);
			}
			else
			{
				forward.setPath("./index.do?login");
				forward.setRedirect(true);
			}
		} else if (command.equals("order.do")) {
			action = new ShoppingCartToOrder();
			forward = action.execute(request, response);
		} else if (command.equals("join.do")) {
			forward.setPath("WEB-INF/front/join.jsp");
			forward.setRedirect(false);
		} else if (command.equals("joinSubmit.do")) {
			action = new AddUser();
			forward = action.execute(request, response);
		} else if (command.equals("thankyou.do")) {
			action = new OrderInsert();
			forward = action.execute(request, response);
		} else if (command.equals("qna.do")) {
			forward.setPath("WEB-INF/front/qna.jsp");
			forward.setRedirect(false);
		} else if (command.equals("question.do")) {
			forward.setPath("WEB-INF/front/question.jsp");
			forward.setRedirect(false);
		} else if(command.equals("enterQuestion.do")) {
			action = new EnterQuestion();
			forward = action.execute(request, response);
		} else if (command.equals("userAddress.do")) {
			forward.setPath("WEB-INF/front/address/jusoPopup.jsp");
			forward.setRedirect(false);
		} else if (command.equals("myPage.do")) {
			forward.setPath("WEB-INF/front/mypage.jsp");
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
