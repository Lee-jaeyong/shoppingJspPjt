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
	
	//주문 완료시 사용되는 생성자
	public OrderDTO(int orderUserIdx, String[] orderItemOption, String[] orderCount, long orderTotalSalePrice, String address,
			String name, String phone, String email, String notes,String[] shoppingCartList) {
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
