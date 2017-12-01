package project;

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
 * Servlet implementation class DeleteCustomer
 */
@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static jdbc load = new jdbc();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request) throws ServletException, IOException {
		
		try{
			Connection con = load.getConnection();
			String accountNum = request.getParameter("accountNum");
			
			String DeleteCusomterSQL = "DELETE FROM Account WHERE accountNum = ?";//likely need something like cascased or something i dont remember so sleepy
			PreparedStatement DeleteCusomterSQLpstmt = con.prepareStatement(DeleteCusomterSQL);
			DeleteCusomterSQLpstmt.setString(1, accountNum);//for where
			DeleteCusomterSQLpstmt.executeQuery();
		
	}catch (SQLException ex)

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
