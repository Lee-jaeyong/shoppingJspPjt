package shopping.database.dto;

public class ShoppingCartDTO {
	private int cartUserIdx;
	private int cartIdx;
	private int cartCount;
	private int ItemOpIdx;
	private String itemMainImg;
	private String itemName;
	private long itemSalePrice;
	private long itemPrice;

	// 장바구니 목록을 가져올 시 사용되는 생성자
	public ShoppingCartDTO(int cartIdx, int itemOpIdx, int cartUserIdx, String itemMainImg, String itemName,
			long itemSalePrice, int cartCount, long itemPrice) {
		this.cartIdx = cartIdx;
		ItemOpIdx = itemOpIdx;
		this.cartUserIdx = cartUserIdx;
		this.itemMainImg = itemMainImg;
		this.itemName = itemName;
		this.itemSalePrice = itemSalePrice;
		this.cartCount = cartCount;
		this.itemPrice = itemPrice;
	}

	public void setItemPrice(long itemPrice) {
		this.itemPrice = itemPrice;
	}

	public long getItemPrice() {
		return itemPrice;
	}

	public int getCartUserIdx() {
		return cartUserIdx;
	}

	public void setCartUserIdx(int cartUserIdx) {
		this.cartUserIdx = cartUserIdx;
	}

	public int getCartIdx() {
		return cartIdx;
	}

	public void setCartIdx(int cartIdx) {
		this.cartIdx = cartIdx;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public int getItemOpIdx() {
		return ItemOpIdx;
	}

	public void setItemOpIdx(int itemOpIdx) {
		ItemOpIdx = itemOpIdx;
	}

	public String getItemMainImg() {
		return itemMainImg;
	}

	public void setItemMainImg(String itemMainImg) {
		this.itemMainImg = itemMainImg;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public long getItemSalePrice() {
		return itemSalePrice;
	}

	public void setItemSalePrice(long itemSalePrice) {
		this.itemSalePrice = itemSalePrice;
	}

}
