package shopping.database.dao;

import java.sql.SQLException;

import javax.naming.NamingException;

public class QuestionDAO extends Database{
	public QuestionDAO() throws SQLException, NamingException {
		dbConnect();
	}
	
	public boolean insertQuestion(String userIdx, String title, String content) throws SQLException {
		String sql = "insert userquestion value(NULL,?,?,?,LEFT(NOW(),10))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userIdx);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			int re = pstmt.executeUpdate();
			if(re >0) {
				conn.close();
				pstmt.close();
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
		return false;
	}
}
