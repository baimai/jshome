<%-- 
    Document   : productSetupHeader
    Created on : Feb 17, 2012, 10:17:13 AM
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <title>JSP Page</title>
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
                jQuery("#rowed1").jqGrid({
                    url:'datagrid.do?action=fetchData&rows=3&page=1&q=2',
                    datatype: "xml",
                    colNames:['No','Pic Code', 'Menu Name Th','Menu Name En','','',''],
                    colModel:[
                        {name:'No',index:'No', width:55,editable:false,editoptions:{readonly:true,size:10},search:false},
                        {name:'picCode',index:'picCode', align:"center",width:80,editable:true,editoptions:{size:10},editrules:{required:true},search:false},
                        {name:'picNameT',index:'picNameT', width:225, align:"center",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'picNameE',index:'picNameE', width:225, align:"center",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'Add',index:'Add', width:100,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductSetup.jsp?picCode="+cellvalue+"\" ><img src=\"../images/icon/plus_orange.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Edit',index:'Edit', width:100,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"ProductSetup.jsp?picCode="+cellvalue+"\" ><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Edit2',index:'Edit2', width:100,hidden:false,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"seqProductSetup.do?action=fetchData&picCode="+cellvalue+"\" >Seq</a>"}}
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
                {search:true,edit:false,add:false,del:false}, //options
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
                    <br><br><br>
                    <center>
                        <table id="rowed1"></table>
                        <div id="prowed1"></div>
                        <br />

                    </center>
                    <br/><br/><br/>

                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>

    </body>
</html>
