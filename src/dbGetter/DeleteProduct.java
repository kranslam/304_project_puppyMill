package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request) throws ServletException, IOException {


		try{
			Connection con = load.getConnection();
			
			String productID = request.getParameter("productID");
			
			String DeleteProductSQL = "DELETE FROM Product WHERE productID = ?";//likely the same problem as the delete customer
			PreparedStatement DeleteProductSQLpstmt = con.prepareStatement(DeleteProductSQL);
			DeleteProductSQLpstmt.setString(1,productID); //for where
			DeleteProductSQLpstmt.executeQuery();
		}catch (SQLException ex)

		{
			System.out.println(ex);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request);
	}

}
