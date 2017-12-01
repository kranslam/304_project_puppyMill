package beans;

public class Address {
	
	private int addressID;
	private String country;
	private String provinceState;
	private String postalZIP;
	private String streetAddress;
	
	public Address(){}
	
	public int getAddressID(){
		return addressID;
	}
	public void setAddressID(int addressID){
		this.addressID = addressID;
	}
	
	public String getCountry(){
		return country;
	}
	public void setCountry(String country){
		this.country = country;
	}
	
	public String getProvinceState(){
		return provinceState;
	}
	public void setProvinceState(String provinceState){
		this.provinceState = provinceState;
	}
	
	public String getPostalZIP(){
		return postalZIP;
	}
	public void setPostalZIP(String postalZIP){
		this.postalZIP = postalZIP;
	}
	
	public String getStreetAddress(){
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress){
		this.streetAddress = streetAddress;
	}
}
