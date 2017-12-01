package beans;

public class Account{
	private int accountNum;
	private String name;
	private int phone;
	private String email;
	private String password;
	private String accType;
	private int empID;
	
	public Account(){}
	
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
	
	public int getPhone(){
		return phone;
	}
	public void setPhone(int phone){
		this.phone = phone;
	}
	
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getPass(){
		return password;
	}
	public void setPass(String password){
		this.password = password;
	}
	
	public String getAccType(){
		return accType;
	}
	public void setAccType(String accType){
		this.accType = accType;
	}
	
	public int getEmpID(){
		return empID;
	}
	public void setEmpID(int empID){
		this.empID = empID;
	}
	
}


