<%-- 
    Document   : profile
    Created on : 09-Mar-2023, 2:55:34 PM
    Author     : hp
--%>

<%@page import="com.entities.Message"%>
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
        <!--navbar-->
        <%@include file="admin_navbar.jsp" %>

        <!--navbar-end-->

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

        <p style = " visibility: hidden " id="currentUserId"><%= user.getId()%></p>


        <!--main content-->


        <div class="container-fluid"  id="contact-container">

        </div>
        <!--main content ends-->

        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <!--load all contact ajax-->
        <script>

            function getContacts(userId) {

                $.ajax({
                    url: "load_contact.jsp",
                    data: {userId: userId},
                    success: function (data, textStatus, jqXHR) {
                        $("#contact-container").html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }
                });
            }
            $(document).ready(function (e) {
//                initially we needed to allpost to be active it is at first
                let userId = $("#currentUserId").html();
                getContacts(userId);
            });
        </script>
    </body>
</html>
