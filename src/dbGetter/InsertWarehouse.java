package project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class InsertWarehouse
 */
@WebServlet("/InsertWarehouse")
public class InsertWarehouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWarehouse() {
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
			
			String addressID = request.getParameter("addressID");
			String country = request.getParameter("country");
			String provinceState = request.getParameter("provinceState");
			String postalZIP = request.getParameter("postalZIP");
			String streetAddress = request.getParameter("streetAddress");
			String warehouseID = request.getParameter("warehouseID");
			
			String AddNewWarehouseAddress ="INSERT INTO Address(addressID, country, provinceState, postalZIP, streetAddress) VALUES(?,?,?,?,?)";
			PreparedStatement AddNewWarehouseAddresspstmt = con.prepareStatement(AddNewWarehouseAddress);
			AddNewWarehouseAddresspstmt.setString(1,addressID);//addressID
			AddNewWarehouseAddresspstmt.setString(2,country);//country
			AddNewWarehouseAddresspstmt.setString(3,provinceState);//ProvinceState
			AddNewWarehouseAddresspstmt.setString(4,postalZIP);//postalZIP
			AddNewWarehouseAddresspstmt.setString(5,streetAddress);//streetAddress
			AddNewWarehouseAddresspstmt.executeQuery();
			String InsertWarehouseSQL = "INSERT INTO Warehouse (warehouseID, addressID) VALUES(?,?)";
			PreparedStatement InsertWarehouseSQLpstmt = con.prepareStatement(InsertWarehouseSQL);
			InsertWarehouseSQLpstmt.setString(1, warehouseID);
			InsertWarehouseSQLpstmt.setString(2, addressID); //addressID is FK to address
			InsertWarehouseSQLpstmt.executeQuery();
			
		} catch (SQLException ex)

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
