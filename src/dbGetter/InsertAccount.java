package dbGetter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
		    String InsertCustomerSQL = "INSERT INTO Account (accountNum,name,phone,email,password,accType) VALUES(?,?,?,?,?,Customer)";
		    String insertAddressSQL = "INSERT INTO Address (country, provinceState, postalZIP, streetAddress) VALUES (?,?,?,?)";
		    String insertPaymentSQL = "INSERT INTO Payment";
		    
		    String name = request.getParameter("name");
		    String phone = request.getParameter("phone");
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		   
		    String streetAddress = request.getParameter("streetAddress");
		    String country = request.getParameter("country");
		    String provinceState = request.getParameter("provinceState");
		    String postalZIP = request.getParameter("postalZIP");

		    String cardNum = request.getParameter("cardNum");
		    String expDate = request.getParameter("expDate");
		    String securityCode = request.getParameter("securityCode");
		    String cardHolderName = request.getParameter("cardHolderName");
		    String cardType = request.getParameter("cardType");
		    PreparedStatement InsertCustomerSQLpstmt = con.prepareStatement(InsertCustomerSQL);

		    //generate address
		    
		    PreparedStatement insertAddress = con.prepareStatement(insertAddressSQL);
		    insertAddress.setString(1, country);
		    insertAddress.setString(2, provinceState);
		    insertAddress.setString(3, postalZIP);
		    insertAddress.setString(2, streetAddress);
		    
		    //generate payment w/ payment id
		    

		    //cardNum
		    //expDate
		    //securityCode
		    //cardHolderName
		    //cardType --->  must be MasterCard or Visa otherwise error occurs
		    
		    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    Date myDate = formatter.parse(expDate);
		    
		    //removed employee id
			InsertCustomerSQLpstmt.setDate(1, (java.sql.Date) myDate);
			InsertCustomerSQLpstmt.setString(2, name);
			InsertCustomerSQLpstmt.setInt(3,  Integer.parseInt(phone));
			InsertCustomerSQLpstmt.setString(4, email);
			InsertCustomerSQLpstmt.setString(5, password);
			InsertCustomerSQLpstmt.setString(6, "Customer");

			InsertCustomerSQLpstmt.executeQuery();

			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	response.getWriter().write("Hello");
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
