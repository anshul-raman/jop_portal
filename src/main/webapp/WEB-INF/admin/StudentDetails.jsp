 <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"
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
      <a class="btn btn-secondary" href="/admin/company">Company </a>
      <a class="btn btn-primary" href="/admin/students">Students </a>
      <a class="btn btn-link" href="/logout">Logout</a>
    </div>


    <div class="container">
        ${user.first_name}
    </div>

    <c:forEach items="${resumeFields}" var="flds">
        <div class="card">

            <p>
                ${flds.title} 
                ${flds.description}
                ${flds.duration}
            </p>

            <button  id="verify_${flds.id}"  class="btn btn-success">Verify</button>
            <span id="res_${flds.id}" ></span>
            <script>
                $('#verify_${flds.id}').click(function(event){
                    event.preventDefault();
                   var dt = {
                            field_id : '${flds.id}',
                            verifier: '<sec:authentication property="name"/>'
                   }
                    $.ajax({
                        method: 'GET',
                        url: '/admin/students/verifyfield',
                        data: dt,
                        success: (data2,  textStatus,  jqXHR) => {
                            $('#res_${flds.id}').html('SUCC')
                        },
                        error: (jqXHR,  textStatus,  errorThrown) => {
                            console.log(dt);
                            console.log(textStatus);
                            console.log(errorThrown);
                            console.log(jqXHR);
                            $('#res_${flds.id}').html('ERR')
                        }


                    });
                });
            </script>


        </div>
    </c:forEach>

  </body>
</html>
