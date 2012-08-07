<%--
    Document   : jshome_index
    Created on : 7 ส.ค. 2555, 12:36
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>

        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body >
        <div id="art-main">
            <div class="art-sheet">
                <div class="art-sheet-bl"></div>
                <div class="art-sheet-br"></div>
                <div class="art-sheet-bc"></div>
                <div class="art-sheet-cl"></div>
                <div class="art-sheet-cr"></div>
                <div class="art-sheet-cc"></div>
                <div class="art-sheet-body">

                    <jsp:include page="head.jsp"/>
                    <jsp:include page="slide.jsp"/><br><br>
                    <jsp:include page="HotNewProProduct2.jsp" />
                    <jsp:include page="footer.jsp" /><br/><br/>

                </div>
            </div>
            <div class="cleared"></div>
        </div>
        <div class="cleared"></div>
        <p class="art-page-footer"></p>
    </body>

</html>
