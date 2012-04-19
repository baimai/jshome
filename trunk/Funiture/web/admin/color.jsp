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
                    url:'xmlColorMaster.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['รหัสสี', 'คำอธิบาย(ไทย)', 'วันที่สร้าง','วันที่ปรับปรุง','รหัสผู้ใช้','Color Id' ],
                    colModel:[                        
                        {name:'colorCode',index:'colorCode', width:150,	editable:true,editoptions:{ size:25},editrules:{required:true}},
                        {name:'colorNameT',index:'colorNameT', width:150,editable:true,editoptions:{size:25},editrules:{required:true}},
                        {name:'createDate',index:'createDate', width:150,editable:false,editoptions:{size:25},formatter:'date', formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'updateDate',index:'updateDate', width:150,editable:false,editoptions:{size:25},formatter:'date',formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'userId',index:'userId', width:150,editable:false,editoptions:{size:25}},
                        {name:'colorId',index:'colorId',  align:"right",hidden:true,editrules:{ edithidden:false},editable:true}
                    ],
                    rowNum:20,
                    height: "auto",
                    width: 950,
                    rowList:[10,20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"สีของสินค้า",
                    editurl:"colorMaster.do"

                });
                 jQuery("#rowed1").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
               
               {add:false,edit:false,search:false,view:true },
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        stockId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'colorId');
                            return value;
                        }}}, // del options
                {} // search options
            );
            

               
                jQuery("#rowed1").jqGrid('navButtonAdd','#prowed1',{caption:"Edit",
                    onClickButton:function(){
                        var gsr = jQuery("#rowed1").jqGrid('getGridParam','selrow');
                        if(gsr){
                            jQuery("#rowed1").jqGrid('GridToForm',gsr,"#order");
                        } else {
                            alert("Please select Row")
                        }
                    }
                });
                jQuery("#savedata").click(function(){
                    var invid = jQuery("#invid").val();
                    if(invid) {
                        jQuery("#rowed1").jqGrid('FormToGrid',invid,"#order");
                    }
                });
               
                

            });
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
                                        </div>

                                        <center>
                                            <form method="post" name="Add" id="order" action="colorMaster.do" title='' style="width:350px;margin:0px;">
                                                <fieldset>
                                                    <legend>Invoice Data</legend>
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td> รหัสสี:</td>
                                                                <td><input type="text" name="colorCode"  id="invid"/></td>
                                                            </tr>
                                                            <tr>
                                                                <td> คำอธิบาย(ไทย):</td>
                                                                <td><input type="text" name="colorNameT"  /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>คำอธิบาย(อังกฤษ) :</td>
                                                                <td><input type="text" name="colorNameE"  /></td>
                                                            </tr>

                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td> <button name="action"  id="savedata" value="Add" class="button" ><span><span>เพิ่ม</span></span></button></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                            </form>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br />
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
