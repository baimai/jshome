<%--
    Document   : jshome_forgetPassword
    Created on : 8 ส.ค. 2555, 10:36
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>

        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />

        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
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
                    <br><br><br><br><br><br><br>
                    <jsp:include page="slide.jsp"/>
                    <center>
                    <form action="" >
                        <table width="600px">
                            <tr width="20%">
                                <td style="text-align: right">
                                    <h2>ชื่อที่ใช้เข้าสู่ระบบ &nbsp; </h2>
                                </td>
                                <td style="text-align: left" width="50%">
                                    <input type="text" value="" name="memberLogin" />
                                </td>
                                <td>
                                    <button name="action" value="sendEmail" class="button" ><span><span>ส่งไปยัง อีเมลล์</span></span></button>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                     <h2>อีเมลล์ &nbsp; </h2>
                                </td>
                                <td>
                                    <input type="text" value="" name="memberEmail1" size="40"/>         
                                </td>
                            </tr>
                        </table>
                    </form>
                    </center>
                    <br/><br/><br/><br/>
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
