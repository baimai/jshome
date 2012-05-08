<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script  type="text/javascript">
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=1',
                    datatype: "xml",
                    colNames:['No','Menu Name TH', 'Menu Name En', 'Permission','showList','LoginSts','menuGRemarkT','menuGRemarkE','menuGroupId','menuGIconLog' ],
                    colModel:[
                        {name:'No',index:'No', width:50,align:"right",editable:false,editoptions:{readonly:true,size:10},search:false},
                        {name:'menuGNameT',index:'menuGNameT', width:200,editable:true,editoptions:{size:25}},
                        {name:'menuGNameE',index:'menuGNameE', width:200,editable:true,editoptions:{size:25}},
                        {name:'menuPermission',index:'menuPermission',align:"center", width:90,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'A':'Admin','U':'User','C':'Contact','M':'Member'}}},
                        {name:'showListMenu',index:'showListMenu',align:"center",width:80,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'F':'F','Y':'Y','N':'N'}}},
                        {name:'chkLoginSts',index:'chkLoginSts',align:"center",width:80,editable:true,editoptions:{size:25},edittype:'select', editoptions:{value:{'F':'F','Y':'Y','N':'N'}}},
                        {name:'menuGRemarkT',index:'menuGRemarkT',align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}},
                        {name:'menuGRemarkE',index:'menuGRemarkE',align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}},
                        {name:'menuGroupId',index:'menuGroupId',  align:"right",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'menuGIconLog',index:'menuGIconLog', align:"center",hidden:true,editrules:{ edithidden:true},editable:true,editoptions:{size:50}}
                    ]
                    ,
                    rowNum:20,
                    height: "auto",
                    width: 950,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"เมนูหลัก",
                    editurl:"menuGroupMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {search:false}, //options
                {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:300,width:460,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
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
            function addRow() {

                // Get the currently selected row
                jq("#rowed1").jqGrid('editGridRow','Add',
                {  url: "xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=1",
                    editData: {
                    },
                    recreateForm: true,
                    beforeShowForm: function(form) {
                    },
                    closeAfterAdd: true,
                    reloadAfterSubmit:false,
                    afterSubmit : function(response, postdata)
                    {
                        var result = eval('(' + response.responseText + ')');
                        var errors = "";

                        if (result.success == false) {
                            for (var i = 0; i < result.message.length; i++) {
                                errors +=  result.message[i] + "";
                            }
                        }  else {
                            jq("#dialog").text('Entry has been added successfully');
                            jq("#dialog").dialog(
                            { title: 'Success',
                                modal: true,
                                buttons: {"Ok": function()  {
                                        jq(this).dialog("close");}
                                }
                            });
                        }
                        // only used for adding new records
                        var new_id = null;

                        return [result.success, errors, new_id];
                    }
                });

            }

            function editRow() {
                // Get the currently selected row
                var row = jq("#rowed1").jqGrid('getGridParam','selrow');

                if( row != null )
                    jq("#grid").jqGrid('editGridRow',row,
                { url: "/spring-jqgrid-integration/krams/crud/edit",
                    editData: {
                    },
                    recreateForm: true,
                    beforeShowForm: function(form) {
                    },
                    closeAfterEdit: true,
                    reloadAfterSubmit:false,
                    afterSubmit : function(response, postdata)
                    {
                        var result = eval('(' + response.responseText + ')');
                        var errors = "";

                        if (result.success == false) {
                            for (var i = 0; i < result.message.length; i++) {
                                errors +=  result.message[i] + "        ";
                            }
                        }  else {
                            jq("#dialog").text('Entry has been edited successfully');
                            jq("#dialog").dialog(
                            { title: 'Success',
                                modal: true,
                                buttons: {"Ok": function()  {
                                        jq(this).dialog("close");}
                                }
                            });
                        }

                        return [result.success, errors, null];
                    }
                });
                else jq( "#dialogSelectRow" ).dialog();
            }

            function deleteRow() {
                // Get the currently selected row
                var row = jq("#grid").jqGrid('getGridParam','selrow');

                // A pop-up dialog will appear to confirm the selected action
                if( row != null )
                    jq("#rowed1").jqGrid( 'delGridRow', row,
                { url: 'xmlMenuGroupMaster.do?action=fetchData&rows=3&page=1&q=1',
                    recreateForm: true,
                    beforeShowForm: function(form) {
                        //change title
                        jq(".delmsg").replaceWith('<span style="white-space: pre;">' +
                            'Delete selected record?' + '</span>');

                        //hide arrows
                        jq('#pData').hide();
                        jq('#nData').hide();
                    },
                    reloadAfterSubmit:false,
                    closeAfterDelete: true,
                    afterSubmit : function(response, postdata)
                    {
                        var result = eval('(' + response.responseText + ')');
                        var errors = "";

                        if (result.success == false) {
                            for (var i = 0; i < result.message.length; i++) {
                                errors +=  result.message[i] + "";
                            }
                        }  else {
                            jq("#dialog").text('Entry has been deleted successfully');
                            jq("#dialog").dialog(
                            { title: 'Success',
                                modal: true,
                                buttons: {"Ok": function()  {
                                        jq(this).dialog("close");}
                                }
                            });
                        }
                        // only used for adding new records
                        var new_id = null;

                        return [result.success, errors, new_id];
                    }
                });
                else jq( "#dialogSelectRow" ).dialog();
            }
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
                    <br><br>  <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>เมนูหลัก</h1>
                                        </div>
                                        <center>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br />

                                        </center>
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
