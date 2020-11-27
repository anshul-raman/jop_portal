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
      <h1>Welcome <sec:authentication property="name"/> </h1>

      <a class="btn btn-primary" href="/admin">Home </a>
      <a class="btn btn-secondary" href="/admin/company">Company </a>
      <a class="btn btn-secondary" href="/admin/students">Students </a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>

    <div class="container">
      <h3>Add/Delete/Modify</h3>
      <ul>
        <li><a href="/admin/company">Company</a></li>
        <li><a href="/admin/students">Students</a></li>
      </ul>
    </div>
  </body>
</html>
