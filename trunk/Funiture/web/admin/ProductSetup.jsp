<%--
    Document   : jshome_ProductSetup
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
                    url:'datagrid.do?action=fetchData&q=1&page=1',
                    //url:'datagrid.do?action=fetchData&q=1&picCode=00010',
                    datatype: "xml",
                    colNames:['Pic detail','piccode','Picture','Product Code','วันที่สร้าง','วันที่แก้ไข','ผู้ใช้', '','แก้ไข','ลบ'],
                    colModel:[
                        {name:'picDetalId',index:'picDetalId', align:"center",width:80,editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'picCode',index:'picCode', align:"center",width:80,editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'picPath',index:'picPath', align:"center",width:80,editable:false, edittype: 'image',formatter:function(cellvalue, options, rowObject){return "<img src=\"../"+cellvalue+"\" width=\"50\" height=\"50\" alt=\"Bottom_texture\"/>"}},
                        {name:'productCode',index:'productCode', align:"center",width:110,editable:true,editoptions:{size:10}},
                        {name:'createDate',index:'createDate', align:"center",width:110,editable:true,editoptions:{size:10}},
                        {name:'updateDate',index:'updateDate', align:"center",width:110,editable:true,editoptions:{size:10}},
                        {name:'userId',index:'userId', align:"center",width:110,editable:true,editoptions:{size:10}},
                        {name:'picDetalId',index:'picDetalId', width:55,hidden:true,editable:true,editrules:{edithidden:true}},
                        {name:'Edit',index:'Edit', width:100,hidden:false,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductSetupDetail.jsp?picDetalId="+cellvalue+"\" ><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},      
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}},// {name:'Edit2',index:'Edit2', width:100,hidden:false,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"seqProductSetup.do?action=fetchData&picCode="+cellvalue+"\" >Seq</a>"}}
                    ]
                    ,
                    rowNum:20,
                    height: "auto",
                    width: 930,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"productSetupDetail.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true,add:false}, //options
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

                    <br><br> <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>จัดการรูปแสดงสินค้า</h1>
                                        </div>
                                        
                                         <center>
                                             <button onclick="window.location.href='addProductSetupDetail.jsp'" class="button"><span><span>เพิ่ม</span></span></button>
                                        <br>
                                            <img src="images/line.jpg" width="930" height="" alt=""/>
                                            <br>
                                        </center>
                                        <br>
                                        <center>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br />
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
