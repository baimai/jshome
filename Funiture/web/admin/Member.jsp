<%--
    Document   : jshome_Member
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query1" dataSource="webdb">
    SELECT distinct(mm.member_status),(case when mm.member_status = 'N' then 'สมาชิกใหม่'
    when mm.member_status = 'Y' then 'สมาชิกใช้งาน'
    when mm.member_status = 'B' then 'สมาชิกหยุดใช้งาน'
    else 'InActive' end) as status FROM member_master mm;
</sql:query>

<sql:query var="query2" dataSource="webdb">
    select * from member_grade_master
</sql:query>

<c:forEach  items="${query2.rows}" var="list">
    <c:set var="listGradeName" value="${listGradeName}${list.member_grade_id}:${list.grade_name_t};" />
</c:forEach>

<c:set var="listGradeName" value="${listGradeName}:Undefined" />

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
        <script  type="text/javascript">
            jQuery(document).ready(function(){
                jQuery("#rowed1").jqGrid({
                    url:'xmlMemberMaster.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['รหัสเข้าระบบ','ชื่อบริษัท','ชื่อย่อบริษัท','ชื่อ', 'นามสกุล','สถานะสมาชิก','วันที่ลงทะเบียน','ที่อยู่1','ที่อยู่2','ตำบล','วันที่อนุมัติเข้าใช้งาน','สถานะสมาชิก','ชื่อเกรด T','รหัสเกรด','memberId','view','ลบ'],
                    colModel:[
                        {name:'memberLogin',index:'memberLogin',align:"center", width:150,viewable:false,editrules:{edithidden:true},editable:true,editoptions: { readonly: true }},
                        {name:'memberCompany',index:'memberCompany',align:"center", width:140,editable:false,editoptions:{size:20}, formoptions:{ rowpos:3,elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberNameAbbr',index:'memberNameAbbr',align:"center", width:140,hidden:true,editrules:{ edithidden:true},editoptions:{size:20}, formoptions:{ rowpos:4,elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberName',index:'memberName',align:"center", width:125,editrules:{ edithidden:false},editable:false,formoptions:{ rowpos:1, elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberSurName',index:'memberSurName',align:"center", width:125,editrules:{ edithidden:true},editable:false, formoptions:{ rowpos:2,elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberStatus',index:'memberStatus', width:120, align:"center",viewable:false,editable:false,editoptions:{size:25}},
                        {name:'memberRegDate',index:'memberRegDate', width:120, align:"right",viewable:false,editrules:{ edithidden:false},editable:false,formatter:'date',formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'memberAddr1',index:'memberAddr1', width:125, align:"center",hidden:true,editrules:{ edithidden:true},editable:false,formoptions:{ rowpos:5,elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberAddr2',index:'memberAddr2', width:125, align:"center",hidden:true,editrules:{ edithidden:true},editable:false,formoptions:{ rowpos:6,elmprefix:"&nbsp;&nbsp;&nbsp;&nbsp;"}},
                        {name:'memberDistinct',index:'memberDistinct',width:125, align:"center",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'memberAppdate',index:'memberAppdate', width:160, align:"right",viewable:false,editrules:{ edithidden:false},editable:false,formatter:'date',formatoptions:{srcformat:"Y-m-d",newformat:"d/m/Y"}},
                        {name:'status',index:'status', width:60,hidden:true,align:"center",editrules:{ edithidden:true},editable:true,edittype:'select', editoptions:{value:{'Y':'สมาชิกใช้งาน','N':'สมาชิกใหม่','B':'สมาชิกหยุดใช้งาน'}}},
                        {name:'gradeName',index:'gradeName', width:110,align:"center",editrules:{ edithidden:true},editable:true,edittype:'select',editoptions:{value:"${listGradeName}"}},
                        {name:'gradeName',index:'gradeName', width:60,align:"center",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'memberId',index:'memberId', align:"right",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'view',index:'view', width:100,hidden:false,align:"center",viewable:false,editrules:{ edithidden:false},editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"viewProfile.jsp?memberId="+cellvalue+"\" >view</a>"}},
                        {name:'Del',index:'Del', width:70,align:"center",editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"#\" onclick=\"confirmDelete("+cellvalue+")\"><img src=\"../images/icon/del-icon.png\" width=\"16\" height=\"16\"/></a>"}}
                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    height: "auto",
                    width: 930,
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"สมาชิก",
                    editurl:"memberMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {add:false,del:true,search:true,view:false}, //options
                {height:180,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:230,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:true,
                    delData:{action:"Del",
                        memberId:function() {
                            var sel_id = jQuery("#rowed1").jqGrid('getGridParam', 'selrow');
                            var value = jQuery("#rowed1").jqGrid('getCell', sel_id, 'memberId');
                            return value;
                        }}}, // del options
                {} // search options
            );
            });
            function show(){
                if(document.getElementById('status').value==''&&document.getElementById('datepicker').value==''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlMemberMaster.do?action=fetchData&q=1"});
                }else if(document.getElementById('status').value!=''&&document.getElementById('datepicker').value==''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlMemberMaster.do?action=fetchData&q=1&memberStatus="+document.getElementById('status').value});
                }else if(document.getElementById('status').value==''&&document.getElementById('datepicker').value!=''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlMemberMaster.do?action=fetchData&q=1&memberDate="+splitDate(document.getElementById('datepicker').value)});
                }else if(document.getElementById('status').value!=''&&document.getElementById('datepicker').value!=''){
                    jQuery("#rowed1").jqGrid('setGridParam',{url:"xmlMemberMaster.do?action=fetchData&q=1&memberStatus="+document.getElementById('status').value+"&memberDate="+splitDate(document.getElementById('datepicker').value)});
                }
                jQuery("#rowed1").trigger('reloadGrid');
            }

        </script>
        <script type="text/javascript">

            $(function() {
                $("#datepicker").datepicker();
            });

            function splitDate(date){
                var t = date.split("/");  //ถ้าเจอวรรคแตกเก็บลง array t
                return t[2]+"-"+t[0]+"-"+t[1];
            }

        </script>
        <title>JSP Page</title>
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

                                           
                                                <table class="tableContent1" border="0" cellspacing="0" cellpadding="0" align="" width="60%" >
                                                    <tr >
                                                        <td style="float: right">
                                                            สถานะ :&nbsp;
                                                        </td>
                                                        <td style="width: 100px">
                                                            <select id="status" onchange="show()">
                                                                <option value=""> ทั้งหมด </option>
                                                                <option value="N"> สมาชิกใหม่ </option>
                                                                <option value="Y"> สมาชิกใช้งาน </option>
                                                                <option value="B"> สมาชิกหยุดใช้งาน </option>
                                                                <c:forEach items="${query1.rows}" var="member">
                                                                    <option value="${member.member_status}">${member.status}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr >
                                                        <td style="float: right">
                                                            วันที่สมัคร :&nbsp;
                                                        </td>
                                                        <td style="width: 100px">
                                                            <input type="text" id="datepicker" name="startDate" value="" title="startDate"class="startDate" onchange="show();"/>
                                                        </td>
                                                    </tr>
                                                    <br>
                                                    <br>
                                                </table>
                                               
                                       
                                        <br>
                                        <center>
                                            <img src="images/line.jpg" width="930" height="" alt=""/>
                                            <br><br>
                                        </center>
                                        <center>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                        </center>
                                        <br>
                                        <br>
                                        <br>
                                        <br> 
                                         </div>
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
        <jsp:include page="footer.jsp" />
        <br/><br/>
    </body>
</html>
