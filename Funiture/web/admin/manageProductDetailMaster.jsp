
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query3" dataSource="webdb">
    SELECT * FROM product_group_master
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>jqGrid Demos</title>
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
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
        <script type="text/javascript" src="../ajax/myAjaxFramework.js" ></script>
        <script  type="text/javascript">
            function remove(productDetailId){
                var param = "productDetailId="+productDetailId+"&action=Del";
                postDataReturnText("remove.do",param,test);
                $('#rowed1').trigger("reloadGrid");
            }
            function test(){

            }
            function show(){
                if(document.getElementById('groupId').value==''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlProductGroup.do?action=fetchData&q=2&Edit=1&Del=1"});
				jQuery("#rowed1").trigger('reloadGrid');
                }else{
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlProductGroup.do?action=fetchData&q=2&Edit=1&Del=1&productGroupId="+document.getElementById('groupId').value});
                }
                jQuery("#rowed1").trigger('reloadGrid');
                
            }
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({        
                    url:'xmlProductGroup.do?action=fetchData&q=2&Edit=1&Del=1',
                    datatype: "xml",
                    colNames:['Product Code','Name Th', 'Name En', 'Price','Edit','Del'],
                    colModel:[
                        {name:'Code',index:'Code',editoptions:"", width:100,align:"right"},
                        {name:'nameTh',index:'nameTh', width:225,align:"right"},
                        {name:'nameEn',index:'nameEn', width:225, align:"right"},
                        {name:'price',index:'price', width:100, align:"right"},                      
                        {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"ProductDetail.jsp?productDetailId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"remove("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}}
                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    height: "auto",
                    width: 950,
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"รายการสินค้า"
                    // editurl:"colorMaster.do"
                    
                });
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
                    <br><br>
                    <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>ข้อมูลรายการสินค้า</h1>
                                            <div class="button" align="right">
                                                <form action="ProductDetail.jsp" >
                                                    <input type="hidden" name="productGroupId" value="${param.productGroupId}" />
                                                    <button name="action" value="Add" class="button"><span><span>เพิ่ม</span></span></button>
                                                </form>


                                            </div>
                                        </div>

                                        <center>
                                            <br/>
                                            <div class="field"> ประเภทสินค้า
                                                <select id="groupId" onchange="show()">
                                                    <option value=""> ทั้งหมด </option>
                                                    <c:forEach items="${query3.rows}" var="group">

                                                        <option value="${group.product_group_Id}" >${group.product_g_name_t}</option>

                                                    </c:forEach>
                                                </select>
                                                <br/><br/></div>
                                            <table id="rowed1"></table>
                                            <br/>
 
                                            <div id="prowed1"></div>

                                        </center>
                                        <br/> </div>
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