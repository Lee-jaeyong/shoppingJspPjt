package shopping.database.dto;

public class ChartDTO {
	private String date;
	private int count;

	public ChartDTO(int count) {
		this.count = count;
	}

	public String getDate() {
		return date;
	}

	public int getCount() {
		return count;
	}
}
