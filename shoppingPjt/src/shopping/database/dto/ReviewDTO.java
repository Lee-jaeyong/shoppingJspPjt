package shopping.database.dto;

public class ReviewDTO {
	private int reviewUserIdx;
	private int reviewItemIdx;
	private String reviewTitle;
	private String reviewContent;
	private String reviewDate;
	private int reviewStar;
	private String userName;
	private String itemName;
	private String userIdenty;
	private int reviewIdx;

	// 관리자 리뷰 리스트
	public ReviewDTO(String itemName, String reviewTitle, String reviewContent, String userName, String userIdenty,
			String reviewDate, int reviewStar, int reviewIdx) {
		this.userIdenty = userIdenty;
		this.reviewIdx = reviewIdx;
		this.itemName = itemName;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.userName = userName;
		this.reviewDate = reviewDate;
		this.reviewStar = reviewStar;
	}

	// 리뷰 리스트
	public ReviewDTO(String userName, String reviewTitle, String reviewContent, String reviewDate, int reviewStar) {
		this.userName = userName;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewStar = reviewStar;
	}

	// 리뷰 등록시 사용되는 생성자
	public ReviewDTO(int reviewUserIdx, int reviewItemIdx, String reviewTitle, String reviewContent, int reviewStar) {
		this.reviewUserIdx = reviewUserIdx;
		this.reviewItemIdx = reviewItemIdx;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setUserIdenty(String userIdenty) {
		this.userIdenty = userIdenty;
	}

	public String getUserIdenty() {
		return userIdenty;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public int getReviewUserIdx() {
		return reviewUserIdx;
	}

	public void setReviewUserIdx(int reviewUserIdx) {
		this.reviewUserIdx = reviewUserIdx;
	}

	public int getReviewItemIdx() {
		return reviewItemIdx;
	}

	public void setReviewItemIdx(int reviewItemIdx) {
		this.reviewItemIdx = reviewItemIdx;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

}
