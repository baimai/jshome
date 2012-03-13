<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%--
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>
<sql:query var="query" dataSource="webdb">
    SELECT * FROM pic_product_setup pps
    join menu_detail_master mdm on mdm.pic_code = pps.pic_code
    group by pps.pic_code
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT * FROM product_group_master pgm
</sql:query>
<sql:query var="query3" dataSource="webdb">
    SELECT * from product_group_master
</sql:query>
<input type="hidden" value="1" id="productGroupId" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <script src="../jqgrid4.2/js/jquery.js" type="text/javascript"></script>        
        <script src="../jqgrid4.2/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../ajax/myAjaxFramework.js" ></script>
        <script type="text/javascript">
            function setSearch(productCode,productName,productGroupId,page){
                var param = "productCode="+productCode+"&productName="+productName+"&productGroupId="+productGroupId+"&page="+page;
                postDataReturnText("Product.jsp",param,showSearch);
            }
            function showSearch(text){
                document.getElementById("showSearch").innerHTML=text;
            }
        </script>
        <script type="text/javascript">
            $(function() {
                $( "#dialog-form" ).dialog({
                    autoOpen: false,
                    height: 650,
                    width: 800,
                    modal: true
                });
            });
        </script>


        <style type="text/css">
            #box-table-a
            {
                font-size: 12px;
                margin: 45px;
                width: 400px;
                text-align: left;
                border-collapse: collapse;
            }
            #box-table-a th
            {
                font-size: 13px;
                font-weight: normal;
                padding: 8px;
                background: #b9c9fe;
                border-top: 4px solid #aabcfe;
                border-bottom: 1px solid #fff;
                color: #039;
            }
            #box-table-a td
            {
                padding: 8px;
                background: #e8edff;
                border-bottom: 1px solid #fff;
                color: #669;
                border-top: 1px solid transparent;
            }
            #box-table-a tr:hover td
            {
                background: #d0dafd;
                color: #339;
            }
        </style>
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
                    <jsp:include page="header.jsp"/>
                    <br><br>


                    <form action="productSetup.do" >

                        <div id="dialog-form" title="Search Product">
                            <table >
                                <tr>
                                    <td>Product Group</td>
                                    <td><select name="productGroupId2" id="productGroupId2">
                                            <option value=""></option>
                                            <c:forEach var="group" items="${query3.rows}">
                                                <option value="${group.product_group_id}">${group.product_g_name_t}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Product Code</td>
                                    <td><input type="text" name="productCode2" id="productCode2" value=""/></td>
                                </tr>
                                <tr>
                                    <td>Product Name</td>
                                    <td><input type="text" name="productName2" id="productName2" value=""/></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"> <input type="submit" value="ค้นหา" onclick="setSearch(document.getElementById('productCode2').value,document.getElementById('productName2').value,document.getElementById('productGroupId2').value,1)"/></td>
                                </tr>
                            </table>
                            <div id="showSearch">

                            </div>
                        </div>


                        <div id="users-contain" class="ui-widget">

                            <table     id="box-table-a">

                                <tr>
                                    <td style="text-align: right">Pic Code</td>
                                    <td>
                                        <select name="picCode" >
                                            <c:forEach var="pic" items="${query.rows}">
                                                <c:if test="${pic.pic_code == param.picCode}">
                                                    <option value="${pic.pic_code}" selected>${pic.menu_c_name_t}</option>
                                                </c:if>
                                                <c:if test="${pic.pic_code != param.picCode}">
                                                    <option value="${pic.pic_code}">${pic.menu_c_name_t}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">Product Code</td>
                                    <td><input type="text" value="" id="productCode" name="productCode" />&nbsp;<a  onclick="$( '#dialog-form' ).dialog( 'open' );">ค้นหา</a></td>
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
                        <button name="action" value="Add" >Save</button>
                    </form>
                </div>
            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>
    </body>
</html>
