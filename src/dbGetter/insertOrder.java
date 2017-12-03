package dbGetter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class insertOrder
 */
@WebServlet("/insertOrder")
public class insertOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertOrder() {
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

	    String orderID = request.getParameter("orderID");
	    String customerID = request.getParameter("customerID");
	    String totalAmount = request.getParameter("totalAmount");

		
		
		String InsertOrderSQL = "INSERT INTO Order (orderID, accountNum, totalAmount VALUES (?,?,?)";
	
		PreparedStatement InsertOrderSQLpstmt = con.prepareStatement(InsertOrderSQL);
		InsertOrderSQLpstmt.setString(1, orderID);
		InsertOrderSQLpstmt.setString(2, customerID);
		InsertOrderSQLpstmt.setString(3, totalAmount);

		InsertOrderSQLpstmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
