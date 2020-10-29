<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <!-- jQuery and JS bundle w/ Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        $.fn.hasAttr = function (name) {
            return this.attr(name) !== undefined;
        };

        $(document).ready(function () {
            $('.toggle_edit').click(function (e) {
                e.preventDefault();

                if ($(this).prev().hasAttr('disabled')) {
                    $(this).prev().removeAttr('disabled');
                    $(this).html("Disable Edit");
                } else {
                    $(this).prev().attr('disabled', 'disabled');
                    $(this).html("Enable Edit");
                }
            });
        });


    </script>

    <title>Personal Profile</title>
</head>

<body>

    <div class="jumbotron">
        <h1> Welcome ${profile.username} </h1>

        <a class="btn btn-primary" href="/personalprofile">Personal profile</a>    
        <a class="btn btn-secondary"href="/opportunities">Opportunities</a>
        <a class="btn btn-secondary"href="/resume">Resume</a>
        <a class="btn btn-link"href="/logout">Logout</a>



    </div>

    <div class="container my-5">
        <h2> Edit Personal Details. </h2>



        <div class="container">

            <div class="row">


                <div class="col-sm card p-4 m-1">
                    <h3> Personal Details </h3>
                    <form action="/personalprofile/updatedetails" method="post" name="personalprofile">
                        <fieldset disabled>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />
                            <input hidden type="text" value="${profile.id}" readonly id="id" name="id">
                            <input hidden type="text" value="${profile.current_address_fk}" readonly
                                id="current_address_fk" name="current_address_fk">
                            <input hidden type="text" value="${profile.permanent_address_fk}" readonly
                                id="permanent_address_fk" name="permanent_address_fk">
                            <div class="form-group">
                                <label for="first_name"> First Name </label>
                                <input id="first_name" name="first_name" class="form-control" type="text"
                                    value="${profile.first_name}">
                            </div>
                            <div class="form-group">

                                <label for="middle_name"> Middle Name </label>
                                <input id="middle_name" name="middle_name" class="form-control" type="text"
                                    value="${profile.middle_name} ">

                            </div>

                            <div class="form-group">
                                <label for="last_name"> Last Name </label>
                                <input id="last_name" name="last_name" class="form-control" type="text"
                                    value="${profile.last_name} ">
                            </div>

                            <div class="form-group">
                                <label for="email"> Email </label>
                                <input id="email" name="email" class="form-control" type="email"
                                    value="${profile.email} ">
                            </div>

                            <div class="form-group">
                                <label for="dob"> DOB </label>
                                <input id="dob" name="dob" class="form-control" type="date"
                                    value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${profile.dob}"/>'>
                            </div>

                            <div class="form-group">
                                <label for="fathers_name"> Father's name </label>
                                <input id="fathers_name" name="fathers_name" class="form-control" type="text"
                                    value="${profile.fathers_name} ">
                            </div>

                            <div class="form-group">
                                <label for="mothers_name"> Mother's name</label>
                                <input id="mothers_name" name="mothers_name" class="form-control" type="text"
                                    value="${profile.mothers_name} ">
                            </div>

                            <div class="form-group">
                                <label for="fathers_occupation"> Father's occupation </label>
                                <input id="fathers_occupation" name="fathers_occupation" class="form-control"
                                    type="text" value="${profile.fathers_occupation} ">
                            </div>

                            <div class="form-group">
                                <label for="mothers_occupation"> Mother's occupation </label>
                                <input id="mothers_occupation" name="mothers_occupation" class="form-control"
                                    type="text" value="${profile.mothers_occupation} ">
                            </div>

                            <div class="form-group">
                                <label for="mother_tongue"> Mother tongue </label>
                                <input id="mother_tongue" name="mother_tongue" class="form-control" type="text"
                                    value="${profile.mother_tongue} ">
                            </div>

                            <button type="submit" class="btn btn-primary">Update</button>
                        </fieldset>
                        <button class="my-3 btn btn-danger toggle_edit">Enable Edit</button>

                    </form>

                </div>

                <div class="col card p-4 m-1">

                    <h3> Current Address </h3>


                    <form action="/personalprofile/updateaddress" method="post" name="address">

                        <fieldset disabled>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />

                            <input hidden type="text" value="${profile.current_address_fk}" readonly id="id" name="id">

                            <div class="form-group">
                                <label for="house_no"> house_no </label>
                                <input id="house_no" name="house_no" class="form-control" type="text"
                                    value="${profile.current_address.house_no}">
                            </div>
                            <div class="form-group">
                                <label for="locality"> locality </label>
                                <input id="locality" name="locality" class="form-control" type="text"
                                    value="${profile.current_address.locality}">
                            </div>
                            <div class="form-group">
                                <label for="pincode"> Pincode </label>
                                <input id="pincode" name="pincode" class="form-control" type="number"
                                    value="${profile.current_address.pincode}">
                            </div>
                            <div class="form-group">
                                <label for="state"> state </label>
                                <input id="state" name="state" class="form-control" type="text"
                                    value="${profile.current_address.state}">
                            </div>
                            <div class="form-group">
                                <label for="city"> city </label>
                                <input id="city" name="city" class="form-control" type="text"
                                    value="${profile.current_address.city}">
                            </div>
                            <div class="form-group">
                                <label for="country"> country </label>
                                <input id="country" name="country" class="form-control" type="text"
                                    value="${profile.current_address.country}">
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </fieldset>
                        <button class="my-3 btn btn-danger toggle_edit">Enable Edit</button>
                    </form>


                </div>
                <div class="col card p-4 m-1">
                    <h3> Permanent Address </h3>
                    <form action="/personalprofile/updateaddress" method="post" name="address">
                        <fieldset disabled>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />

                            <input hidden type="text" value="${profile.permanent_address_fk}" readonly id="id"
                                name="id">

                            <div class="form-group">
                                <label for="house_no"> house_no </label>
                                <input id="house_no" name="house_no" class="form-control" type="text"
                                    value="${profile.permanent_address.house_no}">
                            </div>
                            <div class="form-group">
                                <label for="locality"> locality </label>
                                <input id="locality" name="locality" class="form-control" type="text"
                                    value="${profile.permanent_address.locality}">
                            </div>
                            <div class="form-group">
                                <label for="pincode"> Pincode </label>
                                <input id="pincode" name="pincode" class="form-control" type="number"
                                    value="${profile.permanent_address.pincode}">
                            </div>
                            <div class="form-group">
                                <label for="state"> state </label>
                                <input id="state" name="state" class="form-control" type="text"
                                    value="${profile.permanent_address.state}">
                            </div>
                            <div class="form-group">
                                <label for="city"> city </label>
                                <input id="city" name="city" class="form-control" type="text"
                                    value="${profile.permanent_address.city}">
                            </div>
                            <div class="form-group">
                                <label for="country"> country </label>
                                <input id="country" name="country" class="form-control" type="text"
                                    value="${profile.permanent_address.country}">
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </fieldset>
                        <button class="my-3 btn btn-danger toggle_edit">Enable Edit</button>

                    </form>

                </div>


            </div>

        </div>

    </div>

    <div class="container my-5">
        <h1> Results </h1>

        <form method="post" action="/personalprofile/addNewResult">
            <input name="id" type="hidden" value="${profile.id}" readonly>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />

            <button type="submit" class="btn btn-primary">
                Add Results
            </button>

        </form>

        <div class="container my-3">

            <div class="row justify-content-around">


                <c:forEach items="${results}" var="r">

                    <div class="col-4 card p-2 m-0">



                        <form action="/personalprofile/updateResult" method="post">
                            <fieldset disabled>

                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />
                                <input type="hidden" name="id" value="${r.id}" readonly />

                                <div class="row">

                                    <div class="col">

                                        <div class="form-group">
                                            <label for="result_type">Result Type</label>
                                            <select class="form-control" name="result_type" id="result_type">

                                                <option value="${r.result_type}" selected>${r.result_type_details.name}
                                                </option>
                                                <c:forEach items="${allCriterias}" var="criteria">
                                                    <c:if test="${criteria.id != r.result_type}">
                                                        <option value="${criteria.id}">${criteria.name}</option>
                                                    </c:if>
                                                </c:forEach>

                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="univ_id">University/College/School</label>
                                            <select class="form-control" name="univ_id" id="univ_id">

                                                <option value="${r.univ_id}" selected>${r.university.name}</option>
                                                <c:forEach items="${universities}" var="u">
                                                    <c:if test="${u.id != r.univ_id}">
                                                        <option value="${u.id}">${u.name}</option>
                                                    </c:if>
                                                </c:forEach>

                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="year"> year </label>
                                            <input id="year" name="year" class="form-control" type="text"
                                                value="${r.year}">
                                        </div>


                                        <div class="form-group">
                                            <label for="specialisation"> specialisation </label>
                                            <input id="specialisation" name="specialisation" class="form-control"
                                                type="text" value="${r.specialisation}">
                                        </div>

                                    </div>

                                    <div class="col">

                                        <div class="form-group">
                                            <label for="cgpa"> cgpa </label>
                                            <input id="cgpa" name="cgpa" class="form-control" type="text"
                                                value="${r.cgpa}">
                                        </div>


                                        <div class="form-group">
                                            <label for="marks"> marks </label>
                                            <input id="marks" name="marks" class="form-control" type="text"
                                                value="${r.marks}">
                                        </div>

                                        <div class="form-group">
                                            <label for="percentage"> percentage </label>
                                            <input id="percentage" name="percentage" class="form-control" type="text"
                                                value="${r.percentage}">
                                        </div>

                                        <div class="form-group">
                                            <label for="backlogs"> backlogs </label>
                                            <input id="backlogs" name="backlogs" class="form-control" type="text"
                                                value="${r.backlogs}">
                                        </div>

                                    </div>

                                </div>

                                <button type="submit" class="btn btn-primary"> Update</button>

                            </fieldset>
                            <button class="my-3 btn btn-danger toggle_edit">Enable Edit</button>

                        </form>

                        <div class="container ">



                            <form class="form-inline" action="/personalprofile/deleteResult" method="post">
                                <input type="hidden" name="id" type="hidden" value="${r.id}" readonly />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" readonly />

                                <button class="btn btn-danger" type="submit">
                                    <i class="fa fa-times "> Delete Result</i>
                                </button>
                            </form>

                        </div>






                    </div>

                </c:forEach>

            </div>

        </div>





    </div>


    <c:if test="${not empty response}">
        <script>
            swal("${ response }");
        </script>

    </c:if>

</body>

</html>