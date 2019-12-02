package shopping.front.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.action.Action;
import shopping.action.ActionForward;
import shopping.backend.ajax.model.SelectItemImplAction;
import shopping.front.ajax.model.FrontSelectItemImplShoppingService;
import shopping.front.ajax.model.UserIdDupChkImplShoppingService;
import shopping.front.model.AddUser;
import shopping.front.model.LoginUser;

@WebServlet("/AjaxShoppingfrontController")
public class AjaxShoppingfrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxShoppingfrontController() {
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

		if (command.equals("userIdDupChk.aj")) {
			new UserIdDupChkImplShoppingService().execute(request, response);
		} else if (command.equals("SelectItemList.aj")) {
			new FrontSelectItemImplShoppingService().execute(request, response);
		}
	}
}
