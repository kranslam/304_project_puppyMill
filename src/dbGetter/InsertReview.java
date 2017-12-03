package dbGetter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertReview
 */
@WebServlet("/InsertReview.jsp")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	jdbc load = new jdbc();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReview() {
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

			   String accountNum = request.getParameter("accountNum");
				String productID = request.getParameter("productID");
			    String date = request.getParameter("date");
			    String review = request.getParameter("review");

			    Date jk = new Date();
			    
			    String fuckme = jk.getDate() + "";
			    
			    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			    //Date myDate = formatter.parse(fuckme);
			    
			   
			    
		    String InsertReviewSQL = "INSERT INTO Review (productID, accountNum, date, review) VALUES(?,?,?,?)";
			PreparedStatement InsertReviewSQLpstmt = con.prepareStatement(InsertReviewSQL);
			InsertReviewSQLpstmt.setInt(1, Integer.parseInt(productID));
			InsertReviewSQLpstmt.setInt(2, Integer.parseInt(accountNum));
			InsertReviewSQLpstmt.setDate(3, new java.sql.Date(jk.getTime()));
			InsertReviewSQLpstmt.setString(4, review);
			InsertReviewSQLpstmt.executeUpdate();
			
			response.sendRedirect("Product.jsp?id=" + productID);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.sendRedirect("SomethingWentWrong.html");
				e.printStackTrace();
			} 
//			catch (ParseException e) {
//				// TODO Auto-generated catch block
//				response.sendRedirect("SomethingWentWrong.html");
//				e.printStackTrace();
//			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
