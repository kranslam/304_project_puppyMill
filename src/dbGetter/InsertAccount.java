package dbGetter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InsertAccount
 */
@WebServlet("/InsertAccount")

public class InsertAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	jdbc load = new jdbc();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	

		try {
			Connection con = load.getConnection();
		    String InsertCustomerSQL = "INSERT INTO Account (name,phone,email,password,accType) VALUES(?,?,?,?,?)";
		    String getActNumSQL = "SELECT accountNum FROM Account WHERE name = ? AND phone=? AND email = ? AND password = ?";
		    String insertAddressSQL = "INSERT INTO Address (country, provinceState, postalZIP, streetAddress) VALUES (?,?,?,?)";
		    String getAddressIDSQL = "SELECT addressID FROM Account WHERE postalZIP = ? AND streetAddress =?";
		    String insertPaymentSQL = "INSERT INTO Payment (addressID, accountNum) VALUES (?,?)";
		    String getPaymentIDSQL = "SELECT paymentID FROM Payment WHERE addressID = ? AND accountNum = ?";
		    String insertCreditCardSQL = "INSERT INTO CreditCard (paymentID, cardNumber,expDate,securityCode,cardHolderName,cardType) VALUES(?,?,?,?,?,?)";
		    
		    String name = request.getParameter("name");
		    String phone = request.getParameter("phone");
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		   
		    String streetAddress = request.getParameter("streetAddress");
		    String country = request.getParameter("country");
		    String provinceState = request.getParameter("provinceState");
		    String postalZIP = request.getParameter("postalZIP");

		    String cardNum = request.getParameter("cardNumber");
		    String expDate = request.getParameter("expDate");
		    String securityCode = request.getParameter("securityCode");
		    String cardHolderName = request.getParameter("cardHolderName");
		    String cardType = request.getParameter("cardType");
		    
	
		    

		    //generate address
		    
		    PreparedStatement insertAddress = con.prepareStatement(insertAddressSQL);
		    insertAddress.setString(1, country);
		    insertAddress.setString(2, provinceState);
		    insertAddress.setString(3, postalZIP);
		    insertAddress.setString(4, streetAddress);
		    insertAddress.executeUpdate();
		    
		    
		    
//		    
//		    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		    Date myDate = formatter.parse(expDate);
		    
		    //removed employee id
		    PreparedStatement InsertCustomerSQLpstmt = con.prepareStatement(InsertCustomerSQL);
			InsertCustomerSQLpstmt.setString(1, name);
			InsertCustomerSQLpstmt.setInt(2,  Integer.parseInt(phone));
			InsertCustomerSQLpstmt.setString(3, email);
			InsertCustomerSQLpstmt.setString(4, password);
			InsertCustomerSQLpstmt.setString(5, "Customer");

			InsertCustomerSQLpstmt.executeUpdate();
			//generate payment w/ payment id
//			PreparedStatement getActNumSQLpstmt = con.prepareStatement(getActNumSQL);
//			getActNumSQLpstmt.setString(1, name);
//			getActNumSQLpstmt.setInt(2,  Integer.parseInt(phone));
//			getActNumSQLpstmt.setString(3, email);
//			getActNumSQLpstmt.setString(4, password);
//			ResultSet getActNumrst = getActNumSQLpstmt.executeQuery();
//			
//			while(getActNumrst.next()){
//				System.out.println(getActNumrst.getString("accountNum"));
//
//				PreparedStatement getAddressIDSQLpstmt = con.prepareStatement(getAddressIDSQL);
//				getAddressIDSQLpstmt.setString(1, postalZIP);
//				getAddressIDSQLpstmt.setString(2, streetAddress);
//				ResultSet getAddressIDrst = getAddressIDSQLpstmt.executeQuery();
//				
//				while(getAddressIDrst.next()){
//				
//				PreparedStatement insertPaymentSQLpstmt = con.prepareStatement(insertPaymentSQL);
//				insertPaymentSQLpstmt.setInt(1, getActNumrst.getInt("accountNum"));
//				insertPaymentSQLpstmt.setInt(2, getAddressIDrst.getInt("addressID"));
//				
//				//get PaymentID
//				PreparedStatement getPaymentIDSQLpstmt = con.prepareStatement(getPaymentIDSQL);
//				getPaymentIDSQLpstmt.setInt(1,getActNumrst.getInt("accountNum"));
//				getPaymentIDSQLpstmt.setInt(2,getAddressIDrst.getInt("addressID"));
//				ResultSet getPaymentIDSQLrst = getPaymentIDSQLpstmt.executeQuery();
//				
//				
//				while(getPaymentIDSQLrst.next()){
//				
//				PreparedStatement insertCreditCardSQLpstmt = con.prepareStatement(insertCreditCardSQL);
//				insertCreditCardSQLpstmt.setInt(1,getPaymentIDSQLrst.getInt("paymentID"));
//				insertCreditCardSQLpstmt.setInt(2, Integer.parseInt(cardNum));
//				insertCreditCardSQLpstmt.setDate(3, new java.sql.Date(myDate.getTime()));
//				insertCreditCardSQLpstmt.setString(4, securityCode);
//				insertCreditCardSQLpstmt.setString(5, cardHolderName);
//				insertCreditCardSQLpstmt.setString(6,cardType );
//				insertCreditCardSQLpstmt.executeUpdate();
//					}
//				}
//				
//			}
			
			response.sendRedirect("Success.html");

			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.sendRedirect("SomethingWentWrong.html");

				e.printStackTrace();
			}

	//response.getWriter().write("Hello");
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
