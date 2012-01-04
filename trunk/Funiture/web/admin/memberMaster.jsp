<%-- 
    Document   : memberMaster
    Created on : Dec 29, 2011, 12:14:30 PM
    Author     : Baimai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>jqGrid Demos</title>
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
                    url:'xmlMemberMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','Login', 'firtName', 'LastName','Company','Status','Register','Approve','memberId','companyId'],
                    colModel:[
                        {name:'No',index:'No', width:40,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'memberLogin',index:'memberLogin', width:80,editable:true,editoptions:{size:10}},
                        {name:'memberName',index:'memberName', width:248,editable:true,editoptions:{size:25}},
                        {name:'memberSurName',index:'memberSurName', width:248,editable:true,editoptions:{size:25}},
                        {name:'memberComName',index:'memberComName', width:125, align:"right",editable:true,editoptions:{size:25}},
                        {name:'memberStatus',index:'memberStatus', width:125, align:"right",editable:true,editoptions:{size:25}},
                        {name:'memberRegDate',index:'memberRegDate', width:125, align:"right",editable:true,editoptions:{size:25}},
                        {name:'memberAppdate',index:'memberAppdate', width:125, align:"right",editable:true,editoptions:{size:25}},
                        {name:'memberId',index:'memberId', align:"right",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'companyId',index:'companyId', align:"right",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:10}}

                    ],
                    rowNum:10,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"memberMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:230,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:230,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,editData:{action:"Del"}}, // del options
                {} // search options
            );




            });
        </script>
    </head>
    <body >

        <jsp:include page="header.jsp"/>
    <center>
        <table id="rowed1"></table>
        <div id="prowed1"></div>
        <br />
        <table id="rowed2"></table>
    </center>
    <br/><br/><br/>
    </body>
</html>
