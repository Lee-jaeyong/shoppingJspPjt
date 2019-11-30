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
import shopping.database.dto.UserDTO;
import shopping.filter.SecureString;

@WebServlet("/UserJoinServlet")
public class UserJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserJoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDTO dto = null;
		SecureString secure = new SecureString();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String userName = secure.cleanXSS(request.getParameter("inputName"));
		String userId = secure.cleanXSS(request.getParameter("inputId"));
		String userPw = secure.cleanXSS(request.getParameter("inputPw"));
		userPw = secure.MD5(userPw);
		String userPhone = secure.cleanXSS(request.getParameter("inputPhone"));
		String userEmail = secure.cleanXSS(request.getParameter("inputEmail"));
		String userBirth = secure.cleanXSS(request.getParameter("inputBirth"));
		String userAddress = secure.cleanXSS(request.getParameter("inputAddress"));
		
		dto = new UserDTO(userId, userName, userPw, userEmail, userPhone, userBirth, userAddress, 1001);
		
		try {
			UserDAO dao = new UserDAO();
			boolean re = dao.insertUser(dto);
			if(re) {
				response.getWriter().write("회원가입이 완료되었습니다.");
			}else {
				response.getWriter().write("회원가입중 오류가 발생하였습니다.");
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		
	}


}
