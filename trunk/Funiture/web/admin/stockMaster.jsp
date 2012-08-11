<%--
    Document   : jshome_StockMaster
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query3" dataSource="webdb">
    SELECT * FROM product_group_master
</sql:query>

<sql:query var="query" dataSource="webdb">
    SELECT * FROM product_detail_master pdm 
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.multiselect.css" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.layout.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/i18n/grid.locale-en.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/ui.multiselect.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.tablednd.js" type="text/javascript"></script>
        <script src="jqgrid4.2/js/jquery.contextmenu.js" type="text/javascript"></script>
        <script  type="text/javascript">
            function show(){
                if(document.getElementById('groupId').value==''){
                    jQuery("#toolbar").jqGrid('setGridParam',{url:"xmlStockMaster.do?action=fetchData&q=2&Edit=1&Del=1"});
                    jQuery("#toolbar").trigger('reloadGrid');
                }else{
                    jQuery("#toolbar").jqGrid('setGridParam',{url:"xmlStockMaster.do?action=fetchData&q=2&Edit=1&Del=1&productGroupId="+document.getElementById('groupId').value});
                }
                jQuery("#toolbar").trigger('reloadGrid');

            }
            jQuery(document).ready(function(){
                jQuery("#toolbar").jqGrid({
                    url:'xmlStockMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['รหัสสินค้า', 'ชื่อสินค้า ', 'ประเภทสินค้า','วันที่นำสินค้าเข้า','จำนวน ','หน่วย','stockId' ],
                    colModel:[
                       
                        {name:'productCode',index:'productCode', width:100,editable:true,editoptions:{size:10}},
                        {name:'productNameT',index:'productNameT', width:100,editable:true,editoptions:{size:25}},
                        {name:'productGroupNameT',index:'productGroupNameT', width:100,editable:true,editoptions:{size:25}},
                        {name:'receiveDate',index:'receiveDate', width:100,editable:true,editoptions:{size:10},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'quantity',index:'quantity', width:50,editable:true,editoptions:{size:25}},
                        {name:'unit',index:'unit', width:50,editable:true,editoptions:{size:5}},
                        {name:'stockId',index:'stockId',  align:"right",hidden:true,editrules:{ edithidden:true},editable:true}
                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    loadonce:true,
                    pager: '#ptoolbar',
                    height: "auto",
                    width: 950,
                    sortname: 'id',
                    rownumbers: true,
                    rownumWidth: 40,
                    gridview: true,
                    viewrecords: true,
                    sortorder: "asc",
                    caption: "รับสินค้าเข้าคลัง",
                    editurl:"stockMaster.do"
                });

                jQuery("#toolbar").jqGrid('navGrid','#ptoolbar',
                {add:false,edit:false,search:false,view:true },
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        stockId:function() {
                            var sel_id = jQuery("#toolbar").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#toolbar").jqGrid('getCell', sel_id, 'stockId');
                            return value;
                        }}}, 
                {} 
            );

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
                                            <input type="hidden" name="productGroupId" value="${param.productGroupId}" />
                                            
                                            <button name="action" value="Add" class="button" onclick="window.location.href='Stock.jsp'"><span><span>เพิ่ม</span></span></button>

                                        </div>

                                        <center>
                                            <div class="field"> ประเภทสินค้า
                                                <select id="groupId" onchange="show()">
                                                    <option value=""> ทั้งหมด </option>
                                                    <c:forEach items="${query3.rows}" var="group">
                                                        <option value="${group.product_group_Id}" >${group.product_g_name_t}</option>
                                                    </c:forEach>
                                                        </select>
                                                <br/><br/></div>
                                            <table id="toolbar"></table>
                                            <div id="ptoolbar"></div>
                                            <br /> <br />
                                        </center>
                                        <br/>
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
