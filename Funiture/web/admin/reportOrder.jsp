<%-- 
    Document   : reportOrder
    Created on : Mar 25, 2012, 4:47:33 PM
    Author     : baimai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <link type="text/css" href="../jshome/development-bundle/themes/base/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="../jshome/js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="../jshome/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../jshome/ui/jquery.ui.datepicker.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="../jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <script src="../jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script src="../jqgrid4.2/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../ajax/myAjaxFramework.js" ></script>
        <script type="text/javascript">
            $(function() {
                $("#datepicker").datepicker();
                // $.datepicker.formatDate('yyyy-mm-dd');

            });

        </script>
    </head>
    <body>
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
                    <br><br>
                    <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>รายงานสั่งซื้อ</h1></div>
                                        <table border="1">

                                            <tbody>
                                                <tr>
                                                    <td>จากวันที่</td>
                                                    <td> <input type="text" id="datepicker" name="receiveDate" value="" title="receiveDate"class="startDate"   /></td>
                                                     <td>ถึงวันที่</td>
                                                    <td> <input type="text" id="datepicker" name="receiveDate" value="" title="receiveDate"class="startDate"   /></td>
                                                </tr>
                                                <tr><td>ประเภทลูกค้า</td>
                                            <td><select name="ทั้งหมด">
                                                <option></option>
                                                <option></option>
                                            </select><td>
                                                   
                                                </tr>
                                                <tr>
                                                    <td>ประเภทสินค้า</td>
                                                    <td><select name="ทั้งหมด">
                                                            <option></option>
                                                            <option></option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"></td>

                                                    <td>รายงานสรุปยอดซื้อ</td>
                                                    <td>รายงานสั่งซื้อสินค้า</td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>



                            </div> </div>
                    </div>



                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>
    </body>
</html>
