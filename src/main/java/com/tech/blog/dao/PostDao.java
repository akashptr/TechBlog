package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;

public class PostDao {
	private Connection conn;

	public PostDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public List<Category> getAllCategories() {
		List<Category> list = new ArrayList<>();
		
		try {
			String query = "select * from categories";
			Statement stmt = conn.createStatement();
			ResultSet rSet = stmt.executeQuery(query);
			while(rSet.next()) {
				Category category = new Category();
				category.setCid(rSet.getInt("cid"));
				category.setName(rSet.getString("name"));
				category.setDescription(rSet.getString("description"));
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
