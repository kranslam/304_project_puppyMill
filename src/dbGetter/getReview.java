package dbGetter;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Account_Review;

/**
 * Servlet implementation class getSpecificProduct
 */
@WebServlet("/getReview.json")
public class getReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String SQL = "SELECT review ,name FROM  Review JOIN Account ON Review.accountNum = Account.accountNum WHERE productID = ? ";
	Connection con;
	jdbc load = new jdbc();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	
	 	
		 String reviewProductID = request.getParameter("productId");
	 //private static String SQL = "SELECT review ,name FROM  Review JOIN Account ON Review.accountNum = Account.accountNum WHERE productID = ? ";
	 
		
			List<Account_Review> listreviews = new ArrayList<Account_Review>();
	 try{
		 con = load.getConnection();
	
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewProductID));
			
			ResultSet rst = pstmt.executeQuery();
			
		while(rst.next()){
			Account_Review AR = new Account_Review();
			AR.setaName(rst.getString("name"));
			AR.setReview(rst.getString("review"));
			
			listreviews.add(AR);
		}
	  
			String reviewJson = new Gson().toJson(listreviews);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(reviewJson);
			

} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	}
		}


