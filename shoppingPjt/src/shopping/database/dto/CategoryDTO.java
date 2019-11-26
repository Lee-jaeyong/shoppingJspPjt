package shopping.database.dto;

public class CategoryDTO {
	private String categoryName;
	private int categoryChkIdx;
	private int categoryHighIdx;

	public CategoryDTO(String categoryName, int categoryChkIdx) {
		this.categoryChkIdx = categoryChkIdx;
		this.categoryName = categoryName;
	}

	public CategoryDTO(String categoryName, int categoryChkIdx, int categoryHighIdx) {
		this.categoryChkIdx = categoryChkIdx;
		this.categoryName = categoryName;
		this.categoryHighIdx = categoryHighIdx;
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
