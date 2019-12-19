package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

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

	public boolean selectCheckEvent() {
		try {
			String sql = "SELECT COUNT(eventIdx) FROM eventinfo WHERE eventStatus = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) >= 3) {
				closed();
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			closed();
		}
		return true;
	}

	public int selectCount() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(eventIdx) FROM eventinfo";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			closed();
		} catch (Exception e) {
			e.printStackTrace();
			closed();
		}
		return count;
	}

	public ArrayList<EventDTO> selectEventList(int pageNum, int status) {
		ArrayList<EventDTO> list = new ArrayList<EventDTO>();
		try {
			String where = "";
			if (status == 1)
				where = " AND eventStatus = 1 ";
			String sql = "SELECT eventIdx,eventTitle,eventItemIdx,itemName,eventImg,eventStart,eventEnd,eventStatus\r\n"
					+ "FROM eventinfo,items\r\n" + "WHERE eventinfo.eventItemIdx = items.itemIdx " + where
					+ " LIMIT ?,5";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNum * 5);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new EventDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getInt(8)));
			}
			closed();
		} catch (Exception e) {
			e.printStackTrace();
			closed();
		}
		return list;
	}

	public boolean updateEventStatus(EventDTO event) {
		try {
			String sql = "UPDATE eventInfo SET eventStatus = ? WHERE eventidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, event.getStatus());
			pstmt.setInt(2, event.getEventIdx());
			pstmt.executeUpdate();
			closed();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			closed();
			return false;
		}
	}

	public boolean insertEvent(EventDTO event) {
		try {
			String sql = "INSERT INTO eventInfo VALUES (NULL,?,?,?,LEFT(NOW(),10),'',0)";
			if (!event.getEventStart().equals(""))
				sql = "INSERT INTO eventInfo VALUES (NULL,?,?,?,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, event.getEventTitle());
			pstmt.setInt(2, event.getEventItemIdx());
			pstmt.setString(3, event.getEventImg());
			if (!event.getEventStart().equals("")) {
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

	public boolean deleteEvent(int eventIdx) {
		try {
			String sql = "DELETE FROM eventInfo WHERE eventIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eventIdx);
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
