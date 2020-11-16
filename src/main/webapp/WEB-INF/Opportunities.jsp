<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix = "fmt"
uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
      $.fn.hasAttr = function (name) {
        return this.attr(name) !== undefined;
      };

      $(document).ready(function () {
        $(".toggle_edit").click(function (e) {
          e.preventDefault();

          if ($(this).prev().hasAttr("disabled")) {
            $(this).prev().removeAttr("disabled");
            $(this).html("Disable Edit");
          } else {
            $(this).prev().attr("disabled", "disabled");
            $(this).html("Enable Edit");
          }
        });
      });
    </script>

    <title>Personal Profile</title>
  </head>

  <body>
    <div class="jumbotron">
      <h1>Welcome ${profile.username}</h1>

      <a class="btn btn-secondary" href="/personalprofile">Personal profile</a>
      <a class="btn btn-primary" href="/opportunities">Opportunities</a>
      <a class="btn btn-secondary" href="/resume">Resume</a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>

    <div class="container">
      <c:forEach items="${companies}" var="comp">
        <div class="col-3">
          <div class="card bg-light mb-3" style="max-width: 18rem">
            <div class="card-header">${comp.name}</div>
            <div class="card-body">
              <h5 class="card-title">${comp.profile}</h5>
              <p class="card-text">${comp.job_description}</p>

              <form action="#">
                <div class="form-group">
                  <label for="resume_list"> select resume</label>
                  <select class="form-control" id="resume_list">
                    <!-- <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option> -->

                    <c:forEach items="${resumes}" var="res" >
                        <option value="${res.id}" > ${res.name}  </option>
                    </c:forEach>

                  </select>
                </div>
              </form>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

    <c:if test="${not empty response}">
      <script>
        swal("${ response }");
      </script>
    </c:if>
  </body>
</html>
