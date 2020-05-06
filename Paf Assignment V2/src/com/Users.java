package com;

import java.sql.*;

//import com.mysql.jdbc.PreparedStatement.*;
//import com.mysql.jdbc.Statement;

public class Users {

	public Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3308/users?useSSL=false", "paf", "");
			// For testing
			System.out.print("Successfully connected to the Database!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("There is an Error Connecting to the Database!");
		}

		return con;

	}

	public String insertUser(String fName, String lName, String email, String nic, String phone, String password) {

		String output = "";

		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database";
			}

			String query = " insert into user(userID, fName ,lName ,email ,nic , phone, password)"
					+ " values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, fName);
			preparedStmt.setString(3, lName);
			preparedStmt.setString(4, email);
			preparedStmt.setString(5, nic);
			preparedStmt.setString(6, phone);
			preparedStmt.setString(7, password);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newUsers = readUser();
			output = "{\"status\":\"success\", \"data\": \"" + newUsers + "\"}";

			System.out.println("\nData Inserted Successfully!");
		}

		catch (Exception e) {
			// TODO: handle exception
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the Doctor.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String readUser() {
		String output = "";

		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			output = "<table class='table table-dark' ><tr class='thead-dark'><th > ID </th><th>First Name</th><th>Last Name </th><th>Email</th><th>NIC</th><th>Phone</th><th>Password</th><th>Update</th><th>Remove</th></tr>";

			String query = "select * from user";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				String userID = Integer.toString(rs.getInt("userID"));
				String fName = rs.getString("fName");
				String lName = rs.getString("lName");
				String email = rs.getString("email");
				String nic = rs.getString("nic");
				String phone = rs.getString("phone");
				String password = rs.getString("password");

				output += "<tr><td><input id='hidUserIDUpdate' name='hidUserIDUpdate' type='hidden' value='" + userID
						+ "'>" + userID + "</td>";

				// output += "<tr>" + "<td>" + userID + "</td>";
				output += "<td>" + fName + "</td>";
				output += "<td>" + lName + "</td>";
				output += "<td>" + email + "</td>";
				output += "<td>" + nic + "</td>";
				output += "<td>" + phone + "</td>";
				output += "<td>" + password + "</td>";

				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-userid='" + userID + "'>" + "</td></tr>";
			}

			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			// TODO: handle exception
			output = "Error while reading the items.";
			System.err.println(e.getMessage());
		}

		return output;

	}

	public String deleteUser(String userID)
	{
		String output = "";
		 try
		 {
			 Connection con = connect();
			 if (con == null)
			 {
				 return "Error while connecting to the database for deleting.";
			 } 
			// create a prepared statement
			 String query = "delete from user where userID=?";
			 PreparedStatement preparedStmt = con.prepareStatement(query);
			 // binding values
			 preparedStmt.setInt(1, Integer.parseInt(userID));
			 // execute the statement
			 preparedStmt.execute();
			 con.close();
			 String newUsers = readUser();
			 output = "{\"status\":\"success\", \"data\": \"" + newUsers + "\"}";
		 }
		 catch (Exception e)
		 {
			 	output = "{\"status\":\"error\", \"data\":\"Error while deleting the User.\"}";
			 	System.err.println(e.getMessage());
		 }
		 return output;
	}

	

	public String UpdateUser(String userID, String fName, String lName, String email, String nic, String phone,
			String password) {
		String output = "";

		// PreparedStatement preparedStmt1 = null;
		try {
			Connection con = connect();

			// create a prepared statement
			String query = "update user set fName = ?, lName = ?,email = ?, nic = ? , phone = ?, password = ?  where userID=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setString(1, fName);
			preparedStmt.setString(2, lName);
			preparedStmt.setString(3, email);
			preparedStmt.setString(4, nic);
			preparedStmt.setString(5, phone);
			preparedStmt.setString(6, password);
			preparedStmt.setInt(7, Integer.parseInt(userID));

			// execute the statement
			preparedStmt.execute();
			con.close();
			String newUsers = readUser();
			System.out.println("\n Successfully Updated Data! ");
			output = "{\"status\":\"success\", \"data\": \"" + newUsers + "\"}";

		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while updating the User.\"}";
			System.err.println(output);
		}
		return output;
	}

	public static void main(String args[]) {
		Users ins = new Users();

		// ins.insertUser("bb", "nnn", "kkk", "sss", "aaa", "sss");
		// ins.insertUser("ok", "ok", "ok", "ok", "ok", "ok", "ok");
		// ins.readUser();
		ins.deleteUser("61");
		// ins.deleteUser(81);
		// ins.UpdateUser( "44", "ppaass", "111", "sss", "sssdw", "ff", "sss", "ccc");

	}

}
