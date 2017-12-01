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
 * Servlet implementation class InsertReview
 */
@WebServlet("/InsertReview")
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

			
		    String InsertReviewSQL = "INSERT INTO Review (productID, accountNum, date, review) VALUES(?,?,?,?,?)";
			PreparedStatement InsertReviewSQLpstmt = con.prepareStatement(InsertReviewSQL);
			InsertReviewSQLpstmt.setString(1, productID);
			InsertReviewSQLpstmt.setString(2, accountNum);
			InsertReviewSQLpstmt.setString(3, date);
			InsertReviewSQLpstmt.setString(4, review);
			InsertReviewSQLpstmt.executeQuery();

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
