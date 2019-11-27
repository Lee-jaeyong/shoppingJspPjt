package shopping.backend.ajax;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.database.dao.CategoryDAO;
import shopping.database.dto.CategoryDTO;
import shopping.filter.SecureString;

@WebServlet("/updateSmallCategoryStatusServlet")
public class updateSmallCategoryStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateSmallCategoryStatusServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
