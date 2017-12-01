package dbGetter;

import com.google.gson.Gson;

import beans.Account;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getAllCust
 */

@WebServlet("/getAllCust.json")
public class listAllCust extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public listAllCust() {
		super();

	}

	/**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	     */
		
		
		@Override
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   	getCustomer tetris = new getCustomer();
	   	
	   	try{
	   		List<Account> namea = tetris.list();
	   		String nameaJson = new Gson().toJson(namea);
	   		response.setContentType("application/json");
        	response.setCharacterEncoding("UTF-8");
        	response.getWriter().write(nameaJson);
        	System.out.println(nameaJson);
        	System.out.println(namea.isEmpty());


	   	 }catch(SQLException e)
	{
		throw new ServletException("DB error", e);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}


