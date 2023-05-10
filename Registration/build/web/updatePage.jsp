<%@page import="com.entities.User"%>
<%@page errorPage = "error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ContactApp</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <%@include file="admin_navbar.jsp" %>
        <%
            int userId = Integer.parseInt(request.getParameter("userId"));
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
        %>

        <main class="d-flex align-items-center" style="height : 90vh" >
            <div class="container" id="update-contact-form" >
                <div class="row">

                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header text-center primary-background ">
                                <h5 class="fa-2x"><span class=" fa fa-edit mr-2"></span>Update Details</h5>
                            </div>
                            <div class="card-body">
                                <form action="UpdateServlet" method="POST">
                                    <input type="hidden" name="contact-userId" value="<%= userId %>" >
                                    <input type="hidden" name="contact-userOldPhone" value="<%= phone %>" >

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Name</label>
                                        <input required name="contact-name" type="text" placeholder="Enter name" class="form-control" value="<%= name %>">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Phone</label>
                                        <input required name="contact-phone" type="number" placeholder="Enter phone number" class="form-control" value="<%= phone %>">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="contact-email" type="email" placeholder="Enter email" class="form-control" value="<%= email %>" >
                                    </div>


                                    <div class="container text-center">
                                        <button href="profile.jsp" class="btn btn-outline-light primary-background">Back</button>
                                        <button type="submit" class="btn btn-outline-light primary-background">Update</button>
                                        
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
