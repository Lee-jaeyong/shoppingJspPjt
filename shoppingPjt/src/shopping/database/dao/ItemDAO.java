package shopping.database.dao;

import java.sql.SQLException;

import javax.naming.NamingException;

import shopping.database.dto.ItemDTO;
import shopping.filter.SecureString;

public class ItemDAO extends Database {
	public ItemDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public boolean insertItem(ItemDTO item, int smallCategoryNumber) throws SQLException {
		try {
			conn.setAutoCommit(false);
			String sql = "INSERT INTO items VALUES (NULL,'',?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item.getItemName());
			pstmt.setInt(2, item.getItemStatus());
			pstmt.setString(3, item.getItemDetailImg());
			pstmt.setLong(4, item.getItemPrice());
			pstmt.setLong(5, item.getItemSalePrice());
			pstmt.setString(6, item.getItemMainImg());
			pstmt.setString(7, item.getItemManufacuter());
			pstmt.setString(8, item.getItemOrigin());
			pstmt.setString(9, item.getItemContent());
			pstmt.executeUpdate();
			sql = "select max(itemIdx) from items";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int itemIdx = rs.getInt(1);
			sql = "INSERT INTO category VALUES (NULL,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, smallCategoryNumber);
			pstmt.executeUpdate();
			for (int i = 0; i < item.getItemSize().length; i++) {
				for (int j = 0; j < item.getItemColor().length; j++) {
					sql = "INSERT INTO itemoptions VALUES (NULL,?,?,?,0)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, itemIdx);
					pstmt.setString(2, item.getItemSize()[i]);
					pstmt.setString(3, item.getItemColor()[j]);
					pstmt.executeUpdate();
				}
			}
			sql = "update items set itemCode = ? where itemIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, new SecureString().MD5(Integer.toString(itemIdx)).substring(0,6) + itemIdx);
			pstmt.setInt(2, itemIdx);
			pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			return false;
		} finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
		return true;
	}
}
