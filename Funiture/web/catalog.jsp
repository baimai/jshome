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

        <title>jshome</title>
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />

        <script type="text/javascript">
            function checkMember(catalog){
                if(${sessionScope.loginDetail == null} ){
                    alert('กรุณาสมัครสมาชิก');
                }else{
                    window.location.href=catalog;
                }
            }

        </script>
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
                    <div class="main-container col2-right-layout">
                        <div class="main">
                            <div class="col-main">
                                <div id="messages_product_view"></div>
                                <div class="page-title">
                                    <h1>แค็ตตาล็อก</h1>
                                </div>                             

                                <fieldset>
                                    

                                    <table style="margin-left: 100px" wifth="100%">
                                           
                                            <tbody>

                                                <c:forEach var="catalog" items="${query1.rows}">
                                                    <tr >

                                                        <td class="a-right" >
                                                            <a href="${catalog.catalog_pic_loc}">
                                                                <img src="images/pdf.png"  alt="filetype_pdf" /></a></td>

                                                        <td class="a-left" >                                                       
                                                                        <a href="#" onclick="checkMember('${catalog.catalog_pic_loc}');">${catalog.catalog_name}</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    


                                </fieldset>

                            </div>  <jsp:include page="myCart.jsp" /> </div>  </div>
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
