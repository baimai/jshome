<%--
    Document   : mastercollor
    Created on : Dec 27, 2011, 2:37:34 PM
    Author     : Baimai
--%>
<%@ include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>stock Master</title>
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
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
        <script  type="text/javascript">
            jQuery(document).ready(function(){
                jQuery("#toolbar").jqGrid({
                    url:'xmlStockMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['วันที่นำสินค้าเข้า','รหัสสินค้า', 'ชื่อสินค้า ', 'ประเภทสินค้า','จำนวน ','หน่วย','stockId' ],
                    colModel:[
                        {name:'receiveDate',index:'receiveDate', width:100,editable:true,editoptions:{size:10}},
                        {name:'productCode',index:'productCode', width:100,editable:true,editoptions:{size:10}},
                        {name:'productNameT',index:'productNameT', width:100,editable:true,editoptions:{size:25}},
                        {name:'productGroupNameT',index:'productGroupNameT', width:100,editable:true,editoptions:{size:25}},
                        {name:'quantity',index:'quantity', width:50,editable:true,editoptions:{size:25}},
                        {name:'unit',index:'unit', width:50,editable:true,editoptions:{size:5}},
                        {name:'stockId',index:'stockId',  align:"right",hidden:true,editrules:{ edithidden:true},editable:false}


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
                    caption: "Toolbar Searching"

                });

               jQuery("#toolbar").jqGrid('navGrid','#ptoolbar',{del:true,add:false,edit:false,search:false,view:true });
              jQuery("#toolbar").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
            




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

                                            <button name="action" value="Add" class="button" onclick="window.location.href='Stock.jsp'"><span><span>เพิ่ม</span></span></button>
                                            



                                        </div>

                                        <center>

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
    </body>
</html>
