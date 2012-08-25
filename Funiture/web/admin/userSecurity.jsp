<%--
    Document   : jshome_UserSecurity
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    url:'xmlUserSecurity.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','ชื่อเข้าใช้','รหัสผ่าน','ชื่อภาษาไทย ', 'ชื่อภาษาอังกฤษ ','ระดับ','สถานะ','วันที่อนุมัติ','วันที่หยุดใช้งาน','Edit','Del' ],
                    colModel:[
                        {name:'No',index:'No', width:30,editable:false,editoptions:{readonly:true,size:5},search:false},
                        {name:'userId',index:'userId', width:80,editable:true,editoptions:{size:10}},
                        {name:'userPassword',index:'userPassword', hidden:true,editrules:{ edithidden:true},editable:true,edittype:"password",editoptions:{size:10}},
                        {name:'userNameT',index:'userNameT', width:88,editable:true,editoptions:{size:15}},
                        {name:'userNameE',index:'userNameE', width:88,editable:true,editoptions:{size:15}},
                        {name:'userAuthoritySts',index:'userAuthoritySts', width:88,editable:true,edittype:'select',editoptions:{value:{'A':'Admin','U':'User'}}},
                        {name:'userAliveSts',index:'userAliveSts', width:88,editable:true,edittype:'select',editoptions:{value:{'A':' Active','I':' Inactive'}}},
                        {name:'approvedDate',index:'approvedDate', width:88,editrules:{ edithidden:true},editable:false},
                        {name:'holdDate',index:'holdDate', width:88,editrules:{ edithidden:true},editable:false},
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addUserSecurity.jsp?UserId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}}
                    ],
                    rowNum:20,
                    height: "auto",
                    width: 930,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"userSecurity.do"
                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                // {search:true}, //options
                {add:false,edit:false,search:true,view:false,del:false},
                {height:250,reloadAfterSubmit:false,editData:{action:"Edit"}}, // edit options
                {height:250,reloadAfterSubmit:false,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        colorId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'UserId');
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
                                            <h1>ข้อมูลผู้ใช้</h1>
                                            <button name="action" value="Add" class="button" onclick="window.location.href='addUserSecurity.jsp'"><span><span>เพิ่ม</span></span></button>
                                        </div>
                                        <center>
                                            <img src="images/line.jpg" width="930" height="" alt=""/>
                                            <br><br>
                                        </center>
                                        <center>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br>
                                        </center>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br> 
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

