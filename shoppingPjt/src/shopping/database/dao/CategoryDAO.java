package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.mysql.jdbc.PreparedStatement;

import shopping.database.dto.CategoryDTO;

public class CategoryDAO extends Database {

	public CategoryDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public ArrayList<CategoryDTO> selectSmallCategory() throws SQLException {
		ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
		try {
			String sql = "SELECT smallCategoryName ,smallCategoryIdx,categoryHighIdx,smallCategoryStatus FROM smallcategory";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new CategoryDTO(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
			}
		} catch (Exception e) {
			return null;
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return list;
	}

	public ArrayList<CategoryDTO> selectCategory() throws SQLException {
		ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
		try {
			String sql = "SELECT categoryName,categoryChkIdx,CategoryStatus FROM categorycheck";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new CategoryDTO(rs.getString(1), rs.getInt(2), rs.getInt(3)));
			}
		} catch (Exception e) {
			return null;
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return list;
	}

	public boolean insertCategory(String categoryType, String categoryName) throws SQLException {
		try {
			if (categoryType.equals("")) {
				String sql = "INSERT INTO categorycheck VALUES (?,NULL,0)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, categoryName);
			} else {
				String sql = "INSERT INTO smallcategory VALUES (NULL,?,?,0)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(categoryType));
				pstmt.setString(2, categoryName);
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			return false;
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return true;
	}

	public boolean deleteCategory(boolean categoryType, String[] categoryNumbers) throws SQLException {
		try {
			conn.setAutoCommit(false);
			if (categoryType) {
				for (int i = 0; i < categoryNumbers.length; i++) {
					String sql = "DELETE FROM smallcategory WHERE smallcategoryIdx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(categoryNumbers[i]));
					pstmt.executeUpdate();
				}
			} else {
				String sql = "DELETE FROM categorycheck WHERE categoryChkIdx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(categoryNumbers[0]));
				pstmt.executeUpdate();
				sql = "DELETE FROM smallcategory WHERE categoryHighIdx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(categoryNumbers[0]));
				pstmt.executeUpdate();
			}
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			return false;
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return true;
	}

	public boolean updateCategory(boolean categoryType, int categoryNumber, String categoryName) {
		try {
			String sql = "";
			if (categoryType)
				sql = "UPDATE categorycheck SET categoryName = ? WHERE categoryChkIdx = ?";
			else
				sql = "UPDATE smallcategory SET smallcategoryName = ? WHERE smallCategoryIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			pstmt.setInt(2, categoryNumber);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean updateCategoryStatus(int categoryNumber, int status) {
		try {
			String sql = "UPDATE categorycheck SET categoryStatus = ? WHERE categoryChkIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, categoryNumber);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}