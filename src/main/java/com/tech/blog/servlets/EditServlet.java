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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfileHelper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("currentUser");
		user.setName(request.getParameter("userName"));
		user.setEmail(request.getParameter("userEmail"));
		user.setPassword(request.getParameter("userPassword"));
		user.setAbout(request.getParameter("userAbout"));
		String oldProfileName = user.getProfile();
		Part profilePart = request.getPart("userProfile");
		user.setProfile(profilePart.getSubmittedFileName());

		Message msg = null;
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		if (dao.updateUser(user)) {
			String profilePath = getServletContext().getRealPath("/") + "profilepic" + File.separator;
			if(!oldProfileName.equals("default.png"))
				ProfileHelper.deleteFile(profilePath + oldProfileName);
			if (ProfileHelper.saveFile(profilePart.getInputStream(), profilePath + user.getProfile())) {
				msg = new Message("Profile updated successfully", "success", "alert-success");
			} else
				msg = new Message("Profile updated but profile picture not saved", "partial success", "alert-danger");
		} else
			msg = new Message("Error occured in database", "Error", "alert-danger");
		session.setAttribute("msg", msg);
		response.sendRedirect("profile.jsp");
	}
}
