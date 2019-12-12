package shopping.database.dto;

public class EventDTO {
	private int eventIdx;
	private String eventTitle;
	private int eventItemIdx;
	private String eventImg;
	private String eventStart;
	private String eventEnd;

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
