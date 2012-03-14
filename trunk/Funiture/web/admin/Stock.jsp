<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<c:url var="url" value="/" />
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
        <script type="text/javascript">
            $(function() {
                $("#datepicker").datepicker();
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
                                            <h1>ข้อมูลประเภทสินค้า</h1></div>
                                        <div class="buttons" align="right">
                                            <form action="Stock.jsp" >
                                                <button name="action" value="Add" class="button"><span><span>บันทึก</span></span></button>
                                            </form>

                                            <form action="stockMaster.jsp" >
                                                <input type="hidden" name="stockId" value="${param.stockId}" />
                                                <button name="action" value="Seart" class="button"><span><span>ค้นหา</span></span></button>
                                            </form>


                                        </div>
                                        <form action="stockMaster.do" method="post" enctype="multipart/form-data" >
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
                                            <c:if test="${param.productDetailId==null}" >
                                                <input type="hidden" name="action" value="Add" />
                                                <div class="fieldset">
                                                    <h2 class="legend">ตั้งค่า</h2>
                                                    <ul class="form-list">
                                                        <li >
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" >วันที่นำเข้า</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="datepicker" name="startDate" value="" title="startDate"class="startDate"   />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li >
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" >รหัสสินค้า</label>
                                                                    <div  class="input-box">
                                                                        <input type="text" value="" id="productCode" name="productCode" />&nbsp;<a  onclick="$( '#dialog-form' ).dialog( 'open' );">ค้นหา</a>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li >
                                                            <div class="field name-lastname">
                                                                <label for="lastname" >จำนวน</label>
                                                                <div class="input-box">
                                                                    <input type="text" id="quantity" name="quantity" value="" title="Last Name" class="quantity" />
                                                                </div>
                                                            </div>


                                                        </li>
                                                        <li >
                                                            <div class="field name-lastname">
                                                                <label for="lastname" >หน่วย</label>
                                                                <select name="unitId" class="select">
                                                                    <c:forEach  items="${query4.rows}" var="unit">
                                                                        <option value="${unit.unit_id}">${unit.unit_name_t}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>


                                                        </li>
                                                    </ul>
                                                    <br/>
                                                </div>

                                            </c:if>
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
