<%-- 
    Document   : test
    Created on : Mar 8, 2022, 5:25:08 PM
    Author     : Hai Duong
--%>

<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
        %>
    </head>
    <body>
        <p>Tổng số phòng: <%=(rooms.size())%></p>
        <p>Phòng đang thuê: ${requestScope.roomInRent}</p>
        <p>Phòng trống: ${requestScope.roomEmpty}</p>
        <p>Tổng số người thuê phòng: ${requestScope.customerTotal}</p>
        <%if (rooms.size() > 0) {%>
        <table border="1">
            <tr>
                <td>rid</td>
                <td>rtype</td>
                <td>price</td>
                <td>number of members</td>
            </tr>
            <%for (Room r : rooms) {%>
            <tr>
                <td><%=(r.getRid())%></td>
                <td><%=(r.getRtype())%></td>
                <td><%=(r.getPrice())%></td>
                <td><%=(r.getCustomers().size())%></td>
            </tr>
            <%}%>
        </table>
        <%} else {%>
            Nothing to display
        <%}%>
    </body>
</html>
