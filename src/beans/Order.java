package beans;

public class Order {
	//set currency to doubles for now feel free to change them at will
	
	private int orderID;
	private int accountNum;
	private double totalAmount;
	
	public Order(){}
	
	public int getOrderID(){
		return orderID;
	}
	public void setOrderID(int orderID){
		this.orderID = orderID;
	}
	
	public int getAccountNum(){
		return accountNum;
	}
	public void setAccountNum(int accountNum){
		this.accountNum = accountNum;
	}
	
	public double getTotalAmount(){
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount){
		this.totalAmount = totalAmount;
	}
}
