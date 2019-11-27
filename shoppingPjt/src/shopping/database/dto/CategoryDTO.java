package shopping.database.dto;

public class CategoryDTO {
	private String categoryName;
	private int categoryChkIdx;
	private int categoryHighIdx;
	private int categoryStatus;

	public CategoryDTO(String categoryName, int categoryChkIdx, int categoryStatus) {
		this.categoryChkIdx = categoryChkIdx;
		this.categoryName = categoryName;
		this.categoryStatus = categoryStatus;
	}

	public CategoryDTO(String categoryName, int categoryChkIdx, int categoryHighIdx, int categoryStatus) {
		this.categoryChkIdx = categoryChkIdx;
		this.categoryName = categoryName;
		this.categoryHighIdx = categoryHighIdx;
		this.categoryStatus = categoryStatus;
	}

	public int getCategoryStatus() {
		return categoryStatus;
	}

	public void setCategoryStatus(int categoryStatus) {
		this.categoryStatus = categoryStatus;
	}

	public void setCategoryHighIdx(int categoryHighIdx) {
		this.categoryHighIdx = categoryHighIdx;
	}

	public int getCategoryHighIdx() {
		return categoryHighIdx;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryChkIdx() {
		return categoryChkIdx;
	}

	public void setCategoryChkIdx(int categoryChkIdx) {
		this.categoryChkIdx = categoryChkIdx;
	}

}
