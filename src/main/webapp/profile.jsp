<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Message"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

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
<title>Profile page</title>
</head>
<body>
	<!-- Navbar start -->
	<nav class="navbar navbar-expand-lg navbar-dark secondary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-book"></span> Learn Programming and code <span
						class="sr-only"> (current) </span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span class="fa fa-tasks"></span>
						Category </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure & Algorithms</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book"></span> Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="login_page.jsp"><span
						class="fa fa-user-circle"></span> Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="register_page.jsp"><span class="fa fa-user-plus"></span>
						Signup</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profileModal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet"><span class="fa fa-user-times"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->
	<%
	Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%>" role="alert">
		<%=msg.getContent()%></div>
	<%
	session.removeAttribute("msg");
	}
	%>
	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header secondary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profilepic/<%=user.getProfile()%>" class="img-fluid"
							style="height: 100px; width: 110px; border-radius: 50%;"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<div id="profileDetails">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getrDate().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="profileEdit" style="display: none">
							<h5>Please edit carefully</h5>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" name="userName"
											value="<%=user.getName()%>" class="form-control"></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" name="userEmail"
											value="<%=user.getEmail()%>" class="form-control"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" name="userPassword"
											value="<%=user.getPassword()%>" class="form-control"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<td>Status :</td>
										<td><textarea rows="3" name="userAbout"
												class="form-control"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<td>Update Photo:</td>
										<td><input name="userProfile" type="file"
											class="form-control"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-dark">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="editBtn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
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
	<script>
		$(document).ready(function() {
			let isEdit = false;
			$("#editBtn").click(function() {
				if (isEdit) {
					$("#profileDetails").show();
					$("#profileEdit").hide();
					$(this).text("Edit")
				} else {
					$("#profileDetails").hide();
					$("#profileEdit").show();
					$(this).text("Back");
				}
				isEdit = !isEdit;
			});
		});
	</script>
</body>
</html>