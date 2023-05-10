
<%@page import="java.util.List"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ContactDao"%>
<%@page import="com.entities.Contact"%>
<!--contact-table-->
<div class="container mt-4" style="margin-top : 3%">
    <%
        ContactDao dao = new ContactDao(ConnectionProvider.getConnection());
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        List<Contact> contacts = dao.getContactByUserId(userId);
        

        if (contacts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No contacts saved...</h3>");
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
<script>
    function deleteContact(phone,userId) {
        
        $.ajax({
            url: "DeleteContactServlet",
            data: {userId: userId,phone : phone},
            success: function (data, textStatus, jqXHR) {
                window.location = "profile.jsp";
            },
            error: function (jqXHR, textStatus, errorThrown) {
                
            }
        });
    }
</script>
