package dbGetter;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import beans.Product;

import java.text.NumberFormat;

public class getProducts {

	String name;
	String category;
	Boolean hasNameParam;
	Boolean hasCategoryParam;
	int witch = 0;

	private static String SQL = "SELECT * FROM Product";
	final String glob = "Select * from Product";

	static Connection con;
	static jdbc load = new jdbc();

	public List<Product> list() throws SQLException {
		List<Product> products = new ArrayList<Product>();

		try {

			con = load.getConnection();

			PreparedStatement pstmt = con.prepareStatement(SQL);
			
			//set variables in pstmt based on which parameters were given
			if (witch == 0) {

	   		} else if (witch == 2) {
	   			pstmt.setString(1,"%"+ name+"%");	

	   		} else if (witch == 1) {
				pstmt.setString(1, category);

	   		}else if (witch == 3){
	   			pstmt.setString(1,"%"+ name+"%");	
				pstmt.setString(2, category);

	   		}

			System.out.println(pstmt.toString());
			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {

				Product product = new Product();
				product.setPid(resultSet.getInt("productID"));
				product.setpName(resultSet.getString("breed"));
				product.setDesc(resultSet.getString("description"));
				product.setPrice(resultSet.getDouble("price"));
				product.setCategory(resultSet.getString("category"));
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

	public void chooseSql(String name, String category) {
		this.category = category;
		this.name = name;
		
		SQL=glob;
		
		System.out.println("This is tester class:");
		System.out.println(name);
		System.out.println(category);
		
		
		hasNameParam = name != null && !name.equals("");
		hasCategoryParam = category != null && !category.equals("") && !category.equals("All");
		
		System.out.println(hasCategoryParam);
		
		String sql = "";

		if (hasNameParam && hasCategoryParam) {
			sql = "SELECT * FROM Product WHERE breed LIKE ? AND category = ?";
			witch = 3;
		} else if (hasNameParam) {
			sql = "SELECT * FROM Product WHERE breed LIKE ?";
			witch =2;
		} else if (hasCategoryParam) {
			sql = "SELECT * FROM Product WHERE category = ?";
			witch = 1;
		} else{
			sql = SQL;
		}

		System.out.println("new name: "+ name);
		System.out.println(sql);
		SQL = sql;
	}

}