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
	
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		
		try {
			
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				user = new User();
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword(resultSet.getString("password"));
				user.setGender(resultSet.getString("gender"));
				user.setAbout(resultSet.getString("about"));
				user.setrDate(resultSet.getTimestamp("rdate"));
				user.setProfile(resultSet.getString("profile"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	public boolean updateUser(User updatedUser) {
		boolean success = false;
		try {
			String query = "update user set name=?, email=?, password=?, about=?, profile=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, updatedUser.getName());
			pstmt.setString(2, updatedUser.getEmail());
			pstmt.setString(3, updatedUser.getPassword());
			pstmt.setString(4, updatedUser.getAbout());
			pstmt.setString(5, updatedUser.getProfile());
			pstmt.setInt(6, updatedUser.getId());
			pstmt.executeUpdate();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}

	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String query = "select * from user where id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userId);
			ResultSet resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				user = new User();
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword(resultSet.getString("password"));
				user.setGender(resultSet.getString("gender"));
				user.setAbout(resultSet.getString("about"));
				user.setrDate(resultSet.getTimestamp("rdate"));
				user.setProfile(resultSet.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
