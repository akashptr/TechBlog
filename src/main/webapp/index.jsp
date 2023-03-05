<%@page import="java.util.Iterator"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyles.css" type="text/css">
<title>Home</title>
</head>
<body>

	<!-- navbar -->
	<%@include file="normal_navbar.jsp"%>

	<!-- Banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron secondary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>Welcome to technical blog, world of technology</p>
				<blockquote>
					<q>Programs must be written for people to read, and only
						incidentally for machines to execute.</q> <cite>-Harold Abelson</cite>
				</blockquote>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span> Start! its free
				</button>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<%
	PostDao postDao = new PostDao(ConnectionProvider.getConnection());
	List<Post> allPost = postDao.getAllPost();
	Iterator<Post> postIterator = allPost.iterator();
	%>

	<!-- Cards -->
	<div class="container">
		<%
		OUTER: while (true) {
		%>
		<div class="row mb-2">
			<%
			for (int i = 0; i < 3; i++) {
				if (postIterator.hasNext()) {
					Post post = postIterator.next();
					//create card
			%>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%=post.getpTitle()%></h5>
						<p class="card-text"><%=post.getpContent()%></p>
						<a href="showBlogPage.jsp?pid=<%=post.getPid()%>"
							class="btn btn-outline-dark btn-sm">Read more...</a>
					</div>
				</div>
			</div>
			<%
			} else {
			break OUTER;
			}
			}
			%>
		</div>
		<%
		}
		%>
	</div>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>