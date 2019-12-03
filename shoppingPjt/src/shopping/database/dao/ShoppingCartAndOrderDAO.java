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
}
