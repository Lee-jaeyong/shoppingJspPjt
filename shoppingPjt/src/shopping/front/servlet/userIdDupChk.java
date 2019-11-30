package shopping.front.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.database.dao.UserDAO;
import shopping.filter.SecureString;

/**
 * Servlet implementation class userIdDupChk
 */
@WebServlet("/userIdDupChk")
public class userIdDupChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public userIdDupChk() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SecureString secure = new SecureString();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String inputId = secure.cleanXSS(request.getParameter("inputId"));
		
		try {
			UserDAO dao = new UserDAO();
			int dup = dao.selectDupUserId(inputId);
				response.getWriter().write(Integer.toString(dup));
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
				
	}


}
