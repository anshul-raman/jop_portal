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

      <a class="btn btn-primary" href="/admin/company">Company </a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>

    <div class="container-fluid">
      <div class="row">
        <div class="col-6 my-3 border-right">
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
                        
                        <div class="p-3 m-3 d-flex flex-wrap align-content-around justify-content-start">

                        <div class="mx-3 my-2">
                         Name:
                          <div class="card p-2 text-center" >
                               ${will.user.first_name} ${will.user.middle_name} ${will.user.last_name} 
                          </div>
                        </div>

                        <div class="mx-3 my-2">
                         Email:
                          <div class="card p-2 text-center" >
                               ${will.user.email} 
                          </div>
                        </div>

                        <div class="mx-3 my-2">
                         Fathers Name:
                          <div class="card p-2 text-center" >
                               ${will.user.fathers_name} 
                          </div>
                        </div>

                         <div class="mx-3 my-2">
                         Mothers Name:
                          <div class="card p-2 text-center" >
                               ${will.user.mothers_name} 
                          </div>
                        </div>

                         <div class="mx-3 my-2">
                         Fathers ccupation:
                          <div class="card p-2 text-center" >
                               ${will.user.fathers_occupation} 
                          </div>
                        </div>


                         <div class="mx-3 my-2">
                         Mothers occupation
                          <div class="card p-2 text-center" >
                               ${will.user.mothers_occupation} 
                          </div>
                        </div>

                         <div class="mx-3 my-2">
                         Language
                          <div class="card p-2 text-center" >
                               ${will.user.mother_tongue} 
                          </div>
                        </div>

                         <div class="mx-3 my-2">
                         Current Address
                          <div class="card p-2 text-center" >
                               ${will.user.current_address.house_no},  
                               ${will.user.current_address.locality} 
                               ${will.user.current_address.city} 
                               ${will.user.current_address.state} 
                               ${will.user.current_address.pincode} 
                          </div>
                        </div>

                        <div class="mx-3 my-2">
                         Permant Address
                          <div class="card p-2 text-center" >
                              ${will.user.permanent_address.house_no},  
                               ${will.user.permanent_address.locality} 
                               ${will.user.permanent_address.city} 
                               ${will.user.permanent_address.state} 
                               ${will.user.permanent_address.pincode} 
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
                              <h5 class="card-title">${flt.duration}</h5>
                              <p class="card-text"> ${fld.description} </p>
                              
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
        <div hidden class="col togglerClass">
          <h3>Student Details</h3>
          <span id="stud_details"></span>

          <h3>Resume Fields</h3>
          <span id="res_fields" class="d-flex"></span>
        </div>
      </div>
      <div></div>
    </div>
  </body>
</html>
