package shopping.front.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.front.ajax.model.DeleteOrderByUser;
import shopping.front.ajax.model.DeleteReview;
import shopping.front.ajax.model.DeleteShoppingCart;
import shopping.front.ajax.model.FrontSelectItemImplShoppingService;
import shopping.front.ajax.model.InsertReview;
import shopping.front.ajax.model.InsertShoppingCart;
import shopping.front.ajax.model.SelectMyOrderList;
import shopping.front.ajax.model.SelectReview;
import shopping.front.ajax.model.SelectSearchItem;
import shopping.front.ajax.model.SelectShoppingCart;
import shopping.front.ajax.model.SelectSmallCategoryEqulsNow;
import shopping.front.ajax.model.SelectUserInfo;
import shopping.front.ajax.model.UpdateCartCount;
import shopping.front.ajax.model.UpdateReview;
import shopping.front.ajax.model.UserIdDupChkImplShoppingService;

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
		}else if (command.equals("SelectSmallCategoryEqulsNow.aj")) {
			new SelectSmallCategoryEqulsNow().execute(request, response);
		}else if (command.equals("InsertShoppingCart.aj")) {
			new InsertShoppingCart().execute(request, response);
		}else if (command.equals("SelectShoppingCart.aj")) {
			new SelectShoppingCart().execute(request, response);
		}else if (command.equals("UpdateCartCount.aj")) {
			new UpdateCartCount().execute(request, response);
		}else if (command.equals("deleteShoppingCart.aj")) {
			new DeleteShoppingCart().execute(request, response);
		}else if (command.equals("selectUserInfo.aj")) {
			new SelectUserInfo().execute(request, response);
		}else if (command.equals("SelectSearchItem.aj")) {
			new SelectSearchItem().execute(request, response);
		}else if (command.equals("InsertReview.aj")) {
			new InsertReview().execute(request, response);
		}else if (command.equals("SelectReview.aj")) {
			new SelectReview().execute(request, response);
		}else if (command.equals("DeleteReview.aj")) {
			new DeleteReview().execute(request, response);
		}else if (command.equals("UpdateReview.aj")) {
			new UpdateReview().execute(request, response);
		}else if (command.equals("SelectMyOrderList.aj")) {
			new SelectMyOrderList().execute(request, response);
		}else if (command.equals("DeleteOrderByUser.aj")) {
			new DeleteOrderByUser().execute(request, response);
		}
	}
}