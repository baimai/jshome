<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
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
                    url:'datagrid.do?action=fetchData&rows=3&page=1&q=1&picCode=${param.picCode}',
                    datatype: "xml",
                    colNames:['No','Pic Code','Picture','Product Code','Pic Name Th','Pic Name En', 'Remark Thai','Remark Eng','Pic Id',''],
                    colModel:[
                        {name:'No',index:'No', width:55,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'picCode',index:'picCode', align:"center",width:80,editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'picPath',index:'picPath', align:"center",width:80,editable:false, edittype: 'image',formatter:function(cellvalue, options, rowObject){return "<img src=\"../"+cellvalue+"\" width=\"50\" height=\"50\" alt=\"Bottom_texture\"/>"}},
                        {name:'productCode',index:'productCode', align:"center",width:110,editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'picNameT',index:'picNameT', width:225, align:"center",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'picNameE',index:'picNameE', width:225, align:"center",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkT',index:'productRemarkT', width:225, align:"right",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkE',index:'productRemarkE', width:225, align:"right",hidden:true,editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'picId',index:'picId', width:55,hidden:true,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'Edit',index:'Edit', width:100,hidden:true,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"seqProductSetup.do?action=fetchData&picCode="+cellvalue+"\" >Seq</a>"}}
                    ]
                    ,
                    rowNum:20,
                    height:400,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"productSetup.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true,edit:false}, //options
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
