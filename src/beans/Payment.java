package beans;

public class Payment {
	//have specifed addressID and accountNum for payment by changing their names
	// so they dont interfere with other classes. feel free to change the names 
	private int paymentID;
	private int paymentAddressID;
	private int paymentAccountNum;
	
	public Payment(){}
	
	public int getPaymentID(){
		return paymentID;
	}
	public void setPaymentID(int paymentID){
		this.paymentID = paymentID;
	}
	
	public int getPaymentAddressID(){
		return paymentAddressID;
	}
	public void setAddressID(int paymentAddressID){
		this.paymentAddressID = paymentAddressID;
	}
	
	public int getPaymentAccountNum(){
		return paymentAccountNum;
	}
	public void setPaymentAccountNum(int paymentAccountNum){
		this.paymentAccountNum = paymentAccountNum;
	}
}
