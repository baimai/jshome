
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
                    url:'datagrid.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','Company Code','Pic Code', 'productCode','Pic Name Th','Pic Name En', 'Remark Thai','Remark Eng'],
                    colModel:[
                        {name:'No',index:'No', width:55,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'companyCode',index:'companyCode', width:80,editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'picCode',index:'picCode', width:80,editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'productCode',index:'productCode', width:90,editable:true,editoptions:{size:10},editrules:{required:true}},
                        {name:'picNameT',index:'picNameT', width:225, align:"right",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'picNameE',index:'picNameE', width:225, align:"right",editrules:{edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkT',index:'productRemarkT', width:225, align:"right",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:25}},
                        {name:'productRemarkE',index:'productRemarkE', width:225, align:"right",hidden:true,editrules:{edithidden:true},editable:true,editoptions:{size:25}}		
                        
                        		
                    ],
                    rowNum:20,
                    height:400,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Product Setup",
                    editurl:"productSetup.do"/*,
                    onSelectRow: function(ids) {
                        if(ids == null) {
                            ids=0;
                            if(jQuery("#rowed2").jqGrid('getGridParam','records') >0 )
                            {
                                jQuery("#rowed2").jqGrid('setGridParam',{url:"datagrid.do?action=fetchData&rows=1&page=1&q=2&productCode="+ids,page:1});
                                jQuery("#rowed2").jqGrid('setCaption',"Product Detail: "+ids)
                                .trigger('reloadGrid');
                            }
                        } else {
                            jQuery("#rowed2").jqGrid('setGridParam',{url:"datagrid.do?action=fetchData&rows=1&page=1&q=2&productCode="+ids,page:1});
                            jQuery("#rowed2").jqGrid('setCaption',"Product Detail: "+ids)
                            .trigger('reloadGrid');			
                        }
                    }*/
                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:250,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:250,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,editData:{action:"Del"}}, // del options
                {} // search options                
            );
                
               /* jQuery("#rowed2").jqGrid({
                    height: 100,
                    url:'datagrid.do?action=fetchData&rows=1&page=1&q=2',
                    datatype: "xml",
                    colNames:['Name','Price', 'Spect', 'Spect2','Remark'],
                    colModel:[
                        {name:'Name',index:'Name',editoptions:"", width:200},
                        {name:'Price',index:'Price', width:50,align:"right"},
                        {name:'Spect',index:'Spect', width:220, align:"right"},
                        {name:'Spect2',index:'Spect2', width:220, align:"right"},		
                        {name:'Remark',index:'Remark', width:185,align:"right", sortable:false, search:false}
                    ],
                    imgpath:'',
                    height:50,
                    rowNum:1,
                    viewrecords: true,
                    sortorder: "asc",
                    caption:"Product Detail"
                }); */
                

            });
        </script>
    </head>
    <body>
        
        <jsp:include page="header.jsp"/>
        <br/>
    <center>
        <table id="rowed1"></table>
        <div id="prowed1"></div>
        <br />
      <%--  <table id="rowed2"></table> --%>
    </center>
</body>
</html>