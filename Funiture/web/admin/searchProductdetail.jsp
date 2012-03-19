<%--
    Document   : mastercollor
    Created on : Dec 27, 2011, 2:37:34 PM
    Author     : Baimai
--%>
<%@ include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>stock Master</title>
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
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
        <script  type="text/javascript">
            jQuery(document).ready(function(){
                jQuery("#toolbar").jqGrid({
                    url:'xmlProductGroup.do?action=fetchData&q=4&Edit=1&Del=1',
                    datatype: "xml",
                    colNames:['รหัสสินค้า', 'ชื่อสินค้า T','ประเภท','คุณลักษณะ','คุณลักษณะ2','โครงสร้าง','โครงสร้าง2','ขนาด','สี','stockId' ],
                    colModel:[
                       
                        {name:'productCode',index:'productCode',editoptions:"", width:100,align:"right",formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"document.getElementById('productCode').value ='"+cellvalue+"'; \" >"+cellvalue+"</a>"}},
                        {name:'nameTh',index:'nameTh', width:100,align:"right"},
                        {name:'productGNameT',index:'productGNameT', width:100, align:"right"},
                        {name:'productSpect1_T',index:'productSpect1_T', width:100, align:"right"},
                        {name:'productSpect2_T',index:'productSpect2_T', width:100, align:"right"},
                        {name:'productSpect3_T',index:'productSpect3_T', width:100, align:"right"},
                        {name:'productSpect4_T',index:'productSpect4_T', width:100, align:"right"},
                        {name:'productSpect5_T',index:'productSpect5_T', width:100, align:"right"},
                        {name:'productSpect6_T',index:'productSpect6_T', width:100, align:"right"},
                        {name:'productDetailId',index:'productDetailId',  align:"right",hidden:true,editrules:{ edithidden:true},editable:false}


                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    loadonce:true,
                    pager: '#ptoolbar',
                    height: "auto",
                    width: 950,
                    sortname: 'id',
                    rownumbers: true,
                    rownumWidth: 40,
                    gridview: true,
   	            viewrecords: true,
                    sortorder: "asc",
                    caption: "Toolbar Searching"

                });

               jQuery("#toolbar").jqGrid('navGrid','#ptoolbar',{del:false,add:false,edit:false,search:false,view:true });
              jQuery("#toolbar").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});




            });
             
        </script>
    </head>
    <body >
        <table id="toolbar"></table>
          <div id="ptoolbar"></div>                                  
              
    </body>
</html>
