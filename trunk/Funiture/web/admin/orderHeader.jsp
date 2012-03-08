<%-- 
    Document   : orderDetail
    Created on : Feb 8, 2012, 12:03:38 PM
    Author     : Achilles
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%--
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${param.orderStatus != null || param.orderStatus != ''}">
    <c:set var="orderStatus" value="&orderStatus=${param.orderStatus}" />
</c:if>
<c:if test="${param.orderStatus == null || param.orderStatus == ''}">
    <c:set var="orderStatus" value="" />
</c:if>
<sql:query var="query3" dataSource="webdb">
    SELECT distinct(ohm.order_status),(case when ohm.order_status = 'N' then 'InActive'
    when ohm.order_status = 'Y' then 'Active'
    when ohm.order_status = 'C' then 'Cancle'
    else 'InActive' end) as status FROM order_header_master ohm;
</sql:query>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>jqGrid Demos</title>
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" media="screen" href="../jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="../jqgrid4.2/themes/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="../jqgrid4.2/themes/ui.multiselect.css" />

        <script src="../jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script src="../jqgrid4.2/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
        <script src="../jqgrid4.2/js/jquery.layout.js" type="text/javascript"></script>
        <script src="../jqgrid4.2/js/i18n/grid.locale-en.js" type="text/javascript"></script>

        <script src="../jqgrid4.2/js/ui.multiselect.js" type="text/javascript"></script>
        <%--<script src="jqgrid4.2/js/jquery.jqGrid.src.js" type="text/javascript"></script> --%>
        <script src="../jqgrid4.2/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <script src="../jqgrid4.2/js/jquery.tablednd.js" type="text/javascript"></script>
        <script src="../jqgrid4.2/js/jquery.contextmenu.js" type="text/javascript"></script>
        <script type="text/javascript" src="../ajax/myAjaxFramework.js" ></script>
        <script  type="text/javascript">
             
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlOrderMaster.do?action=fetchData&q=1${orderStatus}',
                    datatype: "xml",
                    colNames:['Order Date','Order ID', 'Name', 'Status',''],
                    colModel:[
                        {name:'orderDate',index:'orderDate',editoptions:"", width:170,align:"center"},
                        {name:'orderId',index:'orderId', width:80,align:"right"},
                        {name:'name',index:'name', width:225, align:"center"},
                        {name:'orderStatus',index:'orderStatus', width:100, align:"center"},
                        {name:'Edit',index:'Edit', width:100,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"orderDetail.jsp?orderId="+cellvalue+"\" ><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}}
                        
                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                     height: "auto",
                     width: 950,
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Order Detail"
                    // editurl:"colorMaster.do"

                });
            });
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
                    <jsp:include page="header.jsp"/>
                    <br/><br/><div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>สั่งซื้อ</h1>
                                        </div>
                                        <center>
                                            <br/>
                                            <select onchange="window.location='orderHeader.jsp?orderStatus='+this.value;">
                                                <option value=""> ทั้งหมด </option>
                                                <c:forEach items="${query3.rows}" var="order">

                                                    <option value="${order.order_status}"
                                                            <c:if test="${param.orderStatus == order.order_status && param.orderStatus != null}">
                                                                selected
                                                            </c:if>
                                                            >${order.status}</option>

                                                </c:forEach>
                                            </select>
                                            <br/><br/>
                                            <table id="rowed1"></table>
                                            <br/>

                                            <div id="prowed1"></div>

                                        </center>
                                        <br/><br/> <br/>
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
