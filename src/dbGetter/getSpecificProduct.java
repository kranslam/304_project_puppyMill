package dbGetter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Product;

/**
 * Servlet implementation class getSpecificProduct
 */
@WebServlet("/getSpecificProduct.json")
public class getSpecificProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String sql = "SELECT * FROM Product WHERE productID = ?";
	Connection con;
	static jdbc load = new jdbc();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getSpecificProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> products = new ArrayList<Product>();
		
		try {
			con = load.getConnection();
		String productId = request.getParameter("productId");
		if (productId == null || productId == "") {productId = "-1";}

		String sql = "SELECT * FROM Product WHERE productID = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(productId));
		
		ResultSet rst = pstmt.executeQuery();
		while(rst.next()){
			Product prod = new Product();
			
			prod.setPid(Integer.parseInt(productId));
			prod.setpName(rst.getString("breed"));
			prod.setPrice(rst.getDouble("price"));
			prod.setDesc(rst.getString("description"));
			prod.setImage(rst.getString("picture"));
			products.add(prod);
			
		}
	
		String categoriesJson = new Gson().toJson(products);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(categoriesJson);
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
