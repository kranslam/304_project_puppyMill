package dbGetter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Order_OrderedProduct;

public class getOrderedProducts {
	boolean hasCustomerParam;
	String customerID;

	private static String SQL =  "SELECT Order.orderID, Order.accountNum, Order.totalAmount, Account.name, OrderedProduct.productId, OrderedProduct.quantity, OrderedProduct.price FROM Account, OrderedProduct, group5.Order WHERE Order.accountNum=Account.accountNum AND OrderedProduct.orderId=Order.orderID" ;

	static Connection con;
	static jdbc load = new jdbc();

	public List list() throws SQLException{

		
		List<Order_OrderedProduct> listAllOrder = new ArrayList<Order_OrderedProduct>();
	
		try{
			PreparedStatement pstmt = con.prepareStatement(SQL);
		
			if(hasCustomerParam){
				pstmt.setString(1, customerID);
			}
			
	PreparedStatement statement = con.prepareStatement(SQL);
	ResultSet resultSet = statement.executeQuery();
	while (resultSet.next())
	{			
		Order_OrderedProduct order = new Order_OrderedProduct();

	   			order.setOrderId(resultSet.getInt("Order.orderID"));
	   			order.setAccountNum(resultSet.getInt("Order.accountNum"));
	   			order.setTotalAmount(resultSet.getDouble("Order.totalAmount"));
	   			order.setName(resultSet.getString("Account.name"));
	   			order.setProductId(resultSet.getInt("OrderedProduct.productId"));
	   			order.setQuantity(resultSet.getInt("OrderedProduct.quantity"));
	   			order.setPrice(resultSet.getDouble("OrderedProduct.price"));
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

	return listAllOrder;
}
		}
}
