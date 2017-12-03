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
 * Servlet implementation class insertOrderedProduct
 */
@WebServlet("/insertOrderedProduct")
public class insertOrderedProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertOrderedProduct() {
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
		    String productId = request.getParameter("productId");
		    String quantity = request.getParameter("quantity");
		    String price = request.getParameter("price");

			
			
		    String InsertOrderedProductSQL = "INSERT INTO OrderedProduct (orderId, productId, quantity, price) VALUES (?,?,?,?) ";
			PreparedStatement InsertOrderedProductSQLpstmt = con.prepareStatement(InsertOrderedProductSQL);
			InsertOrderedProductSQLpstmt.setString(1, orderID);
			InsertOrderedProductSQLpstmt.setString(2, productId);
			InsertOrderedProductSQLpstmt.setString(3, quantity);
			InsertOrderedProductSQLpstmt.setString(4, price);
			 InsertOrderedProductSQLpstmt.executeQuery();

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
