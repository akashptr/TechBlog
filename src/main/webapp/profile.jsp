<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.User"%>
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
<title>Profile page</title>
</head>
<body>
	<%= user.getName() %>
	<br>
	<%= user.getEmail() %>
	<br>
	<%= user.getAbout() %>
</body>
</html>