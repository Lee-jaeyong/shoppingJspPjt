package shopping.database.dto;

public class ItemDTO {
	private int itemIdx;
	private String itemCode;
	private String itemName;
	private int itemStatus;
	private String itemDetailImg;
	private long itemPrice;
	private long itemSalePrice;
	private String itemMainImg;
	private String itemManufacuter;
	private String itemOrigin;
	private String itemContent;
	private String[] itemSize;
	private String[] itemColor;
	private String size;
	private String color;
	private String categoryName;
	private String smallCategoryName;
	private String itemDate;
	private int itemStock;
	
	// 상품을 엑셀로 보여줄때 필요한 생성자
	public ItemDTO(int itemIdx, String itemCode, String itemName, String size, String color,int itemStock, int itemStatus,
			long itemPrice, long itemSalePrice, String categoryName, String smallCategoryName, String itemManufacuter,
			String itemOrigin,String itemDate) {
		this.itemStock = itemStock;
		this.itemDate = itemDate;
		this.itemIdx = itemIdx;
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.size = size;
		this.color = color;
		this.itemStatus = itemStatus;
		this.itemPrice = itemPrice;
		this.itemSalePrice = itemSalePrice;
		this.categoryName = categoryName;
		this.smallCategoryName = smallCategoryName;
		this.itemManufacuter = itemManufacuter;
		this.itemOrigin = itemOrigin;
	}

	// 상품 리스트를 가져오는 생성자
	public ItemDTO(int itemIdx, String itemCode, String itemMainImg, String itemName, int itemStatus, long itemPrice,
			long itemSalePrice) {
		this.itemIdx = itemIdx;
		this.itemCode = itemCode;
		this.itemMainImg = itemMainImg;
		this.itemName = itemName;
		this.itemStatus = itemStatus;
		this.itemPrice = itemPrice;
		this.itemSalePrice = itemSalePrice;
	}

	// 상품을 추가할 때 필요한 생성자
	public ItemDTO(String itemName, int itemStatus, String itemDetailImg, long itemPrice,
			long itemSalePrice, String itemMainImg, String itemManufacuter, String itemOrigin, String itemContent,String[] itemSize,String[] itemColor) {
		this.itemName = itemName;
		this.itemStatus = itemStatus;
		this.itemDetailImg = itemDetailImg;
		this.itemPrice = itemPrice;
		this.itemSalePrice = itemSalePrice;
		this.itemMainImg = itemMainImg;
		this.itemManufacuter = itemManufacuter;
		this.itemOrigin = itemOrigin;
		this.itemContent = itemContent;
		this.itemSize = itemSize;
		this.itemColor = itemColor;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSmallCategoryName() {
		return smallCategoryName;
	}

	public void setSmallCategoryName(String smallCategoryName) {
		this.smallCategoryName = smallCategoryName;
	}

	public String getItemDate() {
		return itemDate;
	}

	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getColor() {
		return color;
	}
	
	public String getSize() {
		return size;
	}
	
	public String[] getItemSize() {
		return itemSize;
	}



	public void setItemSize(String[] itemSize) {
		this.itemSize = itemSize;
	}



	public String[] getItemColor() {
		return itemColor;
	}



	public void setItemColor(String[] itemColor) {
		this.itemColor = itemColor;
	}



	public int getItemIdx() {
		return itemIdx;
	}

	public void setItemIdx(int itemIdx) {
		this.itemIdx = itemIdx;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(int itemStatus) {
		this.itemStatus = itemStatus;
	}

	public String getItemDetailImg() {
		return itemDetailImg;
	}

	public void setItemDetailImg(String itemDetailImg) {
		this.itemDetailImg = itemDetailImg;
	}

	public long getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(long itemPrice) {
		this.itemPrice = itemPrice;
	}

	public long getItemSalePrice() {
		return itemSalePrice;
	}

	public void setItemSalePrice(long itemSalePrice) {
		this.itemSalePrice = itemSalePrice;
	}

	public String getItemMainImg() {
		return itemMainImg;
	}

	public void setItemMainImg(String itemMainImg) {
		this.itemMainImg = itemMainImg;
	}

	public String getItemManufacuter() {
		return itemManufacuter;
	}

	public void setItemManufacuter(String itemManufacuter) {
		this.itemManufacuter = itemManufacuter;
	}

	public String getItemOrigin() {
		return itemOrigin;
	}

	public void setItemOrigin(String itemOrigin) {
		this.itemOrigin = itemOrigin;
	}

	public String getItemContent() {
		return itemContent;
	}

	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}

}
