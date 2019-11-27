package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.ItemDTO;
import shopping.database.dto.ItemOptionDTO;
import shopping.filter.SecureString;

public class ItemDAO extends Database {
	public ItemDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public int selectCountItem() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(itemIdx) FROM items";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
		}
		return count;
	}

	public ArrayList<ItemOptionDTO> selectItemOption(int itemIdx) {
		ArrayList<ItemOptionDTO> list = new ArrayList<ItemOptionDTO>();
		try {
			String sql = "SELECT opIdx,op_i_idx,opSize,opColor,opStock FROM itemoptions WHERE op_i_idx = " + itemIdx;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemOptionDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			return list;
		}
		return list;
	}

	public ArrayList<ItemDTO> selectItem(int pageNum, String sortType, int showType, String searchItemType,
			String searchItemTitle, String searchItemSmallCategory, String searchItemBefore, String searchItemAfter) {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			StringBuilder sqlWhere = new StringBuilder();
			if (!searchItemTitle.equals("") || !searchItemSmallCategory.equals("") || !searchItemBefore.equals("")) {
				sqlWhere.append("AND");
				if (!searchItemTitle.equals(""))
				{
					sqlWhere.append(" " + searchItemType + " like ?");
					if(!searchItemSmallCategory.equals("") || !searchItemBefore.equals(""))
						sqlWhere.append(" AND");
				}
				if (!searchItemSmallCategory.equals(""))
				{
					sqlWhere.append(" ca_smallidx = " + Integer.parseInt(searchItemSmallCategory) + "");
					if(!searchItemBefore.equals(""))
						sqlWhere.append(" AND");
				}
				if (!searchItemBefore.equals(""))
					sqlWhere.append(" itemDate BETWEEN '" + searchItemBefore + "' AND '" + searchItemAfter + "'");
			}
			String sql = "SELECT itemIdx,itemCode,itemMainImg,itemName,itemStatus,itemPrice,itemSalePrice\r\n"
					+ "FROM items,category WHERE items.itemIdx = category.ca_itemIdx " + sqlWhere.toString()
					+ " ORDER BY " + sortType + " LIMIT " + pageNum * showType + "," + showType + "";
			pstmt = conn.prepareStatement(sql);
			if (!searchItemTitle.equals(""))
				pstmt.setString(1, "%" + searchItemTitle + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7)));
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
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
			pstmt.setString(1, new SecureString().MD5(Integer.toString(itemIdx)).substring(0, 6) + itemIdx);
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

	public boolean updateStock(String[] stockIdx, String[] stock) throws SQLException {
		try {
			conn.setAutoCommit(false);
			for (int i = 0; i < stock.length; i++) {
				String sql = "UPDATE itemoptions SET opStock = " + Integer.parseInt(stock[i]) + " WHERE opIdx = "
						+ Integer.parseInt(stockIdx[i]);
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			return false;
		} finally {
			conn.close();
			pstmt.close();
		}
		return true;
	}
}