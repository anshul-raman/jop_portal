<%@page import="com.anshul.Auth.Role"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <!-- CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
      crossorigin="anonymous"
    />

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
      crossorigin="anonymous"
    />

    <!-- jQuery and JS bundle w/ Popper.js -->
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
    <div class="jumbotron">
      <h1>Welcome ${profile.username}</h1>

      <a class="btn btn-secondary" href="/admin">Home </a>
      <a class="btn btn-primary" href="/admin/company">Company </a>
      <a class="btn btn-secondary" href="/admin/students">Students </a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>

    <div class="container">
      <div class="container d-flex my-3">
        <h2>All Companies</h2>

        <form class="form-inline" method="POST" action="/admin/company/add">
          <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
            readonly
          />

          <button class="btn btn-link">
            <i class="fa fa-plus-square" aria-hidden="true"></i> Add Company
          </button>
        </form>
      </div>

      <div class="row">
        <c:forEach items="${companies}" var="comp">
          <div class="col-3">
            <div class="card bg-light mb-3" style="max-width: 18rem">
              <div class="card-header">${comp.name}</div>
              <div class="card-body">
                <h5 class="card-title">${comp.profile}</h5>
                <p class="card-text">${comp.job_description}</p>
                <a href="/admin/company/${comp.id}" class="btn btn-primary"
                  >Edit Details</a
                >

                <a
                  href="/admin/company/delete/${comp.id}"
                  class="btn btn-danger"
                >
                  Delete
                </a>
                <hr>
                <a href="/admin/company/willingness/${comp.id}" class="btn btn-info">Willing Students</a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </body>
</html>
