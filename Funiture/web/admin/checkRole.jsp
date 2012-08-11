<%--
    Document   : jshome_CheckRole
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
    <body>
        <c:if test="${sessionScope.userRole != 'admin'}">
           <% response.sendRedirect("../Login.jsp");%>
        </c:if>

    </body>

</html>
