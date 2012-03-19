<%-- 
    Document   : error
    Created on : 26 ม.ค. 2555, 14:47:23
    Author     : Achilles
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/print.css" media="print" />
        <!-- thumbnailScroller script -->
    </head>
    <body class=" customer-account-create">
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
                    <br><br>

                    <div class="wrapper">

                        <div class="page">


                        </div>        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>Eror Code</h1>
                                        </div>
                                        <div class="col-1 registered-users">
                                            <h2 class="content">Eror Code</h2></div>
                                        <div class="discount">
                                            <h2 class="legend">${requestScope.error.errorCode}</h2>
                                        </div>

                                        <tr style="vertical-align:text-top">
                                            <td ><h2>Error Message</h2></td>
                                            <td><font size="4.5">${requestScope.error.header}</font></td>
                                        </tr>
                                        <tr><td>&nbsp;<td><td>&nbsp;<td></tr>
                                        <c:if test="${requestScope.error.itemCode != null}" >
                                            <c:forEach var="item" items="${requestScope.error.itemCode}" varStatus="counter">
                                                <c:if test="${requestScope.error.itemCode[counter.count-1]!=null}">
                                                    <tr style="vertical-align:text-top">
                                                        <td><font size="4">Code</font></td>
                                                        <td><font size="4">${requestScope.error.itemCode[counter.count-1]}</font></td>
                                                    </tr>
                                                    <tr style="vertical-align:text-top">
                                                        <td><font size="4">Name</font></td>
                                                        <td><font size="4">${requestScope.error.itemName[counter.count-1]}</font></td>
                                                    </tr>
                                                    <tr style="vertical-align:text-top">
                                                        <td><font size="4">Detail</font></td>
                                                        <td><font size="4">${requestScope.error.itemDetail[counter.count-1]}</font></td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            <tr><td>&nbsp;<td><td>&nbsp;<td></tr>

                                        </c:if>
                                        <c:if test="${requestScope.error.remark != null}" >
                                            <tr style="vertical-align:text-top">
                                                <td><font size="4">Remark</font></td>
                                                <td><font size="4">${requestScope.error.remark}</font></td>
                                            </tr>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <jsp:include page="footer.jsp" />
                    <br/><br/>
                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>
    </body>
</html>
