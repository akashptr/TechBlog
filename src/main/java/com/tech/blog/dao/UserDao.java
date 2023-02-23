package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn = conn;
	}

	public boolean saveUser(User user) {
		boolean succeed = false;
		try {

			String query = "insert into user(name, email, password, gender, about) values(?, ?, ?, ?, ?)";
			PreparedStatement pstmt = this.conn.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.executeUpdate();
			succeed = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return succeed;
	}
}
