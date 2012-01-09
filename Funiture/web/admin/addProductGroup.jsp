
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    url:'xmlProductGroup.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','Group Code', 'Group Name Th', 'Group Name En','Remark Th','Remark En','Group Id','Company Code',],
                    colModel:[
                        {name:'No',index:'No', width:40,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'productGroupCode',index:'productGroupCode', width:80,editable:true,editoptions:{size:10}},
                        {name:'productGNameT',index:'productGNameT', width:248,editable:true,editoptions:{size:25}},
                        {name:'productGNameE',index:'productGNameE', width:248,editable:true,editoptions:{size:25}},
                        {name:'productRemarkT',index:'productRemarkT', width:125, align:"right",editable:true,editoptions:{size:25}},
                        {name:'productRemarkE',index:'productRemarkE', width:125, align:"right",editable:true,editoptions:{size:25}},
                        {name:'productGroupId',index:'productGroupId', align:"right",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'companyCode',index:'companyCode', align:"right",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:10}}
                        
                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    height:400,
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"productGroup.do"/*,
                    onSelectRow: function(ids) {
                        if(ids == null) {
                            ids=0;
                            if(jQuery("#rowed2").jqGrid('getGridParam','records') >0 )
                            {
                                jQuery("#rowed2").jqGrid('setGridParam',{url:"xmlProductGroup.do?action=fetchData&rows=1&page=1&q=2&productGroupId="+ids,page:1});
                                jQuery("#rowed2").jqGrid('setCaption',"Product Detail: "+ids)
                                .trigger('reloadGrid');
                            }
                        } else {
                            jQuery("#rowed2").jqGrid('setGridParam',{url:"xmlProductGroup.do?action=fetchData&rows=1&page=1&q=2&productGroupId="+ids,page:1});
                            jQuery("#rowed2").jqGrid('setCaption',"Product Detail: "+ids)
                            .trigger('reloadGrid');			
                        }
                    }*/
                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:230,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:230,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,editData:{action:"Del"}}, // del options
                {} // search options                
            );
                
               /* jQuery("#rowed2").jqGrid({
                    url:'xmlProductGroup.do?action=fetchData&rows=1&page=1&q=2',
                    datatype: "xml",
                    colNames:['Product Code','Name Th', 'Name En', 'Price','Remark Th','Remark En'],
                    colModel:[
                        {name:'Code',index:'Code',editoptions:"", width:100,align:"right"},
                        {name:'nameTh',index:'nameTh', width:215,align:"right"},
                        {name:'nameEn',index:'nameEn', width:215, align:"right"},
                        {name:'price',index:'price', width:60, align:"right"},		
                        {name:'remarkTh',index:'remarkTh', width:140,align:"right", sortable:false, search:false},
                        {name:'remarkEn',index:'remarkEn', width:140,align:"right", sortable:false, search:false}
                    ],
                    imgpath:'',
                    rowNum:10,
                    viewrecords: true,
                    sortorder: "asc",
                    caption:"Product Detail"
                });*/
                

            });
        </script>
    </head>
    <body >
        
        <jsp:include page="header.jsp"/>
        <br />
    <center>
        <table id="rowed1"></table>
        <div id="prowed1"></div>
        <br />
       <%-- <table id="rowed2"></table> --%>
    </center>
    <br/><br/><br/>
</body>
</html>