package dbGetter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCustomer
 */
@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection con = load.getConnection();
			String delete = request.getParameter("delete");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String newpassword = request.getParameter("password");
			String accountNum = request.getParameter("accountNum");
			String accType = request.getParameter("accType");
			String empID = request.getParameter("empID");
			
			if(delete == null){
				
			String UpdateCustomerSQL = "UPDATE Account SET phone = ?, email = ?, password = ?, accType = ?, empID = ? WHERE accountNum = ?";
			PreparedStatement UpdateCustomerSQLpstmt = con.prepareStatement(UpdateCustomerSQL);
			UpdateCustomerSQLpstmt.setString(1, phone);//for phone
			UpdateCustomerSQLpstmt.setString(2, email);//for email
			UpdateCustomerSQLpstmt.setString(3, newpassword);//for pass
			UpdateCustomerSQLpstmt.setString(4, accType);//for WHERE accountNum
			UpdateCustomerSQLpstmt.setString(5, empID);//for WHERE accountNum
			UpdateCustomerSQLpstmt.setString(6, accountNum);//for WHERE accountNum
			UpdateCustomerSQLpstmt.executeUpdate();
			}else{
			String sql = "DELETE FROM Account WHERE accountNum = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(accountNum));
			pstmt.executeUpdate();
			
			}
			
			resp.sendRedirect("Success.html");

			
		}catch (SQLException ex)

		{
			resp.sendRedirect("SomethingWentWrong.html");
			System.out.println(ex);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
