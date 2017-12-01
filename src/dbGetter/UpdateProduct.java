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
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			Connection con = load.getConnection();
			String price = request.getParameter("price");
			String breed= request.getParameter("breed");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			String productID = request.getParameter("productID");
			
			//note sure about udating the breed and category
			String UpdateProductSQL = "UPDATE Product SET price =? ,breed = ?, category = ?, description = ? WHERE productID = ?";
			PreparedStatement UpdateProductSQLpstmt = con.prepareStatement(UpdateProductSQL);
			UpdateProductSQLpstmt.setString(1,price);//for price
			UpdateProductSQLpstmt.setString(2,breed);//for breed
			UpdateProductSQLpstmt.setString(3,category);//for category
			UpdateProductSQLpstmt.setString(4,description);//for description
			UpdateProductSQLpstmt.setString(5,productID);// fow WHERE productID
			UpdateProductSQLpstmt.executeQuery();
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
