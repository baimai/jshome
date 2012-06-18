<%-- 
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
             function remove(colorId){
                var param = "colorId="+colorId+"&action=Del";
                postDataReturnText("colorMaster.do",param,test);
                window.location.href='color.jsp';
                //
            }
            function test(text){
            }
            function confirmDelete(id) {
                if (confirm("คุณต้องการลบหรือไม่ !")) {
                    remove(id);
                }
            }

            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlColorMaster.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['รหัสสี', 'คำอธิบาย(ไทย)', 'วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','Color Id'/*Edit','Del*/ ],
                    colModel:[                        
                        {name:'colorCode',index:'colorCode', width:150,	editable:true,editoptions:{ size:25},editrules:{required:true}},
                        {name:'colorNameT',index:'colorNameT', width:150,editable:true,editoptions:{size:25},editrules:{required:true}},
                        {name:'createDate',index:'createDate', width:150,editable:false,editoptions:{size:25},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"},searchoptions:{dataInit:function(el){$(el).datepicker({dateFormat:'dd/mm/yy'});} }},
                        {name:'updateDate',index:'updateDate', width:150,editable:false,editoptions:{size:25},formatter:'date',formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"},searchoptions:{dataInit:function(el){$(el).datepicker({dateFormat:'dd/mm/yy'});} }},
                        {name:'userId',index:'userId', width:150,editable:false,editoptions:{size:25}},
                        {name:'colorId',index:'colorId',  align:"right",hidden:true,editrules:{ edithidden:false},editable:true}
                       // {name:'Edit',index:'Edit', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"addColor.jsp?colorId="+cellvalue+"\"><img src=\"../images/icon/edit-icon.png\" width=\"16\" height=\"16\"/></a>"}},
                      //  {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}}
                    
                  ],
		   	postData: {},
			rowNum:10,
		   	rowList:[10,20,40,60],
		   	height: 240,
		   	autowidth: true,
			rownumbers: true,
		   	pager: '#prowed1',
		   	sortname: 'id',
		    viewrecords: true,
		    sortorder: "asc",
		    caption:"Records",
		    emptyrecords: "Empty records",
		    loadonce: false,
		    loadComplete: function() {},
		    jsonReader : {
		        root: "rows",
		        page: "page",
		        total: "total",
		        records: "records",
		        repeatitems: false,
		        cell: "cell",
		        id: "id",
                         editurl:"colorMaster.do"
		    }

		});

		$("#rowed1").jqGrid('navGrid','#prowed1',
				{edit:false, add:false, del:false, search:true},
				{}, {}, {},
				{ 	// search
					sopt:['cn', 'eq', 'ne', 'lt', 'gt', 'bw', 'ew'],
					closeOnEscape: true,
					multipleSearch: true,
					closeAfterSearch: true
				}
		);

		$("#rowed1").navButtonAdd('#prowed1',
				{ 	caption:"Add",
					buttonicon:"ui-icon-plus",
					onClickButton: addRow,
					position: "last",
					title:"",
					cursor: "pointer"
				}
		);

		$("#rowed1").navButtonAdd('#prowed1',
				{ 	caption:"Edit",
					buttonicon:"ui-icon-pencil",
					onClickButton: editRow,
					position: "last",
					title:"",
					cursor: "pointer"
				}
		);

		$("#rowed1").navButtonAdd('#prowed1',
			{ 	caption:"Delete",
				buttonicon:"ui-icon-trash",
				onClickButton: deleteRow,
				position: "last",
				title:"",
				cursor: "pointer"
			}
		);

		// Toolbar Search
		$("#rowed1").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : true, defaultSearch:"cn"});
	});

	function addRow() {
   		$("#rowed1").jqGrid('setColProp', 'colorCode', {editoptions:{readonly:false, size:10}});
   		$("#rowed1").jqGrid('setColProp', 'colorNameT', {hidden: false});
   		$("#rowed1").jqGrid('setColProp', 'colorNameT', {editrules:{required:true}});

		// Get the currently selected row
		$('#rowed1').jqGrid('editGridRow','new',
	    		{ 	url: '${colorMaster.do?action:"Add"}',
					editData: {},
	                serializeEditData: function(data){
	                    data.id = 0;
	                    return $.param(data);
	                },
				    recreateForm: true,
				    beforeShowForm: function(form) {
			            $('#pData').hide();
			            $('#nData').hide();
			            $('#password',form).addClass('ui-widget-content').addClass('ui-corner-all');
				    },
					beforeInitData: function(form) {},
					closeAfterAdd: true,
					reloadAfterSubmit:true,
					afterSubmit : function(response, postdata)
					{
				        var result = eval('(' + response.responseText + ')');
						var errors = "";

				        if (result.success == false) {
							for (var i = 0; i < result.message.length; i++) {
								errors +=  result.message[i] + "<br/>";
							}
				        }  else {
				        	$('#msgbox').text('Entry has been added successfully');
							$('#msgbox').dialog(
									{	title: 'Success',
										modal: true,
										buttons: {"Ok": function()  {
											$(this).dialog("close");}
										}
									});
		                }
				    	// only used for adding new records
				    	var newId = null;

						return [result.success, errors, newId];
					}
	    		});

   		$("#rowed1").jqGrid('setColProp', 'colorNameT', {hidden: true});
	} // end of addRow


	function editRow() {
   		$("#rowed1").jqGrid('setColProp', 'username', {editoptions:{readonly:true, size:10}});
   		$("#rowed1").jqGrid('setColProp', 'colorNameT', {hidden: true});
   		$("#rowed1").jqGrid('setColProp', 'colorNameT', {editrules:{required:false}});

		// Get the currently selected row
		var row = $('#rowed1').jqGrid('getGridParam','selrow');

		if( row != null ) {

			$('#rowed1').jqGrid('editGridRow', row,
				{	url: '${colorMaster.do?action:"Edit"}',
					editData: {},
			        recreateForm: true,
			        beforeShowForm: function(form) {
			            $('#pData').hide();
			            $('#nData').hide();
			        },
					beforeInitData: function(form) {},
					closeAfterEdit: true,
					reloadAfterSubmit:true,
					afterSubmit : function(response, postdata)
					{
			            var result = eval('(' + response.responseText + ')');
						var errors = "";

			            if (result.success == false) {
							for (var i = 0; i < result.message.length; i++) {
								errors +=  result.message[i] + "<br/>";
							}
			            }  else {
			            	$('#msgbox').text('Entry has been edited successfully');
							$('#msgbox').dialog(
									{	title: 'Success',
										modal: true,
										buttons: {"Ok": function()  {
											$(this).dialog("close");}
										}
									});
		                }
				    	// only used for adding new records
				    	var newId = null;

						return [result.success, errors, newId];
					}
				});
		} else {
			$('#msgbox').text('You must select a record first!');
			$('#msgbox').dialog(
					{	title: 'Error',
						modal: true,
						buttons: {"Ok": function()  {
							$(this).dialog("close");}
						}
					});
		}
	}

	function deleteRow(obj, args) {
		// Get the currently selected row
	    var row = $('#rowed1').jqGrid('getGridParam','selrow');

	    // A pop-up dialog will appear to confirm the selected action
		if( row != null )
			$('#rowed1').jqGrid( 'delGridRow', row,
	          	{	url:'${deleteUrl}',
					recreateForm: true,
				    beforeShowForm: function(form) {
				    	//Change title
				        $(".delmsg").replaceWith('<span style="white-space: pre;">' +
				        		'Delete selected record?' + '</span>');
		            	//hide arrows
				        $('#pData').hide();
				        $('#nData').hide();
				    },
	          		reloadAfterSubmit:true,
	          		closeAfterDelete: true,
	          		serializeDelData: function (postdata) {
		          	      var rowdata = $('#rowed1').getRowData(postdata.id);
		          	      // append postdata with any information
		          	      return {id: postdata.id, oper: postdata.oper, username: rowdata.username};
		          	},
	          		afterSubmit : function(response, postdata)
					{
			            var result = eval('(' + response.responseText + ')');
						var errors = "";

			            if (result.success == false) {
							for (var i = 0; i < result.message.length; i++) {
								errors +=  result.message[i] + "<br/>";
							}
			            }  else {
			            	$('#msgbox').text('Entry has been deleted successfully');
							$('#msgbox').dialog(
									{	title: 'Success',
										modal: true,
										buttons: {"Ok": function()  {
											$(this).dialog("close");}
										}
									});
		                }
				    	// only used for adding new records
				    	var newId = null;

						return [result.success, errors, newId];
					}
	          	});
		else {
			$('#msgbox').text('You must select a record first!');
			$('#msgbox').dialog(
					{	title: 'Error',
						modal: true,
						buttons: {"Ok": function()  {
							$(this).dialog("close");}
						}
					});
		}
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
                    <br><br> <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>ข้อมูลสีสินค้า</h1>
                                            <button name="action" value="Add" class="button" onclick="window.location.href='addColor.jsp'"><span><span>เพิ่ม</span></span></button>
                                        </div>

                                        <center>
                                            <div id='jqgrid'>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            
                                            </div>
                                            <div id='msgbox' title='' style='display:none'></div>
                                        </center>
                                        <br/><br/> </div>
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
