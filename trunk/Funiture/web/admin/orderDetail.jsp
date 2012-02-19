<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : orderDetail
    Created on : Feb 8, 2012, 12:17:52 PM
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<sql:query var="query" dataSource="webdb">
    SELECT ohm.order_id,concat(mm.member_name,' ',mm.member_surname) as name,mm.Member_Com_Name,
    DATE_FORMAT(ohm.order_date, '%a %D %M %Y') as order_date,
    DATE_FORMAT(ohm.order_date, '%H:%i:%s') as order_time,
    ohm.order_status,sum(odm.product_amount) as amount,
    concat(mm.member_addr1,' ตำบล',cm1.name_,' อำเภอ',cm2.name_,' จังหวัด',cm3.name_,' ',mm.member_pstcode) as address,
    concat(mm.Member_Tel1,',',mm.Member_Tel2) as Tel,
    concat(mm.Member_Fax1,',',mm.Member_Fax2) as Fax,
    concat(mm.Member_Mobile1,',',mm.Member_Mobile2) as Mobile,
    concat(mm.Member_Email1,',',mm.Member_Email2,',',mm.Member_Email3) as Email
    FROM order_header_master ohm
    join order_detail_master odm on odm.order_id = ohm.order_id
    join product_detail_master  pdm on pdm.product_detail_id = odm.product_detail_id
    join member_master mm on mm.member_id = ohm.member_id
    join common_province cm1 on cm1.id_ = mm.member_distinct
    join common_province cm2 on cm2.id_ = mm.member_amphur
    join common_province cm3 on cm3.id_ = mm.member_province
    where ohm.order_id = ${param.orderId}
    group by ohm.order_id,ohm.order_date,ohm.order_status
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT * FROM order_header_master ohm where ohm.order_id = ${param.orderId}
</sql:query>
<html>
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
                url:'xmlOrderMaster.do?action=fetchData&rows=3&page=1&q=2&orderId=${param.orderId}',
                datatype: "xml",
                colNames:['Order ID','Product ID','Product Name', 'Volumn', 'Cost','Amount'],
                colModel:[
                    {name:'orderId',index:'orderId',editoptions:"", width:80,align:"center"},
                    {name:'productId',index:'productId', width:100,align:"right"},
                    {name:'productDNameE',index:'productDNameE', width:200,align:"center"},
                    {name:'volumn',index:'volumn', width:90, align:"center"},
                    {name:'cost',index:'cost', width:130, align:"center"},
                    {name:'Amount',index:'Amount', width:170,align:"center"}

                ],
                rowNum:10,
                rowList:[10,20,30,40,80,160,320,500,1000],
                pager: '#prowed1',
                height:200,
                sortname: 'id',
                viewrecords: true,
                sortorder: "desc",
                caption:"Order Detail"
                // editurl:"colorMaster.do"

            });
        });
    </script>
</head>
<body class=" customer-account-login">

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
        </div>        <div class="main-container col1-layout">
            <div class="main">
                <div class="col-main">
                    <div class="account-login">
                        <div class="page-title">
                                        <h1>ใบสั่งซื้อ</h1>
                                    </div>
                                    <c:forEach var="order" items="${query.rows}">
                               <div class="col2-set">
                                <div class="col-1 new-users">
                                    <div class="content">
                                                <h2>รหัสใบสั่งซื้อ : ${order.order_id} </h2>
                                                
                                                <h2>วันที่ : ${order.order_date} เวลา : ${order.order_time}</h2>
                                               
                                                <h2>สถานะ :
                                                    <form action="manageOrder.do">
                                                        <select name="orderStatus" style="color: blue;">
                                                            <c:if test="${order.order_status == 'Y'}">
                                                                <option value="Y" selected>Active</option>
                                                                <option value="N" >InActive</option>
                                                                <option value="C" >Cancle</option>
                                                            </c:if>
                                                            <c:if test="${order.order_status == 'N'}">
                                                                <option value="Y" >Active</option>
                                                                <option value="N" selected >InActive</option>
                                                                <option value="C" >Cancle</option>
                                                            </c:if>
                                                            <c:if test="${order.order_status == 'C'}">
                                                                <option value="Y" >Active</option>
                                                                <option value="N" >InActive</option>
                                                                <option value="C" selected>Cancle</option>
                                                            </c:if>
                                                        </select>
                                                        <input type="hidden" value="${param.orderId}" name="orderId" />
                                                        <input type="submit" value="Submit" name="action"/>
                                                    </form>
                                                </h2>
                                                </div>
                                               
                                              </div>
                                                       <div class="col-2 registered-users">
                                                     <div class="content">
                                                <h2> ชื่อลูกค้า : ${order.name}</h2>
                                                <h2>บริษัท  : ${order.Member_Com_Name}</h2>
                                                <h2>ที่อยู่ : ${order.address} </h2>
                                                <h2>เบอร์โทร : ${order.Tel} </h2>
                                                <h2>โทรสาร : ${order.Fax} </h2>
                                                <h2>มือถือ : ${order.Mobile} </h2>
                                                <h2>อีเมลล์ : ${order.Email} </h2>
                                                 </div>
                                                 </div>
                                            </div>
                                        </div>
                                       
                                        <table id="rowed1"></table>
                                        <div id="prowed1"></div>
                                        <br>
                                        <table align="right" width="100%" border="0">
                                            <tr>
                                                <td width="74%" style="font-weight: bold;text-align:right;">รวม</td>
                                                <td ><input style="color: blue;" disabled type="text" value="${order.amount}"/></td>
                                            </tr>
                                        </table>
                                    </c:forEach>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
 </div>
            
        
        <div class="cleared"></div>
   

    <div class="cleared"></div>
    <p class="art-page-footer"></p>


</body>
</html>
