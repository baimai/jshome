<%--
    Document   : jshome_MenuDetail
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@ include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${param.menuCodeId!=null}">
    <sql:query var="query" dataSource="webdb">
       Select pgm.Company_Id,
        pgm.Menu_Group_Id,
        pgm.Menu_C_Name_T,
        pgm.Menu_C_Name_E,
        pgm.Pic_Id,
        pgm.Menu_Seq,
        pgm.Show_List_Sts,
        pgm.Menu_Code_Id,
        pgm.Menu_C_Remark_T,
        pgm.Menu_C_Remark_E,
        pgm.Menu_C_Icon_Loc,
        pgm.Create_Date,
        pgm.Update_Date,
        pgm.User_Id,
        pps.Pic_Code
        FROM menu_detail_master pgm
        where pgm.menu_Code_Id =  ${param.menuCodeId}
    </sql:query>
</c:if>
<c:set var="listGroup" value="" />
<c:forEach  items="${query3.rows}" var="list">
    <c:set var="listGroup" value="${listGroup}${list.menu_group_id}:${list.menu_g_name_e};" />
</c:forEach>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>jshome</title>
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
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
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
        <script  type="text/javascript">
              $(function() {
                $("#datepicker").datepicker();
            });

            function splitDate(date){
                var t = date.split("/");  //ถ้าเจอวรรคแตกเก็บลง array t
                return t[2]+"-"+t[0]+"-"+t[1];
            }
            function remove(menuCodeId){
                var param = "menuCodeId="+menuCodeId+"&action=Del";
                //alert(param);
                postDataReturnText("remove.do",param,test);
                window.location.href='MenuDetail.jsp';
                //
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
                    url:'xmlMenuGroupMaster.do?action=fetchData&q=2',
                    datatype: "xml",
                    colNames:['NO', 'รหัสเมนูหลัก','ชื่อเมนูย่อย(ไทย)', 'ชื่อเมนูย่อย(อังกฤษ)','รหัสชุดการแสดงสินค้า','ลำดับที่.','แสดงเมนูย่อย','หมายเหตุ(ไทย)','หมายเหตุ(อังกฤษ)','Path เก็บรูป Icon','วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','Code Id','แก้ไข','ลบ'],
                    colModel:[
                        {name:'No',index:'No',editoptions:"", width:60,align:"right",search:false},
                        {name:'menuGroupId',index:'menuGroupId', width:150,align:"center",editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:"${listGroup}"}},
                        {name:'menuCNameT',index:'menuCNameT', width:150,align:"center",editable:true,editoptions:{size:25}},
                        {name:'menuCNameE',index:'menuCNameE', width:150, align:"center",editable:true,editoptions:{size:25}},
                        {name:'picId',index:'picId', width:100, align:"center",editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'menuSeq',index:'menuSeq', width:100, align:"center",editable:true,editoptions:{size:10}},
                        {name:'showListSts',index:'showListSts', width:100, align:"center",editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'Y':'Show','N':'Hidden'}}},
                        {name:'menuCRemarkT',index:'menuCRemarkT', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'menuCRemarkE',index:'menuCRemarkE', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'menuCIconLoc',index:'menuCIconLoc', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'createDate',index:'createDate', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'updateDate',index:'updateDate', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'userId',index:'userId', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'menuCodeId',index:'menuCodeId', align:"centert",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"menuDetailMaster.jsp?menuCodeId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}}
                    ],
                    rowNum:20,
                     height: "auto",
                     width: 930,
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"เมนูย่อย",
                    pager: '#prowed1',
                    editurl:"menuDetailMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                //{search:true}, //options
                {add:false,edit:false,del:false,search:true,view:false},
                {height:430,width:320,reloadAfterSubmit:false,editData:{action:"Edit"}}, // edit options
                {height:430,width:320,reloadAfterSubmit:false,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,
                    delData:{action:"Del",
                        menuCodeId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'menuCodeId');
                            return value;
                        },picCode:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'picCode');
                            return value;
                        }
                    }}, // del options
                {} // search options
            );



            });
        </script>
    </head>
    <body >
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
                                            <h1>เมนูย่อย</h1>

                                            <div class="button" align="right">
                                            <button name="action" value="Add" class="button" onclick="window.location.href='menuDetailMaster.jsp'"><span><span>เพิ่ม</span></span></button>
                                            </div>
                                            </div>

                                        <center>
                                            <img src="images/line.jpg" width="930" height="" alt=""/>
                                            <br>
                                        </center>
                                        
                                        <center>
                                            <br/>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br><br><br>
                                        </center>
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
