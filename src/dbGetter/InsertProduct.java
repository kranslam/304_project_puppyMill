package dbGetter;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertProduct
 */
@WebServlet("/InsertProduct")
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Connection con = load.getConnection();
			String price = request.getParameter("price");
			String breed = request.getParameter("breed");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			String picture = request.getParameter("picture");
			
			String InsertProductSQL = "INSERT INTO Product (price, breed, category, description, picture) VALUES(?,?,?,?,?)";
			
			PreparedStatement InsertProductSQLpstmt = con.prepareStatement(InsertProductSQL);
			BigDecimal pr = new BigDecimal(price);
			InsertProductSQLpstmt.setBigDecimal(1, pr );
			InsertProductSQLpstmt.setString(2, breed);
			InsertProductSQLpstmt.setString(3, category);
			InsertProductSQLpstmt.setString(4, description);
			InsertProductSQLpstmt.setString(5, picture);
			
			InsertProductSQLpstmt.executeUpdate();
			
			response.sendRedirect("Success.html");

			
		}catch (SQLException ex)

		{
			response.sendRedirect("SomethingWentWrong.html");

			ex.printStackTrace();
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
