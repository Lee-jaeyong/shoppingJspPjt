package shopping.database.dao;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class Database {
	protected InitialContext init;
	protected Context ctx;
	protected DataSource ds;
	protected Connection conn;
	protected ResultSet rs;
	protected PreparedStatement pstmt;

	protected void dbConnect() throws SQLException, NamingException {
		init = new InitialContext();
		ctx = (Context) init.lookup("java:/comp/env");
		ds = (DataSource) ctx.lookup("jdbc/mydb");
		conn = ds.getConnection();
	}
	
	protected void closed() {
		try {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
