<%@page import="com.anshul.Auth.Role"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>

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
      <h1>Welcome <sec:authentication property="name"/></h1>

      <a class="btn btn-secondary" href="/admin">Home </a>
      <a class="btn btn-secondary" href="/admin/company">Company </a>
      <a class="btn btn-primary" href="/admin/students">Students </a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>

    <div class="container">
      <h2>All Students</h2>

      <table class="table my-3">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Enabled</th>
            <th schope="col">Details</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${students}" var="stud" varStatus="counter">
            <tr>
              <th scope="row">${counter.index + 1}</th>
              <td>${stud.first_name} ${stud.last_name}</td>
              <td>${stud.email}</td>
              <c:if test="${stud.user.enabled}">
                <td>Enabled</td>
              </c:if>
              <c:if test="${not stud.user.enabled}">
                <td>disabled</td>
              </c:if>
              <td>
                <a href="/admin/students/${stud.id}" class="btn btn-link">
                  View Details
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
