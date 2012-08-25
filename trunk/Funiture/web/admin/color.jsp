<%--
    Document   : jshome_Color
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
            function remove(colorId){
                var param = "colorId="+colorId+"&action=Del";
                alert(param);
                postDataReturnText("remove.do",param,test);
                window.location.href='color.jsp';
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
                    url:'xmlColorMaster.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['รหัสสี', 'คำอธิบาย(ไทย)', 'วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','Color Id','แก้ไข','ลบ' ],
                    colModel:[                        
                        {name:'colorCode',index:'colorCode', width:120,	editable:true,editoptions:{ size:25},editrules:{required:true}},
                        {name:'colorNameT',index:'colorNameT', width:120,editable:true,editoptions:{size:25},editrules:{required:true}},
                        {name:'createDate',index:'createDate', width:120,editable:false,editoptions:{size:25},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"},searchoptions:{dataInit:function(el){$(el).datepicker({dateFormat:'dd/mm/yy'});} }},
                        {name:'updateDate',index:'updateDate', width:120,editable:false,editoptions:{size:25},formatter:'date',formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"},searchoptions:{dataInit:function(el){$(el).datepicker({dateFormat:'dd/mm/yy'});} }},
                        {name:'userId',index:'userId', width:120,editable:false,editoptions:{size:25}},
                        {name:'colorId',index:'colorId',  align:"right",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addColor.jsp?colorId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
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
                    caption:"สีของสินค้า",
                    editurl:"colorMaster.do"

                });
               // jQuery("#rowed1").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',

                {add:false,edit:false,search:true,view:false,del:false},

              //  {height:180,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
             //   {height:230,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
             //  {reloadAfterSubmit:true,
               //    delData:{action:"Del",
                   //     colorId:function()
                   //     {
                   //        var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                   //        var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'colorId');
                   //        return value;
     
                   //     }}},
                // del options
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
                                            <h1>ข้อมูลสีสินค้า</h1>
                                            <button name="action" value="Add" class="button" onclick="window.location.href='addColor.jsp?'"><span><span>เพิ่ม</span></span></button>
                                        </div>

                                        <center>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br />
                                        </center>
                                        <br/><br/> </div>
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
