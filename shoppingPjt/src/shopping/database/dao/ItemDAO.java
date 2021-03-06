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

	public ArrayList<ItemDTO> selectNewItemList() {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			String sql = "SELECT itemIdx,itemName,itemSalePrice,itemMainImg,itemContent\r\n" + "FROM items\r\n"
					+ "WHERE itemStatus = 1 ORDER BY itemIdx LIMIT 0,5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemDTO(rs.getInt(1), rs.getString(2), rs.getLong(3), rs.getString(4), rs.getString(5)));
			}
			closed();
		} catch (Exception e) {
			e.printStackTrace();
			closed();
		}
		return list;
	}

	public ArrayList<ItemOptionDTO> selectShowLackOptions() {
		ArrayList<ItemOptionDTO> list = new ArrayList<ItemOptionDTO>();
		try {
			String sql = "SELECT opIdx,itemName,opSize,opColor,opStock\r\n" + "FROM itemOptions, items\r\n"
					+ "WHERE itemOptions.op_i_idx = items.itemIdx AND opStock < 6\r\n" + "ORDER BY itemName";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemOptionDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getInt(5)));
			}
			rs.close();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ItemDTO selectItemInfo(int itemIdx) {
		ItemDTO item = null;
		try {
			String sql = "SELECT itemIdx,itemName,itemDetailImg,itemPrice,itemSalePrice,itemMainImg,itemManufacturer,itemOrigin,itemContent FROM items WHERE itemidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemIdx);
			rs = pstmt.executeQuery();
			rs.next();
			item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
					rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			closed();
		} catch (Exception e) {
			closed();
		}
		return item;
	}

	public int selectCountItem(String category, String searchType, String search, String itemStatus) {
		int count = 0;
		try {
			String sql = "SELECT COUNT(itemIdx) FROM items";
			if (!search.equals(""))
				sql = "SELECT COUNT(itemIdx) FROM items WHERE " + searchType + " like ?";
			if (!category.equals(""))
				sql = "SELECT COUNT(itemIdx) FROM items,category WHERE category.ca_itemIdx = items.itemIdx AND ca_smallidx = "
						+ category;
			if (!category.equals("") && !search.equals(""))
				sql = "SELECT COUNT(itemIdx) FROM items,category WHERE category.ca_itemIdx = items.itemIdx AND ca_smallidx = "
						+ category + " AND " + searchType + " like ?";
			if (!itemStatus.equals("-1"))
				sql += " AND itemStatus = " + itemStatus;
			pstmt = conn.prepareStatement(sql);
			if (!search.equals(""))
				pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
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

	public ArrayList<ItemDTO> selectSearchItem(String searchItemTitle) {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			String sql = "SELECT itemIdx,itemCode,itemMainImg,itemName,itemStatus,itemPrice,itemSalePrice,itemContent\r\n"
					+ "FROM items,category WHERE items.itemIdx = category.ca_itemIdx AND itemName like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchItemTitle + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8)));
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

	public ArrayList<ItemDTO> selectEventItem(int pageNum, String search, String categoryNum) {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			String categoryWhere = "";
			if (!categoryNum.equals(""))
				categoryWhere = "AND ca_smallidx = ? ";
			String sql = "SELECT itemIdx,itemCode,itemMainImg,itemName,itemStatus,itemPrice,itemSalePrice,itemContent";
			sql += " FROM items,category WHERE items.itemIdx = category.ca_itemIdx AND itemStatus = 1 AND itemName like ? "
					+ categoryWhere;
			sql += " LIMIT ?,5";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			if (!categoryNum.equals("")) {
				pstmt.setInt(2, Integer.parseInt(categoryNum));
				pstmt.setInt(3, pageNum * 5);
			} else
				pstmt.setInt(2, pageNum * 5);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8)));
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

	public ArrayList<ItemDTO> selectItem(int pageNum, String sortType, int showType, String searchItemType,
			String searchItemTitle, String searchItemSmallCategory, String searchItemBefore, String searchItemAfter,
			String searchItemStatus) {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			StringBuilder sqlWhere = new StringBuilder();
			if (!searchItemTitle.equals("") || !searchItemSmallCategory.equals("") || !searchItemBefore.equals("")) {
				sqlWhere.append("AND");
				if (!searchItemTitle.equals("")) {
					sqlWhere.append(" " + searchItemType + " like ?");
					if (!searchItemSmallCategory.equals("") || !searchItemBefore.equals(""))
						sqlWhere.append(" AND");
				}
				if (!searchItemSmallCategory.equals("")) {
					sqlWhere.append(" ca_smallidx = " + Integer.parseInt(searchItemSmallCategory) + "");
					if (!searchItemBefore.equals(""))
						sqlWhere.append(" AND");
				}
				if (!searchItemBefore.equals(""))
					sqlWhere.append(" itemDate BETWEEN '" + searchItemBefore + "' AND '" + searchItemAfter + "'");
			}
			String statusChk = "";
			if (searchItemStatus.equals("1"))
				statusChk = " AND itemStatus = 1 ";
			else if (searchItemStatus.equals("0"))
				statusChk = " AND itemStatus = 0 ";

			String sql = "SELECT itemIdx,itemCode,itemMainImg,itemName,itemStatus,itemPrice,itemSalePrice,itemContent\r\n"
					+ "FROM items,category WHERE items.itemIdx = category.ca_itemIdx " + statusChk + sqlWhere.toString()
					+ " ORDER BY " + sortType + " LIMIT " + pageNum * showType + "," + showType + "";
			pstmt = conn.prepareStatement(sql);
			if (!searchItemTitle.equals(""))
				pstmt.setString(1, "%" + searchItemTitle + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8)));
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

	public ArrayList<String[]> selectItemFromExcel(String[] query, String[] header) {
		ArrayList<String[]> list = new ArrayList<String[]>();
		try {
			list.add(header);
			StringBuilder sql = new StringBuilder("SELECT ");
			boolean chkOption = false;
			int count = query.length;
			for (int i = 0; i < count; i++) {
				if (!query[i].equals("itemOption"))
					sql.append(query[i]);
				else {
					chkOption = true;
					continue;
				}
				if (i != query.length - 1 || chkOption)
					sql.append(",");
			}
			if (chkOption) {
				sql.append("opSize,opColor,opStock FROM items,itemoptions WHERE items.itemidx = itemoptions.op_i_idx");
				count += 2;
			} else
				sql.append(" FROM items");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String[] str = new String[count];
				for (int i = 1; i <= count; i++) {
					str[i - 1] = rs.getObject(i).toString();
				}
				list.add(str);
			}
			pstmt.close();
			rs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			return list;
		}
		return list;
	}

	public ArrayList<ItemDTO> selectDeleteItemList() {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			String sql = "SELECT itemIdx,itemCode, itemMainImg,itemName,itemPrice,itemSalePrice,removeDate,removeExecuteDate\r\n"
					+ "FROM items,deleteItem\r\n" + "WHERE items.itemIdx = deleteItem.d_i_idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
				list.add(new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8)));
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			return list;
		}
		return list;
	}

	public ArrayList<ItemDTO> selectItemOptionSingle(String itemIdx) {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			String sql = "SELECT opIdx,opSize,opColor,opStock FROM itemoptions" + " WHERE op_i_idx = ?"
					+ "ORDER BY opColor, opSize";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, itemIdx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
			}
			closed();
		} catch (Exception e) {
			closed();
			return list;
		}
		return list;
	}

	public boolean insertItem(ItemDTO item, int smallCategoryNumber) throws SQLException {
		try {
			conn.setAutoCommit(false);
			String sql = "INSERT INTO items VALUES (NULL,'',?,?,?,?,?,?,?,?,?,LEFT(NOW(),10))";
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
			rs.close();
			conn.close();
			pstmt.close();
		}
		return true;
	}

	public boolean updateItem(ItemDTO item) {
		try {
			String sql = "UPDATE items SET itemName = ?, " + "itemManufacturer = ?, itemOrigin = ?, "
					+ "itemContent = ?, itemPrice = ?, itemSalePrice = ?, " + "itemDetailImg = ? WHERE itemIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item.getItemName());
			pstmt.setString(2, item.getItemManufacuter());
			pstmt.setString(3, item.getItemOrigin());
			pstmt.setString(4, item.getItemContent());
			pstmt.setLong(5, item.getItemPrice());
			pstmt.setLong(6, item.getItemSalePrice());
			pstmt.setString(7, item.getItemDetailImg());
			pstmt.setInt(8, item.getItemIdx());
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean updateStatus(String[] itemIdx, int status) {
		try {
			StringBuilder sql = new StringBuilder("UPDATE items SET itemStatus = " + status + " WHERE ");
			for (int i = 0; i < itemIdx.length; i++) {
				sql.append("itemIdx = " + Integer.parseInt(itemIdx[i]));
				if (i != itemIdx.length - 1)
					sql.append(" or ");
			}
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean updateStockFromIndex(String idx, String stock) {
		try {
			String sql = "UPDATE itemoptions SET opStock = ? WHERE opIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stock));
			pstmt.setString(2, idx);
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
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

	public boolean updateItemMainImg(int itemIdx, String itemMainImg) {
		try {
			String sql = "UPDATE items SET itemMainImg = ? WHERE itemIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, itemMainImg);
			pstmt.setInt(2, itemIdx);
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean deleteItem(int itemIdx) throws SQLException {
		try {
			conn.setAutoCommit(false);
			String sql = "UPDATE items SET itemStatus = -1 WHERE itemIdx = " + itemIdx;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "INSERT INTO deleteItem VALUES (" + itemIdx
					+ ",LEFT(NOW(),10),DATE_ADD(LEFT(NOW(),10), INTERVAL 7 DAY))";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			conn.commit();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			return false;
		}
		return true;
	}

	public boolean deleteItemCencel(int itemIdx) throws SQLException {
		try {
			conn.setAutoCommit(false);
			String sql = "UPDATE items SET itemStatus = 0 WHERE itemIdx = " + itemIdx;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "DELETE FROM deleteitem WHERE d_i_idx = " + itemIdx;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			conn.commit();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			return false;
		}
		return true;
	}

	public void deleteItemCheck() throws SQLException {
		try {
			conn.setAutoCommit(false);
			String sql = "DELETE FROM items WHERE itemidx IN (SELECT d_i_idx FROM deleteitem WHERE removeExecuteDate <= LEFT(NOW(),10))";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "DELETE FROM itemoptions WHERE op_i_idx IN (SELECT d_i_idx FROM deleteitem WHERE removeExecuteDate <= LEFT(NOW(),10))";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "DELETE FROM category WHERE ca_itemidx IN (SELECT d_i_idx FROM deleteitem WHERE removeExecuteDate <= LEFT(NOW(),10))";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "DELETE FROM deleteitem WHERE removeExecuteDate <= LEFT(NOW(),10)";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			conn.commit();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			conn.rollback();
		}
	}
}
