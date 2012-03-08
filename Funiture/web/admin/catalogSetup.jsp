<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : catalogSetup
    Created on : Mar 8, 2012, 1:20:33 PM
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<sql:query var="query1" dataSource="webdb">
    SELECT * FROM product_group_master
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT * FROM menu_detail_master
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <script>
            function setCheck(){
                if(document.getElementById('c1').checked == true){
                    document.getElementById('c1').value = 1;
                }else{
                    document.getElementById('c1').value = 0;
                }
                if(document.getElementById('c2').checked == true){
                    document.getElementById('c2').value = 1;
                }else{
                    document.getElementById('c2').value = 0;
                }
            }
            function clearText(field){

                if (field.defaultValue == field.value) field.value = '';
                else if (field.value == '') field.value = field.defaultValue;

            }
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
                    <br/><br/><br/>
                    <center>
                        <form action="testPdf.do">
                            <table >
                                <tr>
                                    <td>
                                        <input id="c1" type="checkbox" value="0" onclick="setCheck()">แสดงตามกลุ่มสินค้า
                                    </td>
                                    <td>
                                        <select name="productGroup">
                                            <option value="all">ทั้งหมด</option>
                                            <c:forEach var="group" items="${query1.rows}">
                                                <option value="${group.product_group_id}">${group.product_g_name_t}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="c2" type="checkbox" value="0" onclick="setCheck()">แสดงตามรายการ
                                    </td>
                                    <td>
                                        <select name="picCode">
                                            <option value="all">ทั้งหมด</option>
                                            <c:forEach var="menu" items="${query2.rows}">
                                                <option value="${menu.pic_code}">${menu.menu_c_name_t}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ชื่อ File
                                    </td>
                                    <td>
                                        <input id="fileName" type="text" value="Example" name="fileName" onFocus="clearText(this)" onBlur="clearText(this)">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"><button name="action" value="Add" >Submit</button> </td>
                                </tr>
                            </table>
                            <br/>
                            <br/>
                            <br/><br/><br/>
                        </form>
                    </center>

                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>
    </body>
</html>
