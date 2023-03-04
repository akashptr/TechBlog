package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	private Connection conn;

	public LikeDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean insertLike(int pId, int uId) {
		boolean successStatus = false;
		try {

			String query = "insert into likes (pId, uId) values (?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);
			pstmt.executeUpdate();
			successStatus = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return successStatus;
	}

	public int countLikeOnPost(int pId) {
		int count = 0;
		try {
			String query = "select count(*) as noOfLike from likes where pId=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			ResultSet rSet = pstmt.executeQuery();
			if (rSet.next()) {
				count = rSet.getInt("noOfLike");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pId, int uId) {
		boolean liked = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from likes where pId=? and uId=?");
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);
			ResultSet rSet = pstmt.executeQuery();
			if(rSet.next())
				liked = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return liked;
	}
	
	public boolean deleteLike(int pId, int uId) {
		boolean isDeleted = false;
		try {
			String query = "delete from likes where pId=? and uId=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);
			pstmt.executeUpdate();
			isDeleted = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDeleted;
	}
}
