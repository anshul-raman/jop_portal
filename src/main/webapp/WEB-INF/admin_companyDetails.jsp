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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

	<!-- jQuery and JS bundle w/ Popper.js -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</head>

<body>

	<div class="container">
		<h1>Welcome.</h1>
	</div>

	<div class="container my-5">

		<h1> Company Details </h1>
		<form action="/admin/company/update" method="post">

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />
			<input hidden type="text" value="${company.id}" readonly id="id" name="id">


			<div class="form-group">
				<label for="name">Company Name</label>
				<input type="text" class="form-control" id="name" name="name" value="${company.name}">
			</div>

			<div class="form-group">
				<label for="profile"> profile</label>
				<input type="text" class="form-control" id="profile" name="profile" value="${company.profile}">
			</div>

			<div class="form-group">
				<label for="job_description">Job Description</label>
				<input type="text" class="form-control" id="job_description" name="job_description"
					value="${company.job_description}">
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>

	</div>

	<div class="container my-5">

		<h1>Criterias</h1>

		<form action="/admin/criteria/add" method="POST">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />
			<input hidden type="text" value="${company.id}" readonly id="comp_id" name="comp_id">

			<button id="addCriteria" class="btn btn-primary">Add Criteria</button>
		</form>


		<div class="container my-5">




			<c:forEach items="${company.criteria}" var="crit">

				<div class="container card my-3 p-3">

					<div class="row ">

						<div class="col-6">

							<form action="/admin/criteria/update" method="POST">

								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />
								<input hidden type="text" value="${crit.id}" readonly id="id" name="id">
								<input hidden type="text" value="${crit.company_id}" readonly id;="company_id"
									name="company_id">


								<div class="form-group">
									<label for="type">Criteria Type</label>
									<select class="form-control" name="type" id="type">

										<option value="${crit.type}" selected>${crit.type_details.name}
										</option>
										<c:forEach items="${allCriterias}" var="criteria">
											<c:if test="${criteria.id != crit.type}">
												<option value="${criteria.id}">${criteria.name}</option>
											</c:if>
										</c:forEach>

									</select>
								</div>

								<div class="form-group">
									<label for="allowed_backlogs">allowed_backlogs</label>
									<input type="text" class="form-control" id="allowed_backlogs"
										name="allowed_backlogs" value="${crit.allowed_backlogs}">
								</div>

								<div class="form-group">
									<label for="year_min">Minimum Year</label>
									<input type="text" class="form-control" id="year_min" name="year_min"
										value="${crit.year_min}">
								</div>

								<div class="form-group">
									<label for="year_max">Maximum Year</label>
									<input type="text" class="form-control" id="year_max" name="year_max"
										value="${crit.year_max}">
								</div>

								<div class="form-group">
									<label for="min_cgpa">Minimum CGPA</label>
									<input type="text" class="form-control" id="min_cgpa" name="min_cgpa"
										value="${crit.min_cgpa}">
								</div>

								<div class="form-group">
									<label for="min_marks">Minimum Marks</label>
									<input type="text" class="form-control" id="min_marks" name="min_marks"
										value="${crit.min_marks}">
								</div>

								<div class="form-group">
									<label for="min_percentage">Minimum Percentage</label>
									<input type="text" class="form-control" id="min_percentage" name="min_percentage"
										value="${crit.min_percentage}">
								</div>


								<button class="btn btn-primary" type="submit">Update</button>

							</form>

							<form action="/admin/criteria/delete" , method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />
								<input hidden type="text" value="${crit.id}" readonly id="id" name="id">
								<input hidden type="text" value="${crit.company_id}" readonly id;="company_id"
									name="company_id">

								<button type="submit" class="btn btn-danger">
									<i class="fa fa-trash" aria-hidden="true"></i>
									Delete
								</button>
							</form>


						</div>

						<div class="col">

							Specialisations:

							<div class="container" style="overflow: scroll; height: 80%;">


								<c:forEach items="${crit.specialisatons}" var="spec">

									<form class="form card" action="/admin/specialisation/delete" method="POST">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"
											readonly />
										<input hidden type="text" value="${spec.id}" name="id">
										<input hidden type="text" value="${crit.company_id}" name="company_id">

										<label class="form-control">${spec.specialisation}</label>
										<button type="submit" class="btn btn-link">
											<i class="fa fa-trash" aria-hidden="true"></i>
											Delete
										</button>

									</form>

								</c:forEach>

							</div>

							<div class="container my-3">
								<form action="/admin/specialisation/add" method="POST">
									<input type="hidden" name="criteria_id" type="hidden" value="${crit.id}" readonly />
									<input type="hidden" name="company_id" type="hidden" value="${crit.company_id}" readonly />

									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"
										readonly />
									<input type="text" class="form-control" required name="specialisation">
									<button class="btn btn-primary"> Add new specialisation</button>
								</form>
							</div>




						</div>

					</div>

				</div>





			</c:forEach>



		</div>




	</div>


</body>



</html>