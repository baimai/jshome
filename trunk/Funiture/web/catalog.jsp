<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : catalog
    Created on : Mar 9, 2012, 3:19:41 PM
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<sql:query var="query1" dataSource="webdb">
    SELECT * FROM catalog_master where company_id = 1
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <style type="text/css">
            <!--
            body {
                margin-left: 0px;
                /*margin-top: 40px;*/
                margin-right: 0px;
                margin-bottom: 0px;
            }
            -->
        </style>



        <!-- thumbnailScroller script -->
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
                    <jsp:include page="slide.jsp"/>
                    <br/><br/><br/><br/><br/>
                    <center>
                    <table  cellspacing="0" cellpadding="0" >
                        <c:forEach var="catalog" items="${query1.rows}">
                        <tr>
                            
                           <td valign="top" ><br>
                               <div style="text-align:center;"><a href="${catalog.catalog_pic_loc}"><img src="images/icon/filetype_pdf.png" width="72" height="72" alt="filetype_pdf"/></a></div>
                                <div style="text-align:center;"><a href="${catalog.catalog_pic_loc}">${catalog.catalog_name}</a></div>
                            </td>
                            
                        </tr>
                        </c:forEach>
                    </table>
                    </center>
                    <br/><br/>
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
