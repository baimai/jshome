<%@ include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%--
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<sql:query var="query2" dataSource="webdb">
    SELECT * FROM product_group_master pgm
</sql:query>
<sql:query var="query3" dataSource="webdb">
    SELECT * from product_group_master
</sql:query>
<c:if test="${param.picId != null}">
    <sql:query var="query4" dataSource="webdb">
        SELECT * from pic_product_setup pps       
        where pps.pic_id = ${param.picId}
    </sql:query>
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <link rel="stylesheet" type="text/css" media="screen" href="../jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <script src="../jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script src="../jqgrid4.2/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../ajax/myAjaxFramework.js" ></script>     


        
    </head
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
                    <jsp:include page="header.jsp"/>                    <br><br>
                    
                    <c:if test="${param.picId == null}" >
                        <form action="productSetup.do" >
                            <div class="wrapper">
                                <div class="page">
                                </div>
                                <div class="main-container col1-layout">
                                    <div class="main">
                                        <div class="col-main">
                                            <div class="account-create">
                                                <div class="page-title">
                                                    <h1>จัดการรูปแสดงสินค้า</h1>
                                                </div>
                                                  <div class="buttons" align="right">
                                                <button name="action" value="Add" class="button"><span><span>บันทึก</span></span></button>

                                            </div>
                                                <div id="users-contain" class="ui-widget">
                                                    <table id="box-table-a">
                                                        
                                                        <tr>
                                                            <td style="text-align: right">Pic Code</td>
                                                            <td><input type="text" value="" id="picCode" name="picCode"  /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Pic Name Th</td>
                                                            <td><input type="text" value="" id="picNameT" name="picNameT" size="40"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Pic Name En</td>
                                                            <td><input type="text" value="" id="picNameE" name="picNameE" size="40" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Product Remark Th</td>
                                                            <td><input type="text" value="" id="productRemarkT" name="productRemarkT" size="40" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Product Remark En</td>
                                                            <td><input type="text" value="" id="productRemarkE" name="productRemarkE" size="40"/></td>
                                                        </tr>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:if>

                    <c:if test="${param.picId != null}" >
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>จัดการรูปแสดงสินค้า</h1>
                                        </div>
                                        <c:forEach var="product" items="${query4.rows}">

                                              
                                            <form action="productSetup.do" >
                                                 <div class="buttons" align="right">
                                                <button name="action" value="Edit" class="button"><span><span>แก้ไข</span></span></button>

                                            </div>
                                                <div id="users-contain" class="ui-widget">
                                                    <table id="box-table-a">
                                                        
                                                        <tr>
                                                            <td style="text-align: right">Pic Code</td>
                                                            <td><input type="text" value="${product.pic_code}" id="picCode" name="picCode" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Pic Name Th</td>
                                                            <td><input type="text" value="${product.pic_name_t}" id="picNameT" name="picNameT" size="40"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Pic Name En</td>
                                                            <td><input type="text" value="${product.pic_name_e}" id="picNameE" name="picNameE" size="40" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Product Remark Th</td>
                                                            <td><input type="text" value="${product.product_remark_t}" id="productRemarkT" name="productRemarkT" size="40" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">Product Remark En</td>
                                                            <td><input type="text" value="${product.product_remark_e}" id="productRemarkE" name="productRemarkE" size="40"/></td>
                                                        </tr>
                                                    </table>
                                                    <input type="hidden" value="${product.pic_id}" name="picId" />

                                                </div>


                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>
    </body>
</html>
