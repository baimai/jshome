<%--
    Document   : jshome_MenuGroupMaster
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                    url:'xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','เมนู', 'MenuGroup', 'Permission','showListMenu','chkLoginSts','menuGRemarkT','menuGRemarkE','company Id','menuGroupId','menuGPicLoc','menuGIconLog' ],
                    colModel:[
                        {name:'No',index:'No', width:50,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'menuGNameT',index:'menuGNameT', width:200,editable:true,editoptions:{size:10}},
                        {name:'menuGNameE',index:'menuGNameE', width:200,editable:true,editoptions:{size:25}},
                        {name:'menuPermission',index:'menuPermission', width:80,editable:true,editoptions:{size:25}},
                        {name:'showListMenu',index:'showListMenu',width:80,editable:true,editoptions:{size:25}},
                        {name:'chkLoginSts',index:'chkLoginSts',width:80,editable:true,editoptions:{size:25}},
                        {name:'menuGRemarkT',index:'menuGRemarkT',align:"right",hidden:true,editrules:{ edithidden:true},editable:false},
                        {name:'menuGRemarkE',index:'menuGRemarkE',align:"right",hidden:true,editrules:{ edithidden:true},editable:false},
                        {name:'companyId',index:'companyId',  align:"right",hidden:true,editrules:{ edithidden:true},editable:false},
                        {name:'menuGroupId',index:'menuGroupId',  align:"right",hidden:true,editrules:{ edithidden:true},editable:false},
                        {name:'menuGPicLog',index:'menuGPicLoc',align:"right",hidden:true,editrules:{ edithidden:true},editable:true},
                        {name:'menuGIconLog',index:'menuGIconLoc',align:"right",hidden:true,editrules:{ edithidden:true},editable:true},
                    ],
                    rowNum:10,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"menuGroupMaster.do"
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
    <center>
        <table id="rowed1"></table>
        <div id="prowed1"></div>
        <br />
    </center>
    <br/><br/><br/>
     <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>

</html>
