package dbGetter;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import beans.Account;

import java.text.NumberFormat;

public class getCustomer {

	private static final String SQL_LISTCUST = "SELECT accountNum, name, phone, email, accType FROM Account";

	static Connection con;
	static jdbc load = new jdbc();

	public List<Account> list() throws SQLException {
		List<Account> customers = new ArrayList<Account>();

		try {
			con = load.getConnection();

			PreparedStatement statement = con.prepareStatement(SQL_LISTCUST);
			ResultSet rst = statement.executeQuery();

			while (rst.next()) {

				Account account = new Account();
				account.setAccountNum(rst.getInt("accountNum"));
				account.setaName(rst.getString("name"));
				account.setAccType(rst.getString("accType"));
				account.setPhone(rst.getInt("phone"));
				account.setEmail(rst.getString("email"));
				
				
				customers.add(account);
			}

		} catch (SQLException ex)

		{
			System.out.println(ex);
		}

		finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ex) {
				System.out.println(ex);
			}

			return customers;
		}

	}
}
