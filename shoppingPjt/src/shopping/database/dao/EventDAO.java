package shopping.database.dao;

import java.sql.SQLException;

import javax.naming.NamingException;

import shopping.database.dto.EventDTO;

public class EventDAO extends Database {
	public EventDAO() {
		try {
			dbConnect();
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}

	public boolean insertEvent(EventDTO event) {
		try {
			String sql = "INSERT INTO eventInfo VALUES (NULL,?,?,?,LEFT(NOW(),10),'')";
			if(!event.getEventStart().equals(""))
				sql = "INSERT INTO eventInfo VALUES (NULL,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, event.getEventTitle());
			pstmt.setInt(2, event.getEventItemIdx());
			pstmt.setString(3, event.getEventImg());
			if(!event.getEventStart().equals(""))
			{
				pstmt.setString(4, event.getEventStart());
				pstmt.setString(5, event.getEventEnd());
			}
			pstmt.executeUpdate();
			closed();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			closed();
			return false;
		}
	}
}
