package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.ShoppingCartDTO;

public class ShoppingCartAndOrderDAO extends Database {

	public ShoppingCartAndOrderDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public boolean insertShoppingCart(String userId, String shoppingCartCount, String optionIdx) {
		try {
			String sql = "INSERT INTO shoppingCart VALUES (?,NULL,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(userId));
			pstmt.setInt(2, Integer.parseInt(shoppingCartCount));
			pstmt.setInt(3, Integer.parseInt(optionIdx));
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ArrayList<ShoppingCartDTO> selectShoppingCart(String userIdx) {
		ArrayList<ShoppingCartDTO> list = new ArrayList<ShoppingCartDTO>();
		try {
			String sql = "SELECT cartIdx,cartItemOpidx,cartUserIdx,itemMainImg,itemName,itemSalePrice,cartCount,itemPrice\r\n"
					+ "FROM items,shoppingcart,itemoptions\r\n"
					+ "WHERE items.itemIdx = itemOptions.op_i_idx AND shoppingCart.cartItemOpIdx = itemOptions.opidx AND cartUserIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(userIdx));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ShoppingCartDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getLong(6), rs.getInt(7), rs.getLong(8)));
			}
			pstmt.close();
			conn.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			return list;
		}
		return list;
	}

	/*
	 * public boolean insertShoppingCartToOrder(String shoppingCartList) throws
	 * SQLException { try { String[] _shoppingCartList =
	 * shoppingCartList.split(","); conn.setAutoCommit(false); for(int i
	 * =0;i<_shoppingCartList.length;i++) { String sql = ""; pstmt =
	 * conn.prepareStatement(sql);
	 * 
	 * } conn.commit(); } catch (Exception e) { e.printStackTrace();
	 * conn.rollback(); } }
	 */

	public boolean updateShoppingCartCount(String idx, String type) {
		try {
			String updateType = "cartCount = cartCount - 1";
			if (type.equals("true"))
				updateType = "cartCount = cartCount + 1";
			String sql = "UPDATE shoppingCart SET " + updateType + " WHERE cartIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(idx));
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean deleteShoppingCart(String idx, String userIdx) {
		try {
			String sql = "DELETE FROM shoppingCart WHERE cartIdx = ? AND cartUserIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(idx));
			pstmt.setInt(2, Integer.parseInt(userIdx));
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
