
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${param.productGroupId != null || param.productGroupId != ''}">
    <c:set var="productGroupId" value="&productGroupId=${param.productGroupId}" />
</c:if>
<c:if test="${param.productGroupId == null || param.productGroupId == ''}">
    <c:set var="productGroupId" value="" />
</c:if>
<sql:query var="query3" dataSource="webdb">
    SELECT * FROM product_group_master
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>jqGrid Demos</title>
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
                    url:'xmlProductGroup.do?action=fetchData&rows=3&page=1&q=2&Edit=1&Del=1${productGroupId}',
                    datatype: "xml",
                    colNames:['Product Code','Name Th', 'Name En', 'Price','Remark Th','Remark En','Edit','Delete'],
                    colModel:[
                        {name:'Code',index:'Code',editoptions:"", width:100,align:"right"},
                        {name:'nameTh',index:'nameTh', width:215,align:"right"},
                        {name:'nameEn',index:'nameEn', width:215, align:"right"},
                        {name:'price',index:'price', width:60, align:"right"},
                        {name:'remarkTh',index:'remarkTh', width:140,align:"right", sortable:false, search:false},
                        {name:'remarkEn',index:'remarkEn', width:140,align:"right", sortable:false, search:false},
                        {name:'Edit',index:'Edit', width:50,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductDetail.jsp?productDetailId="+cellvalue+"\">Edit</a>"}},
                       	{name:'Del',index:'Del', width:50,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"productDetail.do?productDetailId="+cellvalue+"&action=Del\">Del</a>"}}
                    ],
                    height:200,
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Product Group"
                    
                });
               
               
                

            });
        </script>
    </head>
    <body >

        <jsp:include page="header.jsp"/> 
    <center>
        <br/>
        <select onchange="window.location='manageProductDetail.jsp?productGroupId='+this.value;">
            <option value=""> ทั้งหมด </option>
            <c:forEach items="${query3.rows}" var="group">

                <option value="${group.product_group_Id}"
                        <c:if test="${param.productGroupId == group.product_group_Id && param.productGroupId != null}">
                            selected
                        </c:if>
                        >${group.product_g_name_t}</option>

            </c:forEach>
        </select>
        <br/><br/>
        <table id="rowed1"></table>
        <br/>
        <form action="addProductDetail.jsp" >
            <input type="hidden" name="productGroupId" value="${param.productGroupId}" />
            <div align="left"> <input type="submit" value="Add" /></div>
        </form>
        

    </center>
    <br/><br/><br/>
</body>
</html>