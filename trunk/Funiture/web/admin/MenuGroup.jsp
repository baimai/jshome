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
                jQuery("#rowed1").jqGrid({
                    url:'xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','Menu Name TH', 'Menu Name En', 'Permission','showList','LoginSts','menuGRemarkT','menuGRemarkE','menuGroupId','menuGPicLoc' ],
                    colModel:[
                        {name:'No',index:'No', width:50,align:"right",editable:false,editoptions:{readonly:true,size:10}},
                        {name:'menuGNameT',index:'menuGNameT', width:200,editable:true,editoptions:{size:25}},
                        {name:'menuGNameE',index:'menuGNameE', width:200,editable:true,editoptions:{size:25}},
                        {name:'menuPermission',index:'menuPermission',align:"center", width:90,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'U':'U','N':'N'}}},
                        {name:'showListMenu',index:'showListMenu',align:"center",width:80,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'F':'F','Y':'Y','N':'N'}}},
                        {name:'chkLoginSts',index:'chkLoginSts',align:"center",width:80,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'F':'F','Y':'Y','N':'N'}}},
                        {name:'menuGRemarkT',index:'menuGRemarkT',align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}},
                        {name:'menuGRemarkE',index:'menuGRemarkE',align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}},
                        {name:'menuGroupId',index:'menuGroupId',  align:"right",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'menuGPicLoc',index:'menuGPicLoc',width:200,align:"center",editable:true}                      
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
                    editurl:"menuGroupMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        menuGroupId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'menuGroupId');
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
                    <br><br>  <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>เมนูหลัก</h1>
                                        </div>
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

    </body>
</html>
