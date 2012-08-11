<%--
    Document   : jshome_ColorMaster
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
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
                    <jsp:include page="header.jsp"/>
                    <br><br> <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>ข้อมูลสีสินค้า</h1>
                                        </div>
                                        <form method="post" name="order" id="order" action="" title='' >

                                            <table style="width:350px;margin:0px;border: 1px;">

                                                <tr>
                                                    <td align="right"> รหัสสี:</td>
                                                    <td><input type="text" name="id" readonly=true id="invid"/></td>
                                                </tr>
                                                <tr>
                                                    <td> คำอธิบาย(ไทย):</td>
                                                    <td><input type="text" name="invdate"  /></td>
                                                </tr>
                                                <tr>
                                                    <td>คำอธิบาย(อังกฤษ)</td>
                                                    <td><input type="text" name="name"  /></td>
                                                </tr>
                                                <tr>
                                                    <td> Amount</td>
                                                    <td><input type="text" name="amount"  /></td>
                                                </tr>
                                                <tr>
                                                    <td> Tax</td>
                                                    <td><input type="text" name="tax"  /></td>
                                                </tr>
                                                <tr>
                                                    <td> Total</td>
                                                    <td><input type="text" name="total"  /></td>
                                                </tr>
                                                <tr>
                                                    <td> Note</td>
                                                    <td><input type="text" name="note"  /></td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td><input type="button" id="savedata" value="add" /></td>
                                                </tr>
                                            </table>
                                        </form>
                                        <br/><br/><br/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cleared"></div>
        </div>
        <div class="cleared"></div>
        <p class="art-page-footer"></p>
         <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>

</html>
