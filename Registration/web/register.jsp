<%@page import="com.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <main class="d-flex align-items-center" style="height : 90vh" >

            <div class="container">
                <div class="row">

                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center primary-background">
                                Register
                            </div>
                            
                            <%
                                Message m = (Message) session.getAttribute("msg");

                                if (m != null) {
                            %>

                            <div class="alert <%= m.getCssClass()%> text-center" role="alert">
                                <%= m.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>
                            
                            <div class="card-body">
                                <form action="RegisterServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Name</label>
                                        <input  required type="text" class="form-control" name="user-name" aria-describedby="emailHelp" placeholder="Enter name">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input  required type="email" class="form-control" name="user-email" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input  required type="password" class="form-control" name="user-password" placeholder="Password">
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" name="check" required>
                                        <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
                                    </div>
                                    <div class="container text-center mt-3">
                                        <button type="submit" class="btn btn-outline primary-background ">Submit</button>
                                    </div>
                                </form>
                            </div>

                            <div class="card-footer text-center">
                                Already Registered?<a href="login.jsp">Login Here..</a>
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
