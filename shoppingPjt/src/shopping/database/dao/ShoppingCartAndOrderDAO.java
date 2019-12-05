package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.OrderDTO;
import shopping.database.dto.ShoppingCartDTO;
import shopping.filter.SecureString;

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
			String sql = "SELECT cartIdx,cartItemOpidx,cartUserIdx,itemMainImg,itemName,itemSalePrice,cartCount,itemPrice,opColor,opSize\r\n"
					+ "FROM items,shoppingcart,itemoptions\r\n"
					+ "WHERE items.itemIdx = itemOptions.op_i_idx AND shoppingCart.cartItemOpIdx = itemOptions.opidx AND cartUserIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(userIdx));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ShoppingCartDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getLong(6), rs.getInt(7), rs.getLong(8), rs.getString(9), rs.getString(10)));
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

	public boolean insertShoppingCartToOrder(OrderDTO orderDTO) throws SQLException {
		try {
			conn.setAutoCommit(false);
			String sql = "INSERT INTO orderinfo VALUES (NULL,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderDTO.getOrderUserIdx());
			pstmt.executeUpdate();
			sql = "SELECT MAX(orderidx) FROM orders";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int maxIdx = rs.getInt(1);
			for (int i = 0; i < orderDTO.getOrderItemOption().length; i++) {
				sql = "INSERT INTO orders VALUES (NULL,'"
						+ new SecureString().MD5(Integer.toString(maxIdx)).substring(0, 6)
						+ "',?,?,?,?,0,LEFT(NOW(),10),?,?,?,?," + maxIdx + ")";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, orderDTO.getOrderUserIdx());
				pstmt.setInt(2, Integer.parseInt(orderDTO.getOrderItemOption()[i]));
				pstmt.setInt(3, Integer.parseInt(orderDTO.getOrderCount()[i]));
				pstmt.setLong(4, orderDTO.getOrderTotalSalePrice());
				pstmt.setString(5, orderDTO.getAddress());
				pstmt.setString(6, orderDTO.getName());
				pstmt.setString(7, orderDTO.getPhone());
				pstmt.setString(8, orderDTO.getNotes());
				pstmt.executeUpdate();
			}
			for (int i = 0; i < orderDTO.getShoppingCartList().length; i++) {
				sql = "DELETE FROM shoppingcart WHERE cartIdx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(orderDTO.getShoppingCartList()[i]));
				pstmt.executeUpdate();
			}
			conn.commit();
			conn.close();
			rs.close();
			pstmt.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			return false;
		}
	}

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
