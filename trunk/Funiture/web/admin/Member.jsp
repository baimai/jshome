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
                    colNames:['No','Login', 'firtName', 'LastName','Status','Register','Approve','Status','memberId'],
                    colModel:[
                        {name:'No',index:'No', width:40,align:"right",editable:false,editoptions:{readonly:true,size:10}},
                        {name:'memberLogin',index:'memberLogin',align:"center", width:120,editrules:{ edithidden:false},editable:false},
                        {name:'memberName',index:'memberName',align:"center", width:180,editrules:{ edithidden:false},editable:false},
                        {name:'memberSurName',index:'memberSurName',align:"center", width:180,editrules:{ edithidden:false},editable:false},
                        {name:'memberStatus',index:'memberStatus', width:80, align:"center",editable:false,editoptions:{size:25}},
                        {name:'memberRegDate',index:'memberRegDate', width:125, align:"right",editrules:{ edithidden:false},editable:false},
                        {name:'memberAppdate',index:'memberAppdate', width:125, align:"right",editrules:{ edithidden:false},editable:false},
                        {name:'status',index:'status', width:60,hidden:true,align:"center",editrules:{ edithidden:true},editable:true,edittype:'select', editoptions:{value:{'Y':'Active','N':'InActive','B':'Ban'}}},
                        {name:'memberId',index:'memberId', align:"right",hidden:true,editrules:{ edithidden:false},editable:true}


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
                {add:false,del:false,search:true}, //options
                {height:100,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:230,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,editData:{action:"Del"}}, // del options
                {} // search options
            );




            });
        </script>
        <title>JSP Page</title>
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
                        <table id="rowed2"></table>
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
