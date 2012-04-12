<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
                    url:'xmlProductGroup.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['รหัสกลุ่มสินค้า', 'ชื่อกลุ่มสินค้า(ไทย)', 'ชื่อกลุ่มสินค้า(อังกฤษ)','สถานะกลุ่มสินค้า','วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','Group Id'],
                    colModel:[                       
                        {name:'productGroupCode',index:'productGroupCode', align:"center", width:150,editable:true,editoptions:{size:10}},
                        {name:'productGNameT',index:'productGNameT',  align:"centert",width:200,editable:true,editoptions:{size:25}},
                        {name:'productGNameE',index:'productGNameE', align:"centert", width:200,editable:true,editoptions:{size:25}},
                        {name:'productGDisplayFlag',index:'productGDisplayFlag', width:80,editable:true,editrules:{ edithidden:true},edittype:'select',editoptions:{value:{'Y':'Show','N':'Not Show','A':'Show On Slide'}}},
                        {name:'createDate',index:'createDate', align:"centert", width:200,editable:true,editoptions:{size:25}},
                        {name:'updateDate',index:'updateDate', align:"centert", width:200,editable:true,editoptions:{size:25}},
                        {name:'userId',index:'userId', align:"centert", width:200,editable:true,editoptions:{size:25}},
                        {name:'productGroupId',index:'productGroupId', align:"centert",hidden:true,editrules:{ edithidden:false},editable:true}

                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    height: "auto",
                     width: 950,
                    sortorder: "desc",
                    caption:"ประเภทสินค้า",
                    editurl:"productGroup.do"
                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:280,width:460,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:280,width:460,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        productGroupId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'productGroupId');
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
                                            <h1>ข้อมูลประเภทสินค้า</h1>
                                        </div>

                                        <center>

                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br /> <br />
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
