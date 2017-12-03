package dbGetter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Account;
import beans.Order;

public class getOrders {

	boolean hasCustomerParam;
	String customerID;
	
	private static String SQL = "SELECT * FROM Order";

	static Connection con;
	static jdbc load = new jdbc();

	public List<Order> list() throws SQLException {
		//List All Orders
		List<Order> listAllOrders = new ArrayList<Order>();
	try{
		PreparedStatement pstmt = con.prepareStatement(SQL);
	
		if(hasCustomerParam){
			pstmt.setString(1, customerID);
		}
		
		ResultSet rst = pstmt.executeQuery();
		while (rst.next())
		{			
		   			Order listAllOrder = new Order();
		   			
		   			listAllOrder.setOrderID(rst.getInt("Order.orderID"));
		   			listAllOrder.setAccountNum(rst.getInt("Order.accountNum"));
		   			listAllOrder.setTotalAmount(rst.getDouble("Order.totalAmount"));
		   		}

			

		} catch (SQLException ex)

		{
			System.out.println(ex);
		}

		finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ex) {
				System.out.println(ex);
			}

			return listAllOrders;
		}

	}

	public void chooseSql(String customerID) {
		this.customerID = customerID;
		
		hasCustomerParam = customerID != null && !customerID.equals("");
		String sql = "";

		if (hasCustomerParam) {
			sql = "SELECT * FROM Order WHERE accountNum = ?";
			SQL = sql;
		} 
	}
	
	
}
