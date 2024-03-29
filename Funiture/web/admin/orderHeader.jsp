<%--
    Document   : jshome_OrderHeader
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query3" dataSource="webdb">
    SELECT distinct(ohm.order_status),(case when ohm.order_status = 'N' then 'InActive'
    when ohm.order_status = 'Y' then 'Active'
    when ohm.order_status = 'C' then 'Cancle'
    else 'InActive' end) as status FROM order_header_master ohm;
</sql:query>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link type="text/css" href="development-bundle/themes/base/ui.all.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.multiselect.css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.layout.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/i18n/grid.locale-en.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/ui.multiselect.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.tablednd.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.contextmenu.js" type="text/javascript"></script>
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
        <script  type="text/javascript">
            function show(){
                if(document.getElementById('status').value==''&&document.getElementById('datepicker').value==''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlOrderMaster.do?action=fetchData&q=1"});
                }else if(document.getElementById('status').value!=''&&document.getElementById('datepicker').value==''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlOrderMaster.do?action=fetchData&q=1&orderStatus="+document.getElementById('status').value});
                }else if(document.getElementById('status').value==''&&document.getElementById('datepicker').value!=''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlOrderMaster.do?action=fetchData&q=1&orderDate="+splitDate(document.getElementById('datepicker').value)});
                }else if(document.getElementById('status').value!=''&&document.getElementById('datepicker').value!=''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlOrderMaster.do?action=fetchData&q=1&orderStatus="+document.getElementById('status').value+"&orderDate="+splitDate(document.getElementById('datepicker').value)});
                }
                jQuery("#rowed1").trigger('reloadGrid');
            }
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlOrderMaster.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['วันที่สั่งซื้อ','เลขที่ใบสั่งซื้อ', 'ชื่อ-นามสกุล','รหัสบริษัท', 'สถานะใบสั่งซื้อ','จำนวนเงิน','แก้ไข'],
                    colModel:[
                        {name:'orderDate',index:'orderDate',editoptions:"", width:140,align:"center"},
                        {name:'orderNo',index:'orderNo', width:80,align:"right"},
                        {name:'name',index:'name', width:225, align:"center"},
                        {name:'companyId',index:'companyId', width:80,align:"right"},
                        {name:'orderStatus',index:'orderStatus', width:100, align:"center"},
                        {name:'totalAmount',index:'totalAmount', width:100, align:"center"},
                        {name:'Edit',index:'Edit', width:100,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"orderDetail.jsp?orderId="+cellvalue+"\" ><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}}                        
                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    height: "auto",
                    width: 930,
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Order Detail"
                    // editurl:"colorMaster.do"

                });
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $("#datepicker").datepicker();
            });

            function splitDate(date){
                var t = date.split("/");  //ถ้าเจอวรรคแตกเก็บลง array t
                return t[2]+"-"+t[0]+"-"+t[1];
            }

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

                                        <table class="tableContent1" border="0" cellspacing="3" cellpadding="0" align="" width="60%">
                                            <tr >
                                                <td style="float: right">
                                                    สถานะ :&nbsp;
                                                </td>
                                                <td style="width: 120px">
                                                    <select id="status" onchange="show()">
                                                        <option value=""> ใหม่ (default) </option>
                                                        <option value=""> อนุมัติ </option>
                                                        <option value=""> ยกเลิก </option>
                                                        <c:forEach items="${query3.rows}" var="order">
                                                            <option value="${order.order_status}">${order.status}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr >
                                                <td style="float: right">
                                                    วันที่สั่งซื้อ :&nbsp;
                                                </td>
                                                <td style="width: 120px">
                                                    <input type="text" id="datepicker" name="startDate" value="" title="startDate"class="startDate"   onchange="show();"/>
                                                </td>
                                            </tr>
                                            <tr >
                                                <td style="float: right">
                                                    ใบสั่งซื้อ :&nbsp;
                                                </td>
                                                <td style="width: 120px">
                                                    <input type="text" id="datepicker" name="order_no" value="" title="order_no"class="order_no"   onchange="show();"/>
                                                </td>
                                            </tr>
                                            <br><br>
                                        </table>
                                        <br>
                                        <center>
                                            <img src="images/line.jpg" width="930" height="" alt=""/>
                                            <br><br>
                                        </center>
                                        <center><table id="rowed1"></table
                                            <br>
                                        </center>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br> 

                                        <div id="prowed1"></div>
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
