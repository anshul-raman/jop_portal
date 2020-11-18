<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">

	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

	<!-- jQuery and JS bundle w/ Popper.js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>




	<title>Registration</title>
</head>

<body>

	<div class="container">

		<h1> Register New User</h1>

		<div class="container">

			<form method="post">
				<div class="form-group">
					<label for="uername">Username</label>
					<input name="username" type="text" class="form-control" id="uername" placeholder="Enter Username"
						required>
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input name="password" type="password" class="form-control" id="password" placeholder="Password"
						required>
					<label for="re_password">Re Enter Password</label>
					<input name="re_password" type="password" class="form-control" id="re_password"
						placeholder="Password" required>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />

				<button type="submit" class="btn btn-primary">Submit</button>
				<a href="/"> Login </a>
			</form>

		</div>

		

		<c:if test="${not empty response}">
			${response}
		</c:if>

	</div>

</body>

</html>