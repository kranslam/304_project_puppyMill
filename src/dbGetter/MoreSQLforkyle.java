package dbGetter;

import java.sql.*;

public class MoreSQLforkyle {

//	String InsertWarehouseSQL = "INSERT INTO Warehouse (warehouseID, addressID) VALUES(?,?)";
//	PreparedStatement InsertWarehouseSQLpstmt = con.preparedstatement(InsertWarehouseSQL);
//	InsertWarehouseSQLpstmt.setString(1, value1);
//	InsertWarehouseSQLpstmt.setString(2, value2); //addressID is FK to address
//	ResultSet InsertWarehouseSQLrst = InsertWarehouseSQLpstmt.executeQuery();
//	
//	String UpdateWarehouseSQL = "UPDATE Warehouse SET addressID = ? WHERE warehouseID = ?";
//	PreparedStatement UpdateWarehouseSQLpstmt = con. preparedstatement(UpdateWarehouseSQL);
//	UpdateWarehouseSQLpstmt.setString(1, value1); // for set
//	UpdateWarehouseSQLpstmt.setString(1, value2); //for where
//	ResultSet UpdateWarehouseSQLrst = UpdateWarehouseSQLpstmt.executeQuery();
//	
//	String UpdateCustomerSQL = "UPDATE Account SET phone = ?, email = ?, password = ? WHERE accountNum = ?";
//	PreparedStatement UpdateCustomerSQLpstmt = con.preparedstatement(UpdateCustomerSQL);
//	UpdateCustomerSQLpstmt.setString(1, value1);//for phone
//	UpdateCustomerSQLpstmt.setString(2, value2);//for email
//	UpdateCustomerSQLpstmt.setString(3, value3);//for pass
//	UpdateCustomerSQLpstmt.setString(4, value4);//for WHERE accountNum
//	ResultSet UpdateCustomerSQLrst = UpdateCustomerSQLpstmt.executeQuery();
//	
//	//ok so I have tentatively added decription and image to update but I think we really only need price updated
//	String UpdateProductSQL = "UPDATE Product SET price =? , decription = ?, image = ? WHERE productID = ?";
//	PreparedStatement UpdateProductSQLpstmt = con.preparedstatment(UpdateProductSQL);
//	UpdateProductSQLpstmt.setString(1,value1);//for price
//	UpdateProductSQLpstmt.setString(2,value2);//for decription
//	UpdateProductSQLpstmt.setString(3,value3);//for image
//	UpdateProductSQLpstmt.setString(4,value4);//for WHERE productID
//	ResultSet UpdateProductSQLrst = UpdateProductSQLpstmt.executeQuery();
//	
//	String DeleteCusomterSQL = "DELETE FROM Account WHERE accountNum = ?";//likely need something like cascased or something i dont remember so sleepy
//	PreparedStatement DeleteCusomterSQLpstmt = con.preparedstatement(DeleteCusomterSQL);
//	DeleteCusomterSQLpstmt.setString(1, value1);//for where
//	ResultSet DeleteCusomterSQLrst = DeleteCusomterSQLpstmt.executeQuery();
//	
//	String DeleteProductSQL = "DELETE FROM Product WHERE productID = ?";//likely the same problem as the delete customer
//	PreparedStatement DeleteProductSQLpstmt = con.preparedstatement(DeleteProductSQL);
//	DeleteProductSQLpstmt.setString(1,value1); //for where
//	ResultSet DeleteProductSQLrst = DeleteProductSQLpstmt.executeQuery();
}
