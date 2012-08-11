<%--
    Document   : jshome_ProductGroup
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${param.productGroupId!=null}">
    <sql:query var="query" dataSource="webdb">
        SELECT pgm.Product_Group_Code,
        pgm.Product_G_Name_T,
        pgm.Product_G_Name_E,
        pgm.Product_Pic_Loc,
        pgm.Product_Icon_Loc,
        pgm.Product_Remark_T,
        pgm.Product_Remark_E,
        pgm.Product_G_Display_Flag,
        pgm.Create_Date,
        pgm.Update_Date,
        pgm.User_Id
        FROM product_group_master pgm
        where pgm.product_group_id =  ${param.productGroupId}
    </sql:query>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
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
        <script src="jqgrid4.2/js/jquery.jqGrid.src.js" type="text/javascript"></script>
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
            function remove(productGroupId){
                var param = "productGroupId="+productGroupId+"&action=Del";
                alert(productGroupId);
                postDataReturnText("remove.do",param,test);
                window.location.href='ProductGroup.jsp';
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
                    url:'xmlProductGroup.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['รหัสกลุ่มสินค้า', 'ชื่อกลุ่มสินค้า(ไทย)', 'ชื่อกลุ่มสินค้า(อังกฤษ)','สถานะกลุ่มสินค้า','Path เก็บรูป Icon','หมายเหตุ(ไทย)','หมายเหตุ(อังกฤษ)','วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','Group Id','แก้ไข','ลบ'],
                    colModel:[
                       
                        {name:'productGroupCode',index:'productGroupCode', align:"center", width:150,editoptions:{editable:true,size:25},editrules:{number:true,required:true,edithidden:true},formoptions:{/* rowpos:1, label: "productGroupCode",*/ elmprefix:"(*)"}},
                        {name:'productGNameT',index:'productGNameT',  align:"centert",width:200,editable:true,editoptions:{size:25}},
                        {name:'productGNameE',index:'productGNameE', align:"centert", width:200,editable:true,editoptions:{size:25}},
                        {name:'productGDisplayFlag',index:'productGDisplayFlag', width:120,editable:true,editoptions:{size:25},edittype:"file"},
                        {name:'productIconLoc',index:'productIconLoc',width:80,hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkT',index:'productRemarkT',width:80,hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkE',index:'productRemarkE',width:80,hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'createDate',index:'createDate', align:"centert", width:200,editable:false,editoptions:{size:25},formatter:'date',
                            formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"},search:'true', searchoptions:{ dataInit:function(el){
                                    $(el).datepicker({
                                        dateFormat:'yy-mm-dd',newformat:"dd/mm/yy",
                                        onSelect: function(dateText, inst){ $("#rowed1")[0].triggerToolbar(); }
                                    });} }},
                        {name:'updateDate',index:'updateDate', align:"centert", width:200,editable:false,editoptions:{size:25},formatter:'date',
                            search:'true', searchoptions:{ dataInit:function(el){
                                    $(el).datepicker({

                                        dateFormat:'yy-mm-dd',newformat:"dd/mm/yy",
                                        onSelect: function(dateText, inst){ $("#rowed1")[0].triggerToolbar(); }
                                    });} }},
                        {name:'userId',index:'userId', align:"centert", width:200,editable:false,editoptions:{size:25}},
                        {name:'productGroupId',index:'productGroupId', align:"centert",hidden:true,editrules:{ edithidden:false},editable:true},
                         {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductGroup.jsp?productGroupId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                         {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}},

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
                    caption:"ประเภทสินค้า",
                    editurl:"productGroup.do"
                });
                 jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true} //options
              /*  {height:300,width:460,reloadAfterSubmit:false,editData:{action:"Edit"}}, // edit options
                {height:300,width:460,reloadAfterSubmit:false,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,
                    delData:{action:"Del",
                        menuGroupId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'menuGroupId');
                            return value;
                        }}}, // del options
                {} // search options*/
            );
            });
               // jQuery("#rowed1").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
               // jQuery("#rowed1").jqGrid('navGrid','#prowed1',
               
               // {height:290,reloadAfterSubmit:false, jqModal:false, closeOnEscape:true, bottominfo:"Fields marked with (*) are required"}, // edit options
               //  {height:290,reloadAfterSubmit:false,jqModal:false, closeOnEscape:true,bottominfo:"Fields marked with (*) are required", closeAfterAdd: true}, // add options
               //  {reloadAfterSubmit:false,jqModal:false, closeOnEscape:true}
             

              //  {reloadAfterSubmit:true,
               //     delData:{action:"Del",
                //        productGroupId:function() {
                //            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                 //           var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'productGroupId');
                //            return value;
                 //       }}
               // } // del options

                // del options

               
            
               
            
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
                                            <div class="button" align="right">
                                                <button name="action" value="Add" class="button" onclick="window.location.href='addProductGroup.jsp'"><span><span>เพิ่ม</span></span></button>
                                            </div>
                                        </div>
                                        <table id="rowed1"></table>
                                        <div id="prowed1"></div>
                                        <br /> <br />

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
        <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>
</html>
