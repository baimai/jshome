<%--
    Document   : jshome_MemberGrade
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@ include file="checkRole.jsp" %>
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
                    url:'xmlMemberGradeMaster.do?action=fetchData&rows=3&page=1&q=2',
                    datatype: "xml",
                    colNames:['No','รหัสเกรด', 'ชื่อเกรด T ', 'ชื่อเกรด E ','ส่วนลด','payment Term','ประเภทราคา','memberGradeId','แก้ไข','ลบ' ],
                    colModel:[
                        {name:'No',index:'No', width:60,editable:false,editoptions:{readonly:true,size:10},formoptions:{elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberGrade',index:'memberGrade', width:80,editable:true,editoptions:{size:10,readonly:true},formoptions:{elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'gradeNameT',index:'gradeNameT', width:100,editable:true,editoptions:{size:25},formoptions:{elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'gradeNameE',index:'gradeNameE', width:100,editable:true,editoptions:{size:25},formoptions:{elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'discountRate',index:'discountRate', width:100,editable:true,editoptions:{size:25}, formoptions:{elmprefix:"(*)"},editrules:{required:true}},
                        {name:'paymentTerm',index:'paymentTerm', width:100,editable:true,editoptions:{size:25},formoptions:{elmprefix:"(*)"},editrules:{required:true}},
                        {name:'memberPriceFlag',index:'memberPriceFlag', width:100,editable:true,editoptions:{size:25},formoptions:{elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberGradeId',index:'member_Grade_Id',  align:"right",hidden:true,editrules:{ edithidden:false},editable:true,formoptions:{elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addMemberGrade.jsp?memberGradeId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}}


                    ],
                    rowNum:20,
                    height: "auto",
                    width: 930,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"ระดับ สมาชิก",
                    editurl:"memberGradeMaster.do"
                    
                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
              //  {search:true}, //options
                {add:false,edit:false,search:true,view:false,del:false},
              //  {height:250,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
             //   {height:250,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
             //   {reloadAfterSubmit:true,
              //      delData:{action:"Del",
              //          memberGradeId:function() {
              //              var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
              //              var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'memberGradeId');
              //              return value;
               //         }}}, // del options
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
                                            <h1>ประเภทสมาชิก</h1>
                                            <div class="button" align="right">

                                                <button name="action" value="Add" class="button" onclick="window.location.href='addMemberGrade.jsp'"><span><span>เพิ่ม</span></span></button>
                                            </div>
                                        </div>
                                         <center>
                                            <img src="images/line.jpg" width="930" height="" alt=""/>
                                            <br><br>
                                        </center>

                                        <center>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br />
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
