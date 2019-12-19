package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.UserDTO;
import shopping.filter.SecureString;

public class UserDAO extends Database {
	public UserDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public int selectUserCount(String searchType, String search) {
		int count = 0;
		try {
			String sql = "SELECT COUNT(*) from user";
			if (!searchType.equals(""))
				sql = "SELECT COUNT(*) from user WHERE " + searchType + " like ?";
			pstmt = conn.prepareStatement(sql);
			if (!searchType.equals(""))
				pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
			closed();
		} catch (Exception e) {
			e.printStackTrace();
			closed();
		}
		return count;
	}

	public ArrayList<UserDTO> selectUserList(int pageNum, String searchType, String search) {
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {
			String sql = "SELECT userIdx,userIdenty,userName,userEmail,userPhone,userBirth,userAddress,userRank FROM user LIMIT ?,10";
			if (!searchType.equals(""))
				sql = "SELECT userIdx,userIdenty,userName,userEmail,userPhone,userBirth,userAddress,userRank FROM user WHERE "
						+ searchType + " like ? LIMIT ?,10";
			pstmt = conn.prepareStatement(sql);
			if (!searchType.equals(""))
			{
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, pageNum);
			}
			else
				pstmt.setInt(1, pageNum);
			rs = pstmt.executeQuery();
			while (rs.next())
				list.add(new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getInt(8)));
			closed();
		} catch (Exception e) {
			e.printStackTrace();
			closed();
		}
		return list;
	}

	public UserDTO selectUserInfo(String idx) {
		UserDTO user;
		try {
			String sql = "SELECT userIdx,userIdenty,userName,userEmail,userPhone,userBirth,userAddress,userRank FROM user where userIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			user = new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getInt(8));
			rs.close();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			return null;
		}
		return user;
	}

	public UserDTO userLogin(String id, String pw) {
		UserDTO user;
		try {
			String userPass = new SecureString().MD5(pw);
			String sql = "SELECT userIdx,userIdenty,userName,userEmail,userPhone,userBirth,userAddress,userRank FROM user where userIdenty = ? AND userPass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, userPass);
			rs = pstmt.executeQuery();
			rs.next();
			user = new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getInt(8));
			rs.close();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			return null;
		}
		return user;
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
			if (re == 1)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
		return false;

	}

	public int selectDupUserId(String id) throws SQLException {
		String sql = "select count(userIdx) from user where userIdenty = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();
		rs.next();
		int re = rs.getInt(1);
		rs.close();
		conn.close();
		pstmt.close();
		return re;
	}

}
