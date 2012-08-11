<%--
    Document   : jshome_Topmenu
    Created on : 8 ส.ค. 2555, 13:56
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
    </head>

    <body>
    <tr>
        <td height="41"><div id="navigation">
                <div id="nav-lt-curve"><img src="black-images/black-lt-curve.png" alt="lt-curve" width="28" height="40" /></div>
                <div id="navigation-mid">
                    <ul>
                        <c:forEach var="topmenu" items="${query.rows}">
                            <li><a href="#">${topmenu.Menu_G_Name_T}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div id="ser-panel">
                    <div class="ser-inn-panel">
                        <input name="" type="button" class="btn-ser" />
                    </div>
                </div>
                <div id="nav-rt-curve"><img src="black-images/black-rt-curve.png" alt="rt-curve" width="14" height="40" /></div>
            </div>
        </td>
    </body>

</html>
