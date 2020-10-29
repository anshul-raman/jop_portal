<%@page import="com.anshul.Auth.Role"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


</head>

<body>

	<div class="jumbotron">
		<h1> Welcome ${profile.username} </h1>

		<a class="btn btn-primary" href="/admin/company">Company </a>
		<a class="btn btn-link" href="/logout">Logout</a>



	</div>

	<div class="container">

		<h2>All Companies</h2>
		<div class="row">

			<c:forEach items="${companies}" var="comp">

				<div class="col">



					<div class="card bg-light mb-3" style="max-width: 18rem;">
						<div class="card-header">${comp.name}</div>
						<div class="card-body">
							<h5 class="card-title">${comp.profile}</h5>
							<p class="card-text">${comp.job_description}</p>
							<a href="/admin/company/${comp.id}" class="btn btn-primary">Edit Details</a>
							<a href="#" class="btn btn-danger">Delete</a>
						</div>
					</div>

				</div>

			</c:forEach>


		</div>


	</div>


</body>

</html>