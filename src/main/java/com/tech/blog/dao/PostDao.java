package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	private Connection conn;

	public PostDao(Connection conn) {
		super();
		this.conn = conn;
	}

	// Gets all category
	public List<Category> getAllCategories() {
		List<Category> list = new ArrayList<>();

		try {
			String query = "select * from categories";
			Statement stmt = conn.createStatement();
			ResultSet rSet = stmt.executeQuery(query);
			while (rSet.next()) {
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

	// Saves a post
	public boolean savePost(Post post) {
		boolean isSuccess = false;
		try {
			String query = "insert into posts(pTitle, pContent, pCode, pPic, cid, userId) values(?, ?, ?, ?, ?, ?)";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, post.getpTitle());
			pStatement.setString(2, post.getpContent());
			pStatement.setString(3, post.getpCode());
			pStatement.setString(4, post.getpPic());
			pStatement.setInt(5, post.getCatId());
			pStatement.setInt(6, post.getUserId());
			pStatement.executeUpdate();
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	// Get all the posts
	public List<Post> getAllPost() {
		List<Post> posts = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from posts");
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				Post post = new Post();
				post.setPid(set.getInt("pid"));
				post.setpTitle(set.getString("pTitle"));
				post.setpContent(set.getString("pContent"));
				post.setpCode(set.getString("pCode"));
				post.setpPic(set.getString("pPic"));
				post.setpDate(set.getTimestamp("pDate"));
				post.setCatId(set.getInt("cid"));
				post.setUserId(set.getInt("userId"));
				posts.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return posts;
	}

	// Get posts by category
	public List<Post> getPostByCategory(int catId) {
		List<Post> posts = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from posts where cid=?");
			pstmt.setInt(1, catId);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				Post post = new Post();
				post.setPid(set.getInt("pid"));
				post.setpTitle(set.getString("pTitle"));
				post.setpContent(set.getString("pContent"));
				post.setpCode(set.getString("pCode"));
				post.setpPic(set.getString("pPic"));
				post.setpDate(set.getTimestamp("pDate"));
				post.setCatId(set.getInt("cid"));
				post.setUserId(set.getInt("userId"));
				posts.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return posts;
	}

	// Get a particular post
	public Post getPostByPostId(int postId) {
		Post post = null;

		try {
			
			String query = "select * from posts where pid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postId);
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				post = new Post();
				post.setPid(set.getInt("pid"));
				post.setpTitle(set.getString("pTitle"));
				post.setpContent(set.getString("pContent"));
				post.setpCode(set.getString("pCode"));
				post.setpPic(set.getString("pPic"));
				post.setpDate(set.getTimestamp("pDate"));
				post.setCatId(set.getInt("cid"));
				post.setUserId(set.getInt("userId"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
}
