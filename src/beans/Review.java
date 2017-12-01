package beans;

public class Review {
	// just a few things I have put the date as a string as i figured that would
	// be the easiest way to keep the correct format and like in payment i have
	// specified the productID for the review and others by explicitly naming 
	// them so they dont interfere with other classes
	
	private int reviewProductID;
	private int reviewAccountNum;
	private String date;
	private int rating;
	private String review;
	
	public Review(){}
	
	public int getReviewProductID(){
		return reviewProductID;
	}
	public void setReviewProductID(int reviewProductID){
		this.reviewProductID = reviewProductID;
	}
	
	public int getReviewAccountNum(){
		return reviewAccountNum;
	}
	public void setReviewAccountNum(int reviewAccountNum){
		this.reviewAccountNum = reviewAccountNum;
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
}
