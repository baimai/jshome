
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
                    colNames:['No','product Group', 'Group Name Th', 'Group Name En','Remark Th','Remark En','Create Date','Update Date','User'],
                    colModel:[
                        {name:'No',index:'No', width:55,editable:false,editoptions:{readonly:true,size:10}},
                        {name:'productGroup',index:'productGroup', width:80,editable:true,editoptions:{size:10}},
                        {name:'productGNameT',index:'productGNameT', width:90,editable:true,editoptions:{size:10}},
                        {name:'productGNameE',index:'productGNameE', width:90,editable:true,editoptions:{size:10}},
                        {name:'productRemarkT',index:'productRemarkT', width:125, align:"right",editable:true,editoptions:{size:25}},
                        {name:'productRemarkE',index:'productRemarkE', width:125, align:"right",editable:true,editoptions:{size:25}},		
                        {name:'createDate',index:'createDate', width:110,align:"left",editable:false},
                        {name:'updateDate',index:'updateDate',width:110,align:'left',editable:false},
                        {name:'userId',index:'userId',width:70, editable: true,editoptions:{size:10}}		
                    ],
                    rowNum:10,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Search Example",
                    editurl:"productGroup.do",
                    onSelectRow: function(ids) {
                        if(ids == null) {
                            ids=0;
                            if(jQuery("#rowed2").jqGrid('getGridParam','records') >0 )
                            {
                                jQuery("#rowed2").jqGrid('setGridParam',{url:"xmlProductGroup.do?action=fetchData&rows=1&page=1&q=2&productGroup="+ids,page:1});
                                jQuery("#rowed2").jqGrid('setCaption',"Product Detail: "+ids)
                                .trigger('reloadGrid');
                            }
                        } else {
                            jQuery("#rowed2").jqGrid('setGridParam',{url:"xmlProductGroup.do?action=fetchData&rows=1&page=1&q=2&productGroup="+ids,page:1});
                            jQuery("#rowed2").jqGrid('setCaption',"Product Detail: "+ids)
                            .trigger('reloadGrid');			
                        }
                    }
                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:true}, //options
                {height:220,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:220,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,editData:{action:"Del"}}, // del options
                {} // search options                
            );
                
                jQuery("#rowed2").jqGrid({
                    url:'xmlProductGroup.do?action=fetchData&rows=1&page=1&q=2',
                    datatype: "xml",
                    colNames:['Name','Price', 'Spect', 'Spect2','Remark'],
                    colModel:[
                        {name:'Name',index:'Name',editoptions:"", width:200/*,edittype:"image",
                            formatter:function(cellV,Option,Row){
                                return "<img src=\"jshome/images/thumb/smallpost_thumb2_1.jpg\" width=\"200\" height=\"140\" />";
                            }*/},
                        {name:'Price',index:'Price', width:50,align:"right"},
                        {name:'Spect',index:'Spect', width:220, align:"right"},
                        {name:'Spect2',index:'Spect2', width:220, align:"right"},		
                        {name:'Remark',index:'Remark', width:185,align:"right", sortable:false, search:false}
                    ],
                    imgpath:'',
                    rowNum:10,
                    viewrecords: true,
                    sortorder: "asc",
                    caption:"Product Detail"
                });
                

            });
        </script>
    </head>
    <body >

        <jsp:include page="header.jsp"/> 
    <center>
        <table id="rowed1"></table>
        <div id="prowed1"></div>
        <br />
        <table id="rowed2"></table>
    </center>
    <br/><br/><br/>
</body>
</html>