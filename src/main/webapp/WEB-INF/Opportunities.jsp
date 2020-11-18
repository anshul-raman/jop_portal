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

    <div class="row ml-3 p-3">
      <div class="col-8 border-right">
        <h3 class="p-3">New Oppotunities</h3>

        <div class="row">
          <c:forEach items="${companies}" var="comp">
            <div class="col">
              <div class="card bg-light mb-3" style="max-width: 18rem">
                <div class="card-header">${comp.name}</div>
                <div class="card-body">
                  <h5 class="card-title">${comp.profile}</h5>
                  <p class="card-text">${comp.job_description}</p>

                  <form action="/opportunities/addWillingness" method="POST">
                    <input
                      type="hidden"
                      name="${_csrf.parameterName}"
                      value="${_csrf.token}"
                      readonly
                    />
                    <input
                      type="hidden"
                      name="company_id"
                      value="${comp.id}"
                      readonly
                    />
                    <input
                      type="hidden"
                      name="user_id"
                      value="${profile.id}"
                      readonly
                    />

                    <div class="form-group">
                      <label for="resume_list"> select resume</label>
                      <select
                        name="resume_id"
                        class="form-control"
                        id="resume_list"
                      >
                        <option value="#">SELECT RESUME</option>
                        <c:forEach items="${resumes}" var="res">
                          <option value="${res.id}">${res.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                    <button class="btn btn-primary">Apply</button>
                  </form>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>

      <div class="col">
        <h3 class="m-3">My Willingness</h3>
        <c:forEach items="${willingnesses}" var="will">
          <div class="card w-50 my-4">
            <div class="card-body">
              <h5 class="card-title">${will.company.name}</h5>
              <h6 class="card-subtitle mb-2 text-muted">
                ${will.company.profile}
              </h6>
              <p class="card-text">${will.company.job_description}</p>
              <div class="form-control my-2">${will.resume.name}</div>
              <a
                href="/opportunities/delete/${will.company_id}"
                class="btn btn-danger"
                >Delete</a
              >
            </div>
          </div>
        </c:forEach>
      </div>
    </div>

    <c:if test="${not empty response}">
      <script>
        swal("${ response }");
      </script>
    </c:if>
  </body>
</html>
