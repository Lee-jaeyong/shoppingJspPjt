package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.ChartDTO;

public class ChartDAO extends Database {
	public ChartDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public ArrayList<ChartDTO> selectAreaChart() {
		ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
		try {
			for (int i = 1; i <= 24; i++) {
				String sql = "SELECT COUNT(*) FROM orders\r\n"
						+ "WHERE LEFT(orderdate,10) = LEFT(NOW(),10) AND RIGHT(LEFT(orderdate,13),2) = '" + i + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				list.add(new ChartDTO(rs.getInt(1)));
			}
			pstmt.close();
			rs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ChartDTO> selectBarChart() {
		ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
		try {
			for (int i = 7; i > 0; i--) {
				String sql = "SELECT COUNT(*) FROM orders\r\n"
						+ "WHERE LEFT(orderDate,10) = DATE_FORMAT(NOW() - INTERVAL WEEKDAY(NOW()) +" + i
						+ " DAY,'%Y-%m-%d')";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				list.add(new ChartDTO(rs.getInt(1)));
			}
			pstmt.close();
			rs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
