package shopping.database.dao;

import java.sql.SQLException;

import javax.naming.NamingException;

import shopping.database.dto.UserDTO;


public class UserDAO extends Database {
	public UserDAO() throws SQLException, NamingException{
		dbConnect();
	}
	
	public boolean insertUser(UserDTO user) throws SQLException {
		String sql = "insert user values(NULL,?,?,?,?,?,?,?,1001)"; 
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUserIdenty());
		pstmt.setString(2, user.getUserName());
		pstmt.setString(3, user.getUserPass());
		pstmt.setString(4, user.getUserEmail());
		pstmt.setString(5, user.getUserPhone());
		pstmt.setString(6, user.getUserBirth());
		pstmt.setString(7, user.getUserAddress());
		int re = pstmt.executeUpdate();
		if(re == 1)
			return true;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
		return false;
		
	}
	
	public int selectDupUserId(String id) throws SQLException{
		String sql = "select count(userIdx) from user where userIdenty = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		rs.next();
		int re = rs.getInt(1);
		
		return re;
	}
	
	
}
