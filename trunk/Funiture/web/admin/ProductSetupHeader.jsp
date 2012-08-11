<%--
    Document   : jshome_ProductSetupHeader
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@ include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
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
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'datagrid.do?action=fetchData&q=2',
                    datatype: "xml",
                    colNames:['รหัสชุดการแสดงสินค้า','ชื่อชุดการแสดงสินค้า(ไทย)','ชื่อชุดการแสดงสินค้า(อังกฤษ)','วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','','',''],
                        colModel:[
                        {name:'picCode',index:'picCode', align:"center",width:80,editable:true,editoptions:{size:10},editrules:{required:true},search:false},
                        {name:'picNameT',index:'picNameT', width:225, align:"center",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'picNameE',index:'picNameE', width:225, align:"center",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'createDate',index:'createDate', align:"centert", width:200,editable:false,editoptions:{size:25},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'updateDate',index:'updateDate', align:"centert", width:200,editable:false,editoptions:{size:25},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'userId',index:'userId', align:"centert", width:200,editable:false,editoptions:{size:25}},
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductSetup.jsp?picId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Edit2',index:'Edit2', width:100,hidden:false,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"seqProductSetup.do?action=fetchData&picId="+cellvalue+"\" ><img src=\"../images/icon/barchart-blue.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}},// {name:'Edit2',index:'Edit2', width:100,hidden:false,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"seqProductSetup.do?action=fetchData&picCode="+cellvalue+"\" >Seq</a>"}}
                    ]
                    ,
                    rowNum:20,
                    height: "auto",
                    width: 950,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"หัวข้อรูปแสดงสินค้า",
                    editurl:"productSetup.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true,edit:true,add:true,del:true}, //options
                {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        picId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'picId');
                            return value;
                        }}}, // del options
                {} // search options
            );
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
                                            <h1>หัวข้อแสดงรูปสินค้า</h1>
                                        </div>
                                        <br/>
                                        <button onclick="window.location.href='addProductSetup.jsp'" class="button"><span><span> Add</span></span></button>
                                        <br/><br/>
                                        <center>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br />

                                        </center>
                                        <br/><br/><br/>
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
