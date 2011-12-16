
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${param.productGroup != null || param.productGroup != ''}">
    <c:set var="productGroup" value="&productGroup=${param.productGroup}" />
</c:if>
<c:if test="${param.productGroup == null || param.productGroup == ''}">
    <c:set var="productGroup" value="" />
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
                    url:'xmlProductGroup.do?action=fetchData&rows=3&page=1&q=2&Edit=1&Del=1${productGroup}',
                    datatype: "xml",
                    colNames:['Code','product Name', 'Price', 'Spect','Spect 2','remark','Edit','Delete'],
                    colModel:[
                        {name:'productCode',index:'No', width:55},
                        {name:'productName',index:'productName', width:215},
                        {name:'price',index:'price', width:90,align:"right"},
                        {name:'Spect',index:'Spect', width:215,align:"center"},
                        {name:'Spect 2',index:'Spect 2', width:215,align:"center",hidden:true},
                        {name:'productRemarkE',index:'productRemarkE', width:185,align:"center"},		
                        {name:'Edit',index:'Edit', width:50,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductDetail.jsp?productCode="+cellvalue+"\">Edit</a>"}},
                       	{name:'Del',index:'Del', width:50,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addProductDetail.jsp?productCode="+cellvalue+"\">Del</a>"}}
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
        <select onchange="window.location='manageProductDetail.jsp?productGroup='+this.value;">
            <option value=""> ทั้งหมด </option>
            <c:forEach items="${query3.rows}" var="group">

                <option value="${group.product_group}" 
                        <c:if test="${param.productGroup == group.product_group && param.productGroup != null}">
                            selected
                        </c:if>
                        >${group.product_g_name_t}</option>

            </c:forEach>
        </select>
        <br/><br/>
        <table id="rowed1"></table>
        <br/>
        <form action="addProductDetail.jsp" >
            <div align="left"> <input type="submit" value="Add" /></div>
        </form>
        

    </center>
    <br/><br/><br/>
</body>
</html>