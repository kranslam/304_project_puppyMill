package beans;

public class Order_OrderedProduct {
	// set currency to doubles for now feel free to change them at will

	private int orderId;
	private int accountNum;
	private double totalAmount;
	private int productId;
	private int quantity;
	private double price;
	private String name;

	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	
	public Order_OrderedProduct() {
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
}
