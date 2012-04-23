<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
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
        <script type="text/javascript" src="../ajax/myAjaxFramework.js" ></script>
        <script  type="text/javascript">
            function remove(productGroupId){
                var param = "productGroupId="+productGroupId+"&action=Del";
                postDataReturnText("remove.do",param,test);
                window.location.href='ProductGroup.jsp';
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
                    colNames:['แก้ไข','ลบ','รหัสกลุ่มสินค้า', 'ชื่อกลุ่มสินค้า(ไทย)', 'ชื่อกลุ่มสินค้า(อังกฤษ)','สถานะกลุ่มสินค้า','Path เก็บรูป Icon','หมายเหตุ(ไทย)','หมายเหตุ(อังกฤษ)','วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','Group Id'],
                    colModel:[
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductGroup.jsp?productGroupId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'productGroupCode',index:'productGroupCode', align:"center", width:150,editable:true,editoptions:{disabled: true,size:25}},
                        {name:'productGNameT',index:'productGNameT',  align:"centert",width:200,editable:true,editoptions:{size:25},editrules:{required:true}},
                        {name:'productGNameE',index:'productGNameE', align:"centert", width:200,editable:true,editoptions:{size:25}},
                        {name:'productGDisplayFlag',index:'productGDisplayFlag', width:120,editable:true,editoptions:{value:"Y:แสดงกลุ่มสินค้า;N:ไม่แสดงกลุ่มสินค้า;A:กลุ่มสินค้าโฆษณา"},stype:'select', editoptions:{value:":ทุกกลุ่มสินค้า;Y:แสดงกลุ่มสินค้า;N:ไม่แสดงกลุ่มสินค้า;A:กลุ่มสินค้าโฆษณา;"}},
                        {name:'productIconLoc',index:'productIconLoc',width:80,hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkT',index:'productRemarkT',width:80,hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkE',index:'productRemarkE',width:80,hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'createDate',index:'createDate', align:"centert", width:200,editable:false,editoptions:{size:25},formatter:'date',formatoptions:{srcformat:"Y-m-d",newformat:"Y-m-d"}},
                        {name:'updateDate',index:'updateDate', align:"centert", width:200,editable:false,editoptions:{size:25},formatter:'date',formatoptions:{srcformat:"Y-m-d",newformat:"Y-m-d"}},
                        {name:'userId',index:'userId', align:"centert", width:200,editable:false,editoptions:{size:25}},
                
                        {name:'productGroupId',index:'productGroupId', align:"centert",hidden:true,editrules:{ edithidden:false},editable:true}

                    ],
                    rowNum:20,
                    height: "auto",
                    width: 950,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    loadonce:true,
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"ประเภทสินค้า",
                    editurl:"productGroup.do"
                });
                jQuery("#rowed1").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {add:false,edit:false,search:false,view:true },

                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        productGroupId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'productGroupId');
                            return value;
                        }}
                        } // del options
               
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

    </body>
</html>
