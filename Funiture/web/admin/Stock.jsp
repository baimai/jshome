<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<sql:query var="query" dataSource="webdb">
    select * from unit_master order by unit_name_t asc
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
                postDataReturnText("searchProductdetail.jsp",param,showSearch);
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
                margin: 25px;
                width: 800px;
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

            }
        </style>
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
                                            <h1>ข้อมูลประเภทสินค้า</h1></div>

                                        <form action="stockMaster.do" >
                                            <div class="buttons" align="right">
                                                <button name="action" value="add" class="button"><span><span>บันทึก</span></span></button>
                                               
                                            </div>
                                            <div id="dialog-form" title="Search Product">

                                                <script type="text/javascript">
                                                    setSearch('','','',1)

                                                </script>

                                                <div id="showSearch">
                                                    <script type="text/javascript">

                                                        $(function(onclick) {
                                                            $( '#dialog-form' ).dialog( 'close' );
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                            <c:if test="${param.productDetailId==null}" >
                                               
                                                <div class="fieldset">
                                                    <h2 class="legend">ตั้งค่า</h2>
                                                    <ul class="form-list">
                                                        <li >
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" >วันที่นำเข้า</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="datepicker" name="receiveDate" value="" title="receiveDate"class="startDate"   />
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
                                                                    <c:forEach  items="${query.rows}" var="unit">
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
