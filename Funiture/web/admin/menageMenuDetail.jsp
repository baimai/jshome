<%--
    Document   : jshome_MenegeMenuDetail
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
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

<c:set var="listGroup" value="" />

<c:forEach  items="${query3.rows}" var="list">
    <c:set var="listGroup" value="${listGroup}${list.menu_group_id}:${list.menu_g_name_e};" />
</c:forEach>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=2',
                    datatype: "xml",
                    colNames:['NO', 'Group Name','Menu Name T', 'Menu Name En','Pic Code','Seq No.','Show List','Menu Code Id','Remark Th','Remark En'],
                    colModel:[
                        {name:'No',index:'menuSeq',editoptions:"", width:60,align:"right"},
                        {name:'menuGNameE',index:'menuGNameE', width:150,align:"center",editable:true,editoptions:{size:25}},
                        {name:'menuCNameT',index:'menuCNameT', width:150,align:"center",editable:true,editoptions:{size:25}},
                        {name:'menuCNameE',index:'menuCNameE', width:150, align:"center",editable:true,editoptions:{size:25}},
                        {name:'picCode',index:'picCode', width:100, align:"center",editable:true,editoptions:{size:10}},
                        {name:'menuSeq',index:'menuSeq', width:100, align:"center",editable:true,editoptions:{size:10}},
                        {name:'showListSts',index:'showListSts', width:100, align:"center",editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'Y':'Show','N':'Hidden'}}},
                        {name:'menuCodeId',index:'menuCodeId', width:100, align:"center",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'menuCRemarkT',index:'menuCRemarkT', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'menuCRemarkE',index:'menuCRemarkE', width:100, align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}}
                        
                    ],
                    height:200,
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Product Group",
                    pager: '#prowed1',
                    editurl:"menuGroupMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:320,width:320,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:320,width:320,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        menuGroupId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'menuGroupId');
                            return value;
                        }}}, // del options
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
                    <br><br><br>
                    <center>
                        <br/>
                        <table id="rowed1"></table>
                        <div id="prowed1"></div>
                        <br/>
                    </center>
                    <br/><br/><br/>
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
