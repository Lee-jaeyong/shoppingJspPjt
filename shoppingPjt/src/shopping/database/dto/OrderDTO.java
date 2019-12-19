package shopping.database.dto;

public class OrderDTO {
	private String name;
	private String phone;
	private String email;
	private String address;
	private String notes;
	private int orderIdx;
	private String orderCode;
	private int orderUserIdx;
	private String[] orderItemOption;
	private String[] orderCount;
	private long orderTotalSalePrice;
	private int orderStatus;
	private String orderDate;
	private String[] shoppingCartList;
	private String itemName;
	private int relationOrderCount;
	private int totalOrderCount;
	private String itemColor;
	private String itemSize;

	// 사용자별 주문 확인시 필요한 생성자
	public OrderDTO(String orderCode, String itemName, long orderTotalSalePrice, int totalOrderCount, String orderDate,
			int orderStatus) {
		this.orderCode = orderCode;
		this.itemName = itemName;
		this.orderTotalSalePrice = orderTotalSalePrice;
		this.totalOrderCount = totalOrderCount;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
	}

	// 주문 엑셀 출력시 사용되는 생성자
	public OrderDTO(String name, String itemName, int relationOrderCount, int totalOrderCount, String address,
			String orderDate) {
		this.name = name;
		this.itemName = itemName;
		this.relationOrderCount = relationOrderCount;
		this.totalOrderCount = totalOrderCount;
		this.address = address;
		this.orderDate = orderDate;
	}

	// 주문 정보 확인시 사용되는 생성자
	public OrderDTO(int orderIdx, String name, String phone, String address, String notes, String itemName,
			String itemColor, String itemSize, int totalOrderCount) {
		this.orderIdx = orderIdx;
		this.itemColor = itemColor;
		this.itemSize = itemSize;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.notes = notes;
		this.itemName = itemName;
		this.totalOrderCount = totalOrderCount;
	}

	// 주문 목록 확인시 사용되는 생성자
	public OrderDTO(int orderIdx, String orderCode, int orderStatus, String itemName, int relationOrderCount,
			int totalOrderCount, String name, long orderTotalSalePrice, String orderDate) {
		this.orderIdx = orderIdx;
		this.orderCode = orderCode;
		this.orderStatus = orderStatus;
		this.itemName = itemName;
		this.relationOrderCount = relationOrderCount;
		this.totalOrderCount = totalOrderCount;
		this.name = name;
		this.orderTotalSalePrice = orderTotalSalePrice;
		this.orderDate = orderDate;
	}

	// 주문 완료시 사용되는 생성자
	public OrderDTO(int orderUserIdx, String[] orderItemOption, String[] orderCount, long orderTotalSalePrice,
			String address, String name, String phone, String email, String notes, String[] shoppingCartList) {
		this.orderUserIdx = orderUserIdx;
		this.orderItemOption = orderItemOption;
		this.orderCount = orderCount;
		this.orderTotalSalePrice = orderTotalSalePrice;
		this.address = address;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.notes = notes;
		this.shoppingCartList = shoppingCartList;
	}

	public String getItemSize() {
		return itemSize;
	}

	public String getItemColor() {
		return itemColor;
	}

	public String getItemName() {
		return itemName;
	}

	public int getRelationOrderCount() {
		return relationOrderCount;
	}

	public int getTotalOrderCount() {
		return totalOrderCount;
	}

	public String[] getShoppingCartList() {
		return shoppingCartList;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public String getNotes() {
		return notes;
	}

	public int getOrderIdx() {
		return orderIdx;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public int getOrderUserIdx() {
		return orderUserIdx;
	}

	public String[] getOrderItemOption() {
		return orderItemOption;
	}

	public String[] getOrderCount() {
		return orderCount;
	}

	public long getOrderTotalSalePrice() {
		return orderTotalSalePrice;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public String getOrderDate() {
		return orderDate;
	}

}
