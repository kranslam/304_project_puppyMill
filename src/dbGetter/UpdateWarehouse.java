package dbGetter;

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
 * Servlet implementation class UpdateWarehouse
 */
@WebServlet("/UpdateWarehouse")
public class UpdateWarehouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateWarehouse() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		try{
			Connection con = load.getConnection();
			String delete = request.getParameter("delete");
			String addressID = request.getParameter("addressID");
			String warehouseID = request.getParameter("warehouseID");
			
			if(delete == null){
				String UpdateWarehouseSQL = "UPDATE Warehouse SET addressID = ? WHERE warehouseID = ?";
				PreparedStatement UpdateWarehouseSQLpstmt = con.prepareStatement(UpdateWarehouseSQL);
				UpdateWarehouseSQLpstmt.setString(1, addressID); // for set
				UpdateWarehouseSQLpstmt.setString(2, warehouseID); // for where
				UpdateWarehouseSQLpstmt.executeUpdate();
			}else{
			String sql = "DELETE FROM Warehouse WHERE warehouseID = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(warehouseID));
			pstmt.executeUpdate();
			
			}
			
			resp.sendRedirect("Success.html");
			
		}catch (SQLException ex)

		{
			resp.sendRedirect("SomethingWentWrong.html");
			System.out.println(ex);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, resp);
	}

}
