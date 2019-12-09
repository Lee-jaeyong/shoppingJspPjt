package shopping.backend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.ajax.model.AddCategoryImplAction;
import shopping.backend.ajax.model.DeleteItemImplAction;
import shopping.backend.ajax.model.DeleteOrderInfo;
import shopping.backend.ajax.model.SelectAreaChart;
import shopping.backend.ajax.model.SelectBarChart;
import shopping.backend.ajax.model.SelectCategoryImplAction;
import shopping.backend.ajax.model.SelectDeleteItemListImplAction;
import shopping.backend.ajax.model.SelectItemImplAction;
import shopping.backend.ajax.model.SelectItemOptionImplAction;
import shopping.backend.ajax.model.SelectOrderInfo;
import shopping.backend.ajax.model.SelectOrderList;
import shopping.backend.ajax.model.UpdateCategoryImplAction;
import shopping.backend.ajax.model.UpdateCategoryStatusImplAction;
import shopping.backend.ajax.model.UpdateDeleteItemCencelImplAction;
import shopping.backend.ajax.model.UpdateItemStatusImplAction;
import shopping.backend.ajax.model.UpdateOrderInfoSuccess;
import shopping.backend.ajax.model.UpdateOrderStatus;
import shopping.backend.ajax.model.UpdateStockImplAction;

@WebServlet("/AjaxShoppingController")
public class AjaxShoppingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxShoppingController() {
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

		if (command.equals("AddCategory.ajax")) {
			new AddCategoryImplAction().execute(request, response);
		} else if (command.equals("DeleteItem.ajax")) {
			new DeleteItemImplAction().execute(request, response);
		} else if (command.equals("SelectCategory.ajax")) {
			new SelectCategoryImplAction().execute(request, response);
		} else if (command.equals("SelectDeleteItemList.ajax")) {
			new SelectDeleteItemListImplAction().execute(request, response);
		} else if (command.equals("SelectItem.ajax")) {
			new SelectItemImplAction().execute(request, response);
		} else if (command.equals("SelectItemOption.ajax")) {
			new SelectItemOptionImplAction().execute(request, response);
		} else if (command.equals("UpdateCategoryStatus.ajax")) {
			new UpdateCategoryStatusImplAction().execute(request, response);
		} else if (command.equals("UpdateCategory.ajax")) {
			new UpdateCategoryImplAction().execute(request, response);
		} else if (command.equals("UpdateCategory.ajax")) {
			new UpdateCategoryImplAction().execute(request, response);
		} else if (command.equals("UpdateDeleteItemCencel.ajax")) {
			new UpdateDeleteItemCencelImplAction().execute(request, response);
		} else if (command.equals("UpdateItemStatus.ajax")) {
			new UpdateItemStatusImplAction().execute(request, response);
		} else if (command.equals("UpdateStock.ajax")) {
			new UpdateStockImplAction().execute(request, response);
		} else if (command.equals("SelectOrderList.ajax")) {
			new SelectOrderList().execute(request, response);
		}else if (command.equals("SelectOrderInfo.ajax")) {
			new SelectOrderInfo().execute(request, response);
		}else if (command.equals("UpdateOrderStatus.ajax")) {
			new UpdateOrderStatus().execute(request, response);
		}else if (command.equals("DeleteOrderInfo.ajax")) {
			new DeleteOrderInfo().execute(request, response);
		}else if (command.equals("UpdateOrderInfoSuccess.ajax")) {
			new UpdateOrderInfoSuccess().execute(request, response);
		}else if (command.equals("SelectBarChart.ajax")) {
			new SelectBarChart().execute(request, response);
		}else if (command.equals("SelectAreaChart.ajax")) {
			new SelectAreaChart().execute(request, response);
		}
	}
}
