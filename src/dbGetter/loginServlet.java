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
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    jdbc load = new jdbc();   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.print(request.getParameterNames());
		System.out.print(request.getParameter("name"));
		System.out.print(request.getParameter("password"));

		try {
			Connection con = load.getConnection();
	
			
		int accountNum;
		String checkName, accType;
		String checkPass;
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		
		String sql = "SELECT accountNum, name, password, accType FROM Account WHERE name =?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, name);
		
		ResultSet rst = pstmt.executeQuery();

			if (rst.next()) {
				accountNum = rst.getInt(1);
				checkName = rst.getString(2);
				checkPass = rst.getString(3);
				accType = rst.getString(4);

				if (password.equals(checkPass)) {
					session.setAttribute("name", checkName);
					session.setAttribute("userId", ""+accountNum);
					
					if(accType.equals("Administrator")){
						session.setAttribute("admin", accType);
					}
					//find out if is admin --> send string Admin
					
					response.sendRedirect("Mainpage.jsp");
					
					System.out.println("   password is correct");
				}else{
					response.sendRedirect("loginFailed.jsp");
				}
			} else {
				response.sendRedirect("loginFailed.jsp");

		}
		//get name and password from database
		//compare the two 
		// if password == pswd
		// session.setAttribute("name", name);
		// session.setAttribute("userId", userId);
		
		
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
