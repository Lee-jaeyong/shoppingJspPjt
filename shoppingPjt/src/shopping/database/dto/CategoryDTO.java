package shopping.database.dto;

public class CategoryDTO {
	private String categoryName;
	private int categoryChkIdx;
	private int categoryHighIdx;
	private int categoryStatus;
	private int representIdx;
	private String representName;
	private int representCategoryIdx;
	private String representPath;
	private int smallCategoryIdx;

	public CategoryDTO(int representIdx, String representName, int representCategoryIdx, String representPath,
			int smallCategoryIdx) {
		this.representIdx = representIdx;
		this.representName = representName;
		this.representCategoryIdx = representCategoryIdx;
		this.representPath = representPath;
		this.smallCategoryIdx = smallCategoryIdx;
	}

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

	public void setSmallCategoryIdx(int smallCategoryIdx) {
		this.smallCategoryIdx = smallCategoryIdx;
	}

	public int getSmallCategoryIdx() {
		return smallCategoryIdx;
	}

	public int getRepresentIdx() {
		return representIdx;
	}

	public void setRepresentIdx(int representIdx) {
		this.representIdx = representIdx;
	}

	public String getRepresentName() {
		return representName;
	}

	public void setRepresentName(String representName) {
		this.representName = representName;
	}

	public int getRepresentCategoryIdx() {
		return representCategoryIdx;
	}

	public void setRepresentCategoryIdx(int representCategoryIdx) {
		this.representCategoryIdx = representCategoryIdx;
	}

	public String getRepresentPath() {
		return representPath;
	}

	public void setRepresentPath(String representPath) {
		this.representPath = representPath;
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
