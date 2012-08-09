<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
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

             function remove(menuGroupId){
                var param = "menuGroupId="+menuGroupId+"&action=Del";
                
                postDataReturnText("remove.do",param,test);
                window.location.href='MenuGroup.jsp';
                alret(menuGroupId);
            }
            function test(text){
            }
            function confirmDelete(id) {
                if (confirm("คุณต้องการลบหรือไม่ !")) {
                    remove(id);
                }
            }

            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','ชื่อเมนู(ไทย)', 'ชื่อเมนู(อังกฤษ)', 'สิทธิของผู้ใช้','แสดงเมนูย่อย','ต้อง login ก่อนเข้าใช้','หมายเหตุ(ไทย)','หมายเหตุ(อังกฤษ)','call Programe','วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','แก้ไข','ลบ'],
                    colModel:[
                        {name:'No',index:'No', width:50,align:"right",editable:false,editoptions:{readonly:true,size:10},search:false},
                        {name:'menuGNameT',index:'menuGNameT', width:180,editable:true,editoptions:{size:25}},
                        {name:'menuGNameE',index:'menuGNameE', width:180,editable:true,editoptions:{size:25}},
                        {name:'menuPermission',index:'menuPermission',align:"center", width:110,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'A':'Admin','U':'User','C':'Contact','M':'Member'}}},
                        {name:'showListMenu',index:'showListMenu',align:"center",width:110,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'F':'F','Y':'Y','N':'N'}}},
                        {name:'chkLoginSts',index:'chkLoginSts',align:"center",width:160,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'F':'F','Y':'Y','N':'N'}}},
                        {name:'menuGRemarkT',index:'menuGRemarkT',align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}},
                        {name:'menuGRemarkE',index:'menuGRemarkE',align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}},
                        {name:'menuGIconLoc',index:'menuGIconLoc', align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}},
                        {name:'createDate',index:'createDate', align:"centert", width:150,editable:false,editoptions:{size:25},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'updateDate',index:'updateDate', align:"centert", width:150,editable:false,editoptions:{size:25},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'userId',index:'userId', width:100,editable:false,editoptions:{size:25}},
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addMenuGroup.jsp?menuGroupId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}}
                    ],
                    rowNum:20,
                    height: "auto",
                    width: 950,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    loadonce:true,
                    pager: '#prowed1',
                    //imgpath: 'upload/picture/icon',
                    sortname: 'id',
                    //viewrecords: true,
                    sortorder: "desc",
                    caption:"เมนูหลัก",
                    editurl:"menuGroupMaster.do"

                });
               jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true} //options
              //  {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
              //  {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
               // {reloadAfterSubmit:true,
              //      delData:{action:"Del",
               //         menuGroupId:function() {
              //              var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
              //              var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'menuGroupId');
             //               return value;
              //          }}}, // del options
            //    {} // search options
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
                                             <button name="action" value="Add" class="button" onclick="window.location.href='addMenuGroup.jsp'"><span><span>เพิ่ม</span></span></button>
                                             
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
