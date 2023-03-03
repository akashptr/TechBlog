package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfileHelper;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPostServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		
		// Fetching data from profile post form
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		String postCode = request.getParameter("postCode");
		Part postPicPart = request.getPart("postPic");
		String postPic = postPicPart.getSubmittedFileName();
		int postCategory = Integer.parseInt(request.getParameter("postCategory"));
		int postUser = user.getId();
		
		// Creating post
		Post post = new Post(postTitle, postContent, postCode, postPic, postCategory, postUser);
		
		// Saving post
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		if(postDao.savePost(post)) {
			String path = getServletContext().getRealPath("/") + "blogPic" + File.separator + postPic;
			if(ProfileHelper.saveFile(postPicPart.getInputStream(), path)) {
				out.println("done");
			} else {
				out.println("photo not saved");
			}
		} else {
			out.println("error");
		}
	}

}
