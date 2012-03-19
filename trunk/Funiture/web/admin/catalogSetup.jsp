<%@ include file="checkRole.jsp" %>
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
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <script type="text/javascript">
            function setCheck(){
                if(document.getElementById('c1').checked == true){
                    document.getElementById('picCode').disabled = true;
                }else{
                    document.getElementById('picCode').disabled = false;
                }
                if(document.getElementById('c2').checked == true){
                    document.getElementById('productGroup').disabled = true
                }else{
                    document.getElementById('productGroup').disabled = false;
                }
            }
            function clearText(field){

                if (field.defaultValue == field.value) field.value = '';
                else if (field.value == '') field.value = field.defaultValue;

            }
            function setName(){
                if(document.getElementById('c1').checked == true){
                    var e = document.getElementById('productGroup');
                    document.getElementById('groupName').value =e.options[e.selectedIndex].text;
                }else{
                    var e = document.getElementById('picCode');
                    document.getElementById('groupName').value =e.options[e.selectedIndex].text;
                }                
                
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
                    <br/><br/>
                    <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>สร้างแค๊ดตาล็อก</h1>
                                        </div>

                                        <form action="testPdf.do">
                                            <div class="buttons" align="right">
                                                <button name="action" value="Add" class="button"><span><span>บันทึก</span></span></button>

                                            </div>
                                            <div class="fieldset">
                                                <h2 class="legend"></h2>
                                                <ul class="form-list">
                                                    <li class="fields">
                                                        <div class="customer-name">
                                                            <input id="c1" name="type" type="radio"   onclick="setCheck()" checked> แสดงตามกลุ่มสินค้า :
                                                            <select id="productGroup" name="productGroup" onchange="setName()" class="selected">
                                                                <option value="all">ทั้งหมด</option>
                                                                <c:forEach var="group" items="${query1.rows}">
                                                                    <option value="${group.product_group_id}">${group.product_g_name_t}</option>
                                                                </c:forEach>
                                                            </select></div>
                                                        <div class="customer-name">
                                                            <input id="c2" name="type" type="radio"  onclick="setCheck()"> แสดงตามรายการ   :
                                                            <select id="picCode" name="picCode" disabled onchange="setName()" class="selected">
                                                                <option value="all">ทั้งหมด</option>
                                                                <c:forEach var="menu" items="${query2.rows}">
                                                                    <option value="${menu.pic_code}">${menu.menu_c_name_t}</option>
                                                                </c:forEach>
                                                            </select></div>

                                                        <div class="customer-name" >

                                                            ชื่อ File :

                                                            <input id="fileName" type="text" value="Example" class="input-text" name="fileName" onFocus="clearText(this)" onBlur="clearText(this)">

                                                        </div>

                                                        <div class="customer-name">

                                                            ชื่อ Link :

                                                            <input id="linkName" type="text" value="Link-Name" class="input-text" name="linkName" onFocus="clearText(this)" onBlur="clearText(this)">

                                                        </div>

                                                    </li>
                                                </ul>

                                            </div>

                                            <input type="hidden" id="groupName" name="groupName" value="ทั้งหมด" />
                                            <br/>
                                            <br/>
                                            <br/><br/><br/>
                                        </form>


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
    </body>
</html>