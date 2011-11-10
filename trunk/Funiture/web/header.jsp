<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : head
    Created on : 8 พ.ย. 2554, 22:59:07
    Author     : Achilles
--%>
<sql:query var="head" dataSource="webdb">
    SELECT * from header_master
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:forEach var="query" items="${head.rows}">
    
            <tr >
                <td ><div align="center"><img src="${query.Header_Logo}" width="950" height="100" /></div></td>
            </tr>
            <tr>
                <td><div align="center"><img src="jshome/images/line.jpg" width="950" height="4" /></div></td>
            </tr>
    </c:forEach>   
    </body>
</html>
