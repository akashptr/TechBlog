<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>New Registration</title>
</head>
<body>

	<%@include file="normal_navbar.jsp"%>

	<main class="primary-background p-3">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div
						class="card-header text-center secondary-background text-white">
						<span class="fa fa-user-circle fa-3x"></span> <br> Register
						here
					</div>
					<div class="card-body">
						<form id="regForm" action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="user_name">User name</label> <input type="text"
									name="userName" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter your name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
							<div class="form-group">
								<label>Select gender</label>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gender"
										id="male" value="male" checked> <label
										class="form-check-label" for="male"> Male </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gender"
										id="female" value="female"> <label
										class="form-check-label" for="female"> Female </label>
								</div>
							</div>
							<div class="form-group">
								<textarea name="about" class="form-control" rows="3"
									placeholder="Write something about yourself"></textarea>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="agreement"
									onclick="toggleSubmit()"> <label
									class="form-check-label" for="agreement">Agree terms
									and conditions</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-3x fa-spin"></span>
								<h4>Please wait...</h4>
							</div>
							<button id="submit" type="submit" class="btn btn-outline-dark"
								disabled>Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>

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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		function toggleSubmit() {
			var agreeCheckbox = document.getElementById('agreement');
			var submitButton = document.getElementById('submit');
			submitButton.disabled = !agreeCheckbox.checked;

		}
		$(document).ready(function() {
			console.log('loaded');
			$('#regForm').on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);
				$('#loader').show();
				$('#submit').hide();
				$.ajax({
					url : "RegisterServlet",
					type : 'post',
					data : form,
					success : function(response, textStatus, jqXHR) {
						console.log(response);
						$('#loader').hide();
						$('#submit').show();

						if (response.trim().toLowerCase() === 'done') {
							swal("Data saved successfully", "Redirecting to login page", "success")
							.then((value) => {
							  window.location = 'login_page.jsp';
							});
						} else {
							swal({
								  title: "Something went wrong",
								  text: "Data is not saved",
								  icon: "warning",
								  dangerMode: true
								})
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR);
						$('#loader').hide();
						$('#submit').show();
						swal({
							  title: "Something went wrong",
							  text: "Request is not sent properly",
							  icon: "warning",
							  dangerMode: true
							})
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>
</body>
</html>