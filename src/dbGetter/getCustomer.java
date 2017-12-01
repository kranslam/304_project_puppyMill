package dbGetter;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import beans.Account;

import java.text.NumberFormat;

public class getCustomer {

	private static final String SQL_LISTCUST = "SELECT accountNum, name FROM Account";

	static Connection con;
	static jdbc load = new jdbc();

	public List<Account> list() throws SQLException {
		List<Account> customers = new ArrayList<Account>();

		try {
			con = load.getConnection();

			PreparedStatement statement = con.prepareStatement(SQL_LISTCUST);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {

				Account account = new Account();
				account.setAccountNum(resultSet.getInt("accountNum"));
				System.out.println(resultSet.getInt("accountNum"));
				account.setaName(resultSet.getString("name"));
				System.out.println(resultSet.getString("name"));

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
