package beans;

public class Account_Review {
	private int accountNum;
	private String name;
//	private int phone;
//	private String email;
//	private String password;   Likely dont need these but keeping here in case we needs
//	private String accType;
//	private int empID;
	private int reviewProductID;
	private String date;
	private int rating;
	private String review;
	
public Account_Review(){}
	
	public int getReviewProductID(){
		return reviewProductID;
	}
	public void setReviewProductID(int reviewProductID){
		this.reviewProductID = reviewProductID;
	}
	
	public String getDate(){
		return date;
	}
	public void setDate(String date){
		this.date = date;
	}
	
	public int getRating(){
		return rating;
	}
	public void setRating(int rating){
		this.rating = rating;
	}
	
	public String getReview(){
		return review;
	}
	public void setReview(String review){
		this.review = review;
	}
	
	public int getAccountNum(){
		return accountNum;
	}
	public void setAccountNum(int accountNum){
		this.accountNum = accountNum;
	}
	
	public String getaName(){
		return name;
	}
	public void setaName(String name){
		this.name=name;
	}

	
// SAME STUFF AS BEFORE	
//	public int getPhone(){
//		return phone;
//	}
//	public void setPhone(int phone){
//		this.phone = phone;
//	}
//	
//	public String getEmail(){
//		return email;
//	}
//	public void setEmail(String email){
//		this.email = email;
//	}
//	
//	public String getPass(){
//		return password;
//	}
//	public void setPass(String password){
//		this.password = password;
//	}
//	
//	public String getAccType(){
//		return accType;
//	}
//	public void setAccType(String accType){
//		this.accType = accType;
//	}
//	
//	public int getEmpID(){
//		return empID;
//	}
//	public void setEmpID(int empID){
//		this.empID = empID;
//	}
}
