<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Error</title>
</head>
<body>
	<div class="container text-center">
		<img src="img/error.png" class="img-fluid">
		<h3 class="display-4">Sorry! Something went wrong...</h3>
		<h4><%= exception %></h4>
		<a href="index.jsp" class="btn btn-outline-dark btn-lg mt-3">Home</a>
	</div>
</body>
</html>