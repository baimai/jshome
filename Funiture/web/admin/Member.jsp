<%@ include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query1" dataSource="webdb">
    SELECT distinct(mm.member_status),(case when mm.member_status = 'N' then 'InActive'
    when mm.member_status = 'Y' then 'Active'
    when mm.member_status = 'B' then 'Ban'
    else 'InActive' end) as status FROM member_master mm;
</sql:query>
<sql:query var="query2" dataSource="webdb">
    select * from member_grade_master
</sql:query>
<c:forEach  items="${query2.rows}" var="list">
    <c:set var="listGrade" value="${listGrade}${list.member_grade_id}:${list.member_grade};" />
</c:forEach>
    <c:set var="listGrade" value="${listGrade}:Undefined" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../jshome/development-bundle/themes/base/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="../jshome/js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="../jshome/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../jshome/ui/jquery.ui.datepicker.js"></script>

        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
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
                    url:'xmlMemberMaster.do?action=fetchData&q=1',
                    datatype: "xml",
                    colNames:['Login', 'firtName', 'LastName','Status','Register','Approve','Status','Grade','Grade','memberId','viewProfile'],
                    colModel:[
                       
                        {name:'memberLogin',index:'memberLogin',align:"center", width:120,editrules:{ edithidden:false},editable:true},
                        {name:'memberName',index:'memberName',align:"center", width:130,editrules:{ edithidden:false},editable:false},
                        {name:'memberSurName',index:'memberSurName',align:"center", width:130,editrules:{ edithidden:false},editable:false},
                        {name:'memberStatus',index:'memberStatus', width:80, align:"center",editable:false,editoptions:{size:25}},
                        {name:'memberRegDate',index:'memberRegDate', width:125, align:"right",editrules:{ edithidden:false},editable:false},
                        {name:'memberAppdate',index:'memberAppdate', width:125, align:"right",editrules:{ edithidden:false},editable:false},
                        {name:'status',index:'status', width:60,hidden:true,align:"center",editrules:{ edithidden:true},editable:true,edittype:'select', editoptions:{value:{'Y':'Active','N':'InActive','B':'Ban'}}},
                        {name:'gradeName',index:'gradeName', width:60,hidden:false,align:"center",editrules:{ edithidden:false},editable:false},
                        {name:'grade',index:'grade', width:60,hidden:true,align:"center",editrules:{ edithidden:true},editable:true,edittype:'select',editoptions:{value:"${listGrade}"}},
                        {name:'memberId',index:'memberId', align:"right",hidden:true,editrules:{ edithidden:false},editable:true},
                        {name:'view',index:'view', width:100,hidden:false,align:"center",editrules:{ edithidden:false},editable:false,formatter:function(cellvalue, options, rowObject){return "<a href=\"viewProfile.jsp?memberId="+cellvalue+"\" >View</a>"}}


                    ],
                    rowNum:20,
                    rowList:[20,30,40,80,160,320,500,1000],
                    height: "auto",
                    width: 950,
                    pager: '#prowed1',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption:"สมาชิก",
                    editurl:"memberMaster.do"

                });
                jQuery("#rowed1").jqGrid('navGrid','#prowed1',
                {add:false,del:false,search:true}, //options
                {height:170,reloadAfterSubmit:true,editData:{action:"Edit"}}, // edit options
                {height:230,reloadAfterSubmit:true,editData:{action:"Add"}}, // add options
                {reloadAfterSubmit:false,editData:{action:"Del"}}, // del options
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
                                        <div class="page-title">
                                            <h1>สมาชิก</h1>
                                        </div>
                                        <center>
                                            <br/>สถานะ
                                            <select id="status" onchange="show()">
                                                <option value=""> ทั้งหมด </option>
                                                <c:forEach items="${query1.rows}" var="member">
                                                    <option value="${member.member_status}">${member.status}</option>
                                                </c:forEach>
                                            </select>
                                            <br/>
                                            <br/>วันที่
                                            <input type="text" id="datepicker" name="startDate" value="" title="startDate"class="startDate"   onchange="show();"/>
                                            <br/><br/>
                                            <table id="rowed1"></table>
                                            <div id="prowed1"></div>
                                            <br />
                                            <table id="rowed2"></table>
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
