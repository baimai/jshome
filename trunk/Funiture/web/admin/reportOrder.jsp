<%--
    Document   : jshome_ReportOrder
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query1" dataSource="webdb">
    SELECT * from member_grade_master where company_id =1
</sql:query>

<sql:query var="query2" dataSource="webdb">
    SELECT * from product_group_master where company_id =1
</sql:query>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="development-bundle/themes/base/ui.all.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.multiselect.css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
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
            function show(){
                var param = "xmlReport.do?action=fetchData"+
                    "&orderDate1="+splitDate(document.getElementById('datepicker').value)+
                    "&orderDate2="+splitDate(document.getElementById('datepicker2').value)+
                    "&memberGradeId="+document.getElementById('memberGradeId').value+
                    "&productGroupId="+document.getElementById('productGroupId').value
                jQuery("#rowed1").jqGrid('setGridParam',{url:param});
                jQuery("#rowed1").trigger('reloadGrid');
            }
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlReport.do?action=fetchData',
                    datatype: "xml",
                    colNames:['เวลาทำรายการ','Order Id','Total'],
                    colModel:[
                        {name:'orderDate',index:'orderDate', width:150, align:"center", sorttype:'date', formatter:'datetime', datefmt:'d/m/Y H:i'},
                        {name:'orderId',index:'orderId',editoptions:"", width:170,align:"center", sorttype:'int',summaryType:'count', summaryTpl : '({0}) total'},
                        {name:'total',index:'total', width:200,align:"right",sorttype:'number',formatter:'number', summaryType:'sum'}
                        
                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    pager: '#prowed1',
                    height: "auto",
                    width: 930,
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"Order Detail",
                    footerrow: true,
                    userDataOnFooter: true
                    // editurl:"colorMaster.do"

                });
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $("#datepicker").datepicker();
                $("#datepicker2").datepicker();
                // $.datepicker.formatDate('yyyy-mm-dd');

            });
            function splitDate(date){
                var t = date.split("/");  //ถ้าเจอวรรคแตกเก็บลง array t
                return t[2]+"-"+t[0]+"-"+t[1];
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
                    <br><br>
                    <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>รายงานสั่งซื้อ : </h1></div>
                                        <center>
                                            <table cellspacing="10">

                                                <tbody>
                                                    <tr>
                                                        <td>จากวันที่ :&nbsp;</td>
                                                        <td> <input type="text" id="datepicker" name="receiveDate" value="" title="receiveDate"class="startDate"   />&nbsp;&nbsp;</td>
                                                        <td>ถึงวันที่ :&nbsp;</td>
                                                        <td> <input type="text" id="datepicker2" name="receiveDate" value="" title="receiveDate"class="startDate"   /></td>
                                                    </tr>
                                                    <tr><td>ประเภทลูกค้า :&nbsp;</td>
                                                        <td><select name="ทั้งหมด" id="memberGradeId" style=" width: 120px">
                                                                <option value="0"> ทุกประเภท </option>
                                                                <c:forEach var="grade" items="${query1.rows}">
                                                                    <option value="${grade.member_grade_id}">${grade.grade_name_t}</option>
                                                                </c:forEach>
                                                            </select><td>

                                                    </tr>
                                                    <tr>
                                                        <td>ประเภทสินค้า :&nbsp;</td>
                                                        <td><select name="ทั้งหมด" id="productGroupId" style=" width: 120px">
                                                                <option value="0"> ทุกประเภท </option>
                                                                <c:forEach var="group" items="${query2.rows}">
                                                                    <option value="${group.product_group_id}">${group.product_g_name_t}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table><br>
                                            <a href="#" onclick="show();">ค้นหา</a>
                                            <center>
                                                <img src="images/line.jpg" width="930" height="" alt=""/>
                                            </center>
                                            <br>
                                            <table id="rowed1"></table>
                                            <br>

                                            <div id="prowed1"></div>
                                        </center>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                    </div>
                                </div>
                            </div> </div>
                    </div>
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
