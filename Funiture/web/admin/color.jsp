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
                    url:'xmlColorMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','Color Code', 'Color Name T ', 'Color Name E ','Color Id' ],
                    colModel:[
                        {name:'No',index:'No', width:60,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'colorCode',index:'colorCode', width:180,editable:true,editoptions:{size:10}},
                        {name:'colorNameT',index:'colorNameT', width:288,editable:true,editoptions:{size:25}},
                        {name:'colorNameE',index:'colorNameE', width:288,editable:true,editoptions:{size:25}},
                        {name:'colorId',index:'colorId',  align:"right",hidden:true,editrules:{ edithidden:true},editable:false}


                    ],
                    rowNum:10,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"colorMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:250,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:250,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,editData:{action:"Del"}}, // del options
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