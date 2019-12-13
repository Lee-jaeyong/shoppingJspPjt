package shopping.database.dto;

public class EventDTO {
	private int eventIdx;
	private String eventTitle;
	private int eventItemIdx;
	private String eventImg;
	private String eventStart;
	private String eventEnd;
	private String itemName;
	private int status;

	public EventDTO() {

	}

	// 관리자 이벤트 목록
	public EventDTO(int eventIdx, String eventTitle, int eventItemIdx, String itemName, String eventImg,
			String eventStart, String eventEnd, int status) {
		this.itemName = itemName;
		this.eventIdx = eventIdx;
		this.eventTitle = eventTitle;
		this.eventItemIdx = eventItemIdx;
		this.eventImg = eventImg;
		this.eventStart = eventStart;
		this.eventEnd = eventEnd;
		this.status = status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemName() {
		return itemName;
	}

	public int getEventIdx() {
		return eventIdx;
	}

	public void setEventIdx(int eventIdx) {
		this.eventIdx = eventIdx;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public int getEventItemIdx() {
		return eventItemIdx;
	}

	public void setEventItemIdx(int eventItemIdx) {
		this.eventItemIdx = eventItemIdx;
	}

	public String getEventImg() {
		return eventImg;
	}

	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}

	public String getEventStart() {
		return eventStart;
	}

	public void setEventStart(String eventStart) {
		this.eventStart = eventStart;
	}

	public String getEventEnd() {
		return eventEnd;
	}

	public void setEventEnd(String eventEnd) {
		this.eventEnd = eventEnd;
	}

}
