<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix="sec"
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

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <!-- jQuery and JS bundle w/ Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
      crossorigin="anonymous"
    ></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
      <h2>Personal Details</h2>

      <div class="card container shadow-sm">
        <div class="card-body">
          <div class="row">
            <div class="col-4">
              <table class="table table-bordered table-hover h-100">
                <tr>
                  <td>First Name:</td>
                  <td>${user.first_name}</td>
                </tr>
                <tr>
                  <td>Middle Name:</td>
                  <td>${user.middle_name}</td>
                </tr>
                <tr>
                  <td>Last Name:</td>
                  <td>${user.last_name}</td>
                </tr>
              </table>
            </div>

            <div class="col-4">
              <table class="table table-bordered table-hover h-100">
                <tr>
                  <td>Fathers Name:</td>
                  <td>${user.fathers_name}</td>
                </tr>
                <tr>
                  <td>Mothers Name:</td>
                  <td>${user.mothers_name}</td>
                </tr>
                <tr>
                  <td>Fathers Occupation:</td>
                  <td>${user.fathers_occupation}</td>
                </tr>
                <tr>
                  <td>Mothers Occupation:</td>
                  <td>${user.mothers_occupation}</td>
                </tr>
              </table>
            </div>

            <div class="col-4">
              <table class="table table-bordered table-hover h-100">
                <tr>
                  <td>Current Address:</td>
                  <td>
                    <p>
                      ${user.current_address.house_no},
                      ${user.current_address.locality},
                      ${user.current_address.city} ${user.current_address.state}
                      ${user.current_address.pincode},
                      ${user.current_address.country}
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>Permanent Address:</td>
                  <td>
                    <p>
                      ${user.permanent_address.house_no},
                      ${user.permanent_address.locality},
                      ${user.permanent_address.city}
                      ${user.permanent_address.state}
                      ${user.permanent_address.pincode},
                      ${user.permanent_address.country}
                    </p>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>

      <div class="container p-0 my-4">
        <h2>All Fields</h2>

        <div class="row">
          <c:forEach items="${resumeFields}" var="fld">
            <div class="col-6">
              <div class="card m-3 shadow-sm">
                <div class="card-header">${fld.title}</div>
                <div class="card-body">
                  <h6 class="card-title">${fld.duration}</h6>
                  <p class="card-text">${fld.description}</p>

                  <hr />

                  <p class="card-text">
                    <c:if test="${fld.verified}">
                      <i class="fa fa-check" aria-hidden="true"></i> Verified
                    </c:if>
                    <c:if test="${not fld.verified}">
                      <i class="fa fa-times" aria-hidden="true"></i> Not
                      Verified
                    </c:if>
                  </p>

                  <button id="verify_${fld.id}" class="btn btn-success">
                    Verify
                  </button>
                  <button id="unverify_${fld.id}" class="btn btn-danger">
                    Unverify
                  </button>

                  <span id="res_${fld.id}"></span>
                </div>
              </div>
            </div>

            <script>
              $('#verify_${fld.id}').click(function(event){
                  event.preventDefault();
                 var dt = {
                          field_id : '${fld.id}',
                          verifier: '<sec:authentication property="name"/>',
                          method: 'verify',
                          ${_csrf.parameterName}: '${_csrf.token}'
                 }
                  $.ajax({
                      method: 'POST',
                      url: '/admin/students/fieldVerification',
                      data: dt,
                      success: (data,  textStatus,  jqXHR) => {


                          swal(data.response)
                          .then(()=>{
                              location.reload(true);
                              });

                      },
                      error: (jqXHR,  textStatus,  errorThrown) => {
                          console.log(dt);
                          console.log(textStatus);
                          console.log(errorThrown);
                          console.log(jqXHR);
                          $('#res_${fld.id}').html('ERROR')
                      }


                  });
              });

              $('#unverify_${fld.id}').click(function(event){
                  event.preventDefault();
                 var dt = {
                          field_id : '${fld.id}',
                          verifier: '<sec:authentication property="name"/>',
                          method: 'unverify',
                          ${_csrf.parameterName}: '${_csrf.token}'
                 }
                  $.ajax({
                      method: 'POST',
                      url: '/admin/students/fieldVerification',
                      data: dt,
                      success: (data,  textStatus,  jqXHR) => {

                         swal(data.response)
                          .then(()=>{
                              location.reload(true);
                              });
                      },
                      error: (jqXHR,  textStatus,  errorThrown) => {
                          console.log(dt);
                          console.log(textStatus);
                          console.log(errorThrown);
                          console.log(jqXHR);
                          $('#res_${fld.id}').html('ERROR')
                      }


                  });
              });
            </script>
          </c:forEach>
        </div>
      </div>
    </div>
  </body>
</html>
