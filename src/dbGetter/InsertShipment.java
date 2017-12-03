package dbGetter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertShipment
 */
@WebServlet("/InsertShipment")
public class InsertShipment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	jdbc load = new jdbc();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertShipment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			Connection con = load.getConnection();

		    String addressID = request.getParameter("addressID");
			String orderID = request.getParameter("orderID");
		    String warehouseID = request.getParameter("warehouseID");

			
			
			String InsertShipmentSQL = "INSERT INTO Shipment (addressID, orderID, warehouseID) VALUES (?,?,?)";
			PreparedStatement InsertShipmentSQLpstmt = con.prepareStatement(InsertShipmentSQL);
			InsertShipmentSQLpstmt.setString(1, addressID);
			InsertShipmentSQLpstmt.setString(2, orderID);
			InsertShipmentSQLpstmt.setString(3, warehouseID);
			InsertShipmentSQLpstmt.executeQuery();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
