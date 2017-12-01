package dbGetter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Product;

public class getTop5 {

	static Connection con;
	static jdbc load = new jdbc();

	String SQL = "SELECT OrderedProduct.productID, Product.breed, Product.picture, SUM(OrderedProduct.quantity) AS MostPopular "
			+ "FROM OrderedProduct, Product WHERE OrderedProduct.productID=Product.productID GROUP BY OrderedProduct.productID "
			+ "ORDER BY MostPopular DESC LIMIT 5";
	public List<Product> list() throws SQLException {
		List<Product> products = new ArrayList<Product>();

		try {

			con = load.getConnection();

			PreparedStatement pstmt = con.prepareStatement(SQL);
			
			//set variables in pstmt based on which parameters were given
		

			//System.out.println(pstmt.toString());
			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {

				Product product = new Product();
			
				product.setPid(resultSet.getInt("productID"));
				product.setpName(resultSet.getString("breed"));
				product.setImage(resultSet.getString("picture"));

				products.add(product);
			}

		} catch (SQLException ex) {
			System.out.println(ex);
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ex) {
				System.out.println(ex);
			}

			return products;
		}

	}

	
	
}
