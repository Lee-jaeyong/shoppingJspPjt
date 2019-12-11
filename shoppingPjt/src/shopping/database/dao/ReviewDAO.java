package shopping.database.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import shopping.database.dto.ReviewDTO;

public class ReviewDAO extends Database {
	public ReviewDAO() throws SQLException, NamingException {
		dbConnect();
	}

	public boolean selectCheckReview(String itemNum, String userIdx) {
		try {
			String sql = "SELECT COUNT(reviewIdx) FROM itemReview WHERE reviewItemIdx = ? AND reviewUserIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(itemNum));
			pstmt.setInt(2, Integer.parseInt(userIdx));
			rs = pstmt.executeQuery();
			rs.next();
			boolean chk = true;
			if (rs.getInt(1) > 0)
				chk = false;
			rs.close();
			pstmt.close();
			conn.close();
			return chk;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int selectReviewCount(int itemNum) {
		int count = 0;
		try {
			String sql = "SELECT COUNT(reviewIdx) FROM itemreview WHERE reviewItemIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int selectAllCount() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(reviewIdx) FROM itemReview";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public ArrayList<ReviewDTO> selectReviewAll(int pageNum, int smallCategory) {
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		try {
			String whereSql = "";
			String fromSql = "";
			if (smallCategory != 0) {
				whereSql = " AND category.ca_itemidx = items.itemIdx AND category.ca_smallidx = smallcategory.smallcategoryIdx AND smallcategoryIdx = "
						+ smallCategory + " ";
				fromSql = ",category,smallcategory";
			}
			String sql = "SELECT itemName,reviewTitle,reviewContent,userName,userIdenty,reviewDate,reviewStar,reviewIdx\r\n"
					+ " FROM itemreview,items,USER" + fromSql
					+ " WHERE user.userIdx = itemReview.reviewUserIdx AND items.itemIdx = reviewItemIdx\r\n" + whereSql
					+ " LIMIT ?,10";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNum * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ReviewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ReviewDTO> selectReview(int pageNum, int itemNum) {
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		try {
			String sql = "SELECT userName,reviewTitle,reviewContent,reviewDate,reviewStar\r\n"
					+ "FROM USER,itemReview\r\n"
					+ "WHERE user.userIdx = itemReview.reviewUserIdx AND reviewItemIdx = ? order by reviewIdx limit ?,5";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			pstmt.setInt(2, pageNum * 5);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ReviewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getInt(5)));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean insertReview(ReviewDTO review) {
		try {
			String sql = "INSERT INTO itemreview VALUES (?,?,?,?,LEFT(NOW(),10),?,NULL)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getReviewUserIdx());
			pstmt.setInt(2, review.getReviewItemIdx());
			pstmt.setString(3, review.getReviewTitle());
			pstmt.setString(4, review.getReviewContent());
			pstmt.setInt(5, review.getReviewStar());
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
