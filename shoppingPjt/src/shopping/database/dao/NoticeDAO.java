package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.NoticeDTO;

public class NoticeDAO extends Database {
	public NoticeDAO() {
		try {
			dbConnect();
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<NoticeDTO> selectNoticeList(int pageNum) {
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		try {
			String sql = "SELECT noticeIdx,noticeTitle,noticeContent,noticeStatus,noticeStartDate,noticeEndDate FROM notice LIMIT ?,5";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new NoticeDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
			closed();
		} finally {
			closed();
		}
		return list;
	}

	public boolean insertNotice(NoticeDTO notice) {
		try {
			String sql = "INSERT INTO notice VALUES (NULL,?,?,?,?,?)";
			if (notice.getNoticeStartDate().equals(""))
				sql = "INSERT INTO notice VALUES (NULL,?,?,?,LEFT(NOW(),10),'')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, notice.getNoticeStatus());
			if (!notice.getNoticeStartDate().equals("")) {
				pstmt.setString(4, notice.getNoticeStartDate());
				pstmt.setString(5, notice.getNoticeEndDate());
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			closed();
			return false;
		} finally {
			closed();
		}
		return true;
	}

	private void closed() {
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
