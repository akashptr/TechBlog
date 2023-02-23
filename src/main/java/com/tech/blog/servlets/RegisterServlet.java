package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		/* Fetching form data */
		String name = request.getParameter("userName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");

		/* Creating user */
		User user = new User(name, email, password, gender, about);
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		
		/* Saving the data */
		if (userDao.saveUser(user)) {
			out.println("Done");
		} else {
			out.println("Failed");
		}
	}
}
