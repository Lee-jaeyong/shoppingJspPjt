package shopping.database.dto;

public class NoticeDTO {
	private String noticeTitle;
	private String noticeContent;
	private int noticeStatus;
	private String noticeStartDate;
	private String noticeEndDate;
	private int noticeIdx;

	public NoticeDTO() {
		
	}
	
	// 공지사항 볼때 필요한 생성자
	public NoticeDTO(int noticeIdx, String noticeTitle, String noticeContent, int noticeStatus, String noticeStartDate,
			String noticeEndDate) {
		this.noticeIdx = noticeIdx;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeStatus = noticeStatus;
		this.noticeStartDate = noticeStartDate;
		this.noticeEndDate = noticeEndDate;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(int noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	public String getNoticeStartDate() {
		return noticeStartDate;
	}

	public void setNoticeStartDate(String noticeStartDate) {
		this.noticeStartDate = noticeStartDate;
	}

	public String getNoticeEndDate() {
		return noticeEndDate;
	}

	public void setNoticeEndDate(String noticeEndDate) {
		this.noticeEndDate = noticeEndDate;
	}

	public int getNoticeIdx() {
		return noticeIdx;
	}

	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}

}
