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
      <h1>Welcome <sec:authentication property="name"/> </h1>

      <a class="btn btn-secondary" href="/admin">Home </a>
      <a class="btn btn-primary" href="/admin/company">Company </a>
      <a class="btn btn-secondary" href="/admin/students">Students </a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>

    <div class="container-fluid">
      <div class="row">
        <div class="col-4 my-3 border-right">
          <h3>Willing Candidates</h3>
          <table class="table my-3">
            <thead class="thead-dark">
              <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Details</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach
                items="${willingnessess}"
                var="will"
                varStatus="counter"
              >
                <tr>
                  <th scope="row">${counter.index + 1}</th>
                  <td>${will.user.first_name} ${will.user.last_name}</td>
                  <td>${will.user.email}</td>
                  <td>
                    <button
                      id="viewDetails_${will.user_id}"
                      class="btn btn-link"
                    >
                      View Details
                    </button>

                    <script>
                      $("#viewDetails_${will.user_id}").click(function (event) {
                        event.preventDefault();
                        $(".togglerClass").removeAttr("hidden");

                        $("#stud_details").html(`
                        
                         <div class="card container shadow-sm">
                            <div class="card-body">
                              <div class="row">
                                <div class="col-4">
                                  <table class="table table-bordered table-hover h-100">
                                    <tr>
                                      <td>First Name:</td>
                                      <td>${will.user.first_name}</td>
                                    </tr>
                                    <tr>
                                      <td>Middle Name:</td>
                                      <td>${will.user.middle_name}</td>
                                    </tr>
                                    <tr>
                                      <td>Last Name:</td>
                                      <td>${will.user.last_name}</td>
                                    </tr>
                                  </table>
                                </div>

                                <div class="col-4">
                                  <table class="table table-bordered table-hover h-100">
                                    <tr>
                                      <td>Fathers Name:</td>
                                      <td>${will.user.fathers_name}</td>
                                    </tr>
                                    <tr>
                                      <td>Mothers Name:</td>
                                      <td>${will.user.mothers_name}</td>
                                    </tr>
                                    <tr>
                                      <td>Fathers Occupation:</td>
                                      <td>${will.user.fathers_occupation}</td>
                                    </tr>
                                    <tr>
                                      <td>Mothers Occupation:</td>
                                      <td>${will.user.mothers_occupation}</td>
                                    </tr>
                                  </table>
                                </div>

                                <div class="col-4">
                                  <table class="table table-bordered table-hover h-100">
                                    <tr>
                                      <td>Current Address:</td>
                                      <td>
                                        <p>
                                          ${will.user.current_address.house_no},
                                          ${will.user.current_address.locality},
                                          ${will.user.current_address.city} ${will.user.current_address.state}
                                          ${will.user.current_address.pincode},
                                          ${will.user.current_address.country}
                                        </p>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>Permanent Address:</td>
                                      <td>
                                        <p>
                                          ${will.user.permanent_address.house_no},
                                          ${will.user.permanent_address.locality},
                                          ${will.user.permanent_address.city}
                                          ${will.user.permanent_address.state}
                                          ${will.user.permanent_address.pincode},
                                          ${will.user.permanent_address.country}
                                        </p>
                                      </td>
                                    </tr>
                                  </table>
                                </div>
                              </div>
                            </div>
                          </div>

                        
                        
                        `);

                        $("#res_fields").empty();

                        // <c:forEach items="${will.resume.resumeFields}" var="fld">

                        $("#res_fields").append(`

                          <div class="card m-3 shadow-sm" style="width: 300px">
                            <div class="card-header">
                              ${fld.title}
                            </div>
                            <div class="card-body">
                              <h6 class="card-title">${fld.duration}</h6>
                              <p class="card-text"> ${fld.description} </p>
                              
                              <c:if test="${fld.verified}">
                                <i class="fa fa-check" aria-hidden="true"></i> Verified
                              </c:if>
                              <c:if test="${not fld.verified}">
                                <i class="fa fa-times" aria-hidden="true"></i> Not
                                Verified
                              </c:if>
                            
                              
                            </div>
                          </div>
                        
                        `);
                        // </c:forEach>
                      });
                    </script>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div hidden class="col-8 togglerClass">
          <h3>Student Details</h3>
          <span id="stud_details"></span>

          <h3>Resume Fields</h3>
          <span id="res_fields" class="d-flex flex-wrap"></span>
        </div>
      </div>
      <div></div>
    </div>
  </body>
</html>
