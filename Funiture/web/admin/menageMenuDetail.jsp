<%-- 
    Document   : menageMenuDetail
    Created on : Jan 4, 2012, 3:49:26 PM
    Author     : Baimai
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${param.menuGroupId != null || param.menuGroupId != ''}">
    <c:set var="menuGroupId" value="&menuGroupId=${param.menuGroupId}" />
</c:if>
<c:if test="${param.menuGroupId == null || param.menuGroupId == ''}">
    <c:set var="menuGroupId" value="" />
</c:if>
<sql:query var="query3" dataSource="webdb">
    SELECT * FROM menu_group_master
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
                    url:'xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=2&Edit=1&Del=1${menuGroupId}',
                    datatype: "xml",
                    colNames:['NO', 'Name T', 'Name En','Edit','Delete'],
                    colModel:[
                        {name:'menuSeq',index:'menuSeq',editoptions:"", width:100,align:"right"},
                        {name:'menuCNameT',index:'menuCNameT', width:215,align:"right"},
                        {name:'menuCNameE',index:'menuCNameE', width:215, align:"right"},
                       
                        {name:'Edit',index:'Edit', width:50,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"menuDetailMaster.jsp?menuGroupId="+cellvalue+"\">Edit</a>"}},
                       	{name:'Del',index:'Del', width:50,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"menuDetailMaster.do?pmenuGroupId="+cellvalue+"&action=Del\">Del</a>"}}
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
        <select onchange="window.location='manageMenuDetail.jsp?menuGroupId='+this.value;">
            <option value=""> ทั้งหมด </option>
            <c:forEach items="${query3.rows}" var="group">

                <option value="${group.Menu_Group_Id}"
                        <c:if test="${param.menuGroupId == group.Menu_Group_Id && param.menuGroupId != null}">
                            selected
                        </c:if>
                        >${group.menu_g_name_t}</option>

            </c:forEach>
        </select>
        <br/><br/>
        <table id="rowed1"></table>
        <br/>
        <form action="menuDetailMaster.jsp" >
            <input type="hidden" name="menuGroupId" value="${param.menuGroupId}" />
            <div align="left"> <input type="submit" value="Add" /></div>
        </form>


    </center>
    <br/><br/><br/>
    </body>
</html>
