<%@page import="java.util.List"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ContactDao"%>
<%@page import="com.entities.Contact"%>
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

        <!--contact-table-->
        <div class="container mt-4" style="margin-top : 3%">
            <%
                ContactDao dao = new ContactDao(ConnectionProvider.getConnection());
                String contactName = request.getParameter("contactName");

                List<Contact> contacts = dao.getContactByCName(contactName, user.getId());

                if (contacts.size() == 0) {
                    out.println("<h3 class='display-3 text-center'>No contacts exist with <span style='color : red'>" + contactName + "</span> name...</h3>");
                    return;
                }
                int i = 1;
            %>

            <table class="table table-striped">
                <thead class="thead table-dark">
                    <tr>
                        <th scope="col">S NO.</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Email</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody >
                    <% for (Contact c : contacts) {%>
                    <tr>
                        <th scope="row"><%= i%></th>
                        <td> <%= c.getcName()%> </td>
                        <td> <%= c.getcPhone()%> </td>
                        <td> <%= c.getcEmail()%> </td>
                        <td>
                            <a href="updatePage.jsp?phone=<%= c.getcPhone()%>&userId=<%= c.getUserId()%>&email=<%= c.getcEmail()%>&name=<%= c.getcName()%>"  class="btn btn-success fa fa-edit" id="update-btn"></a>
                            <button type="submit" onclick ="deleteContact(<%= c.getcPhone()%>,<%= c.getUserId()%>)" class="btn btn-danger fa fa-trash"></button>
                        </td>
                    </tr>

                    <% i++;
                        }%>
                </tbody>
            </table>
        </div>
        <!--contact-table-end-->

        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script>
                                function deleteContact(phone, userId) {

                                    $.ajax({
                                        url: "DeleteContactServlet",
                                        data: {userId: userId, phone: phone},
                                        success: function (data, textStatus, jqXHR) {
                                            window.location = "profile.jsp";
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            window.location = "profile.jsp";
                                        }
                                    });
                                }
        </script>

        <!--main content ends-->

    </body>
</html>
