package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.ChartDTO;

public class ChartDAO extends Database {
	public ChartDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public ArrayList<ChartDTO> selectPieChart() {
		ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
		try {
			for (int i = 1; i <= 6; i++) {
				String sql = "SELECT COUNT(*), IFNULL(LEFT((YEAR(CURDATE())-YEAR(userBirth)),1),0) AS AGE\r\n"
						+ "FROM USER,orders\r\n" + "WHERE orders.orderUserIdx = user.userIdx";
				if (i != 6)
					sql += " AND LEFT((YEAR(CURDATE())-YEAR(userBirth)),1) = " + i + "";
				else
					sql += " AND NOT LEFT((YEAR(CURDATE())-YEAR(userBirth)),1) = '2'\r\n"
							+ " AND NOT LEFT((YEAR(CURDATE())-YEAR(userBirth)),1) = '3'\r\n"
							+ " AND NOT LEFT((YEAR(CURDATE())-YEAR(userBirth)),1) = '4'\r\n"
							+ " AND NOT LEFT((YEAR(CURDATE())-YEAR(userBirth)),1) = '5'"
							+ " AND NOT LEFT((YEAR(CURDATE())-YEAR(userBirth)),1) = '1'";
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

	public ArrayList<ChartDTO> selectAreaChart(String date) {
		ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
		try {
			for (int i = 1; i <= 24; i++) {
				String sql = "SELECT COUNT(*) FROM orders ";
				if (!date.equals(""))
					sql += "WHERE LEFT(orderdate,10) = LEFT('" + date + "',10) AND RIGHT(LEFT(orderdate,13),2) = " + i;
				else
					sql += "WHERE LEFT(orderdate,10) = LEFT(NOW(),10) AND RIGHT(LEFT(orderdate,13),2) = " + i;
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
