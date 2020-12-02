<%@page import="com.anshul.Auth.Role"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib
prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
      src="https://code.jquery.com/jquery-3.5.1.min.js"
      integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
      crossorigin="anonymous"
    ></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>

  <body>
    <div class="jumbotron">
      <h1>Welcome <sec:authentication property="name" /></h1>

      <a class="btn btn-secondary" href="/admin">Home </a>
      <a class="btn btn-primary" href="/admin/company">Company </a>
      <a class="btn btn-secondary" href="/admin/students">Students </a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>

    <div class="container my-5">
      <h1>All Universities</h1>

      <input
        class="form-control"
        type="text"
        id="myInput"
        onkeyup="myFunction()"
        placeholder="Search for names.."
      />

      <ul class="list-group my-2" id="myUL">
        <c:forEach items="${universities}" var="uni">
          <c:if test="${not uni.name.equals('Not Defined')}">
            <li class="list-group-item">
              <a href="/admin/university/${uni.id}">${uni.name}</a>
            </li>
          </c:if>
        </c:forEach>
      </ul>

      <script>
        function myFunction() {
          // Declare variables
          var input, filter, ul, li, a, i, txtValue;
          input = document.getElementById("myInput");
          filter = input.value.toUpperCase();
          ul = document.getElementById("myUL");
          li = ul.getElementsByTagName("li");

          // Loop through all list items, and hide those who don't match the search query
          for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("a")[0];
            txtValue = a.textContent || a.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              li[i].style.display = "";
            } else {
              li[i].style.display = "none";
            }
          }
        }
      </script>
    </div>
  </body>
</html>
