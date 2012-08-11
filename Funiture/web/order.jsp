<%--
    Document   : jshome_Order
    Created on : 8 ส.ค. 2555, 13:56
    Author     : Sarawut
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query2" dataSource="webdb">
    select * from member_master mm
    join company_master cm on cm.company_id = mm.company_id
    where mm.member_Id = ${sessionScope.loginDetail.memberId}
</sql:query>

<sql:query var="query" dataSource="webdb">
    select * from common_province where level_=1
</sql:query>

<!DOCTYPE html>
<html >

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/prototype/prototype.js"></script>
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
        <script type="text/javascript" src="js/varien/form.js"></script>
        <script type="text/javascript" src="js/varien/js.js"></script>
        <script type="text/javascript" src="js/prototype/validation.js"></script>
        <script type="text/javascript" src="js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="js/scriptaculous/controls.js"></script>
        <script type="text/javascript">

            function changeCommonProvince(level,id){
                var param = "level="+level+"&id="+id;
                if(level==2){
                    postDataReturnText("dynamicProvince.do",param,showAmphur);
                    var param2 =  "level="+(level+1)+"&id="+id+"&complex="+"true";
                    postDataReturnText("dynamicProvince.do",param2,showDistinct);
                }else if(level==3){
                    postDataReturnText("dynamicProvince.do",param,showDistinct);
                }
            }
            function showAmphur(text){
                document.getElementById("showAmphur").innerHTML=text;
            }
            function showDistinct(text){
                document.getElementById("showDistinct").innerHTML=text;
            }

            function searchOrder(){
                var day = document.getElementById("day").value ;
                var month = document.getElementById("month").value ;
                var year = document.getElementById("year").value ;
                var param = "date="+year+"-"+month+"-"+day;
                postDataReturnText("listOrder.jsp",param,showOrder);
            }
            function showOrder(text){
                document.getElementById("searchOrder").innerHTML=text;
            }
        </script>

        <script type="text/javascript">
            $(function() {
                $("#tabs").tabs();
            });
        </script>

        <style type="text/css">
            body
            {
                line-height: 1.6em;
            }

            #box-table-a
            {

                font-size: 12px;
                margin: 45px;
                width: 870px;
                text-align: left;
                border-collapse: collapse;
            }
            #box-table-a th
            {
                font-size: 13px;
                font-weight: normal;
                padding: 8px;
                background: #b9c9fe;
                border-top: 4px solid #aabcfe;
                border-bottom: 1px solid #fff;
                color: #039;
            }
            #box-table-a td
            {
                padding: 8px;
                background: #e8edff;
                border-bottom: 1px solid #fff;
                color: #669;
                border-top: 1px solid transparent;
            }
            #box-table-a tr:hover td
            {
                background: #d0dafd;
                color: #339;
            }
        </style>

    </head>

    <body class=" customer-account-create" >
        <div id="art-main">
            <div class="art-sheet">
                <div class="art-sheet-bl"></div>
                <div class="art-sheet-br"></div>
                <div class="art-sheet-bc"></div>
                <div class="art-sheet-cl"></div>
                <div class="art-sheet-cr"></div>
                <div class="art-sheet-cc"></div>
                <div class="art-sheet-body">
                    <jsp:include page="head.jsp"/><br/>
                    <c:forEach items="${query2.rows}" var="member" >
                        <script type="text/javascript">
                            changeCommonProvince(2,${member.member_province});
                            changeCommonProvince(3,${member.member_amphur});
                        </script>
                        <br>
                        <div class="wrapper">
                            <div class="page"></div>
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>รายการสั่งซื้อ</h1>
                                        </div>
                                        <form action="" method="" id="">
                                            <div class="col2-set">
                                                <div class="col-1 new-users">
                                                    <div class="content">
                                                        <form action="editProfile.do" method="post" id="form-validate" >
                                                            <div style="text-align: center;">
                                                                จากวันที่:
                                                                <select id="day">
                                                                    <c:forEach begin="1" end="31" step="1" var="day">
                                                                        <c:choose>
                                                                            <c:when test="${day<10}">
                                                                                <option value="0${day}">${day}</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="${day}">${day}</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </select>
                                                                <select id="month">
                                                                    <option value="01">มกราคม</option>
                                                                    <option value="02">กุมภาพันธ์</option>
                                                                    <option value="03">มีนาคม</option>
                                                                    <option value="04">เมษายน</option>
                                                                    <option value="05">พฤษภาคม</option>
                                                                    <option value="06">มิถุนายน</option>
                                                                    <option value="07">กรกฎาคม</option>
                                                                    <option value="08">สิงหาคม</option>
                                                                    <option value="09">กันยายน</option>
                                                                    <option value="10">ตุลาคม</option>
                                                                    <option value="11">พฤศจิกายน</option>
                                                                    <option value="12">ธันวาคม</option>
                                                                </select>
                                                                <select id="year">
                                                                    <c:forEach begin="2012" end="2050" step="1" var="year">
                                                                        <option value="${year}">${year}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                <br>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ถึง:
                                                                <select id="day">
                                                                    <c:forEach begin="1" end="31" step="1" var="day">
                                                                        <c:choose>
                                                                            <c:when test="${day<10}">
                                                                                <option value="0${day}">${day}</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="${day}">${day}</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </select>
                                                                <select id="month">
                                                                    <option value="01">มกราคม</option>
                                                                    <option value="02">กุมภาพันธ์</option>
                                                                    <option value="03">มีนาคม</option>
                                                                    <option value="04">เมษายน</option>
                                                                    <option value="05">พฤษภาคม</option>
                                                                    <option value="06">มิถุนายน</option>
                                                                    <option value="07">กรกฎาคม</option>
                                                                    <option value="08">สิงหาคม</option>
                                                                    <option value="09">กันยายน</option>
                                                                    <option value="10">ตุลาคม</option>
                                                                    <option value="11">พฤศจิกายน</option>
                                                                    <option value="12">ธันวาคม</option>
                                                                </select>
                                                                <select id="year">
                                                                    <c:forEach begin="2012" end="2050" step="1" var="year">
                                                                        <option value="${year}">${year}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                <br>
                                                                <button type="" title="" class="button" onclick="searchOrder();"><span><span>ค้นหา</span></span></button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="fieldset">
                                                <h2 class="legend">รายการสั่งซื้อ</h2>
                                                <img src="images/line.jpg" width="400" height="" alt=""/>
                                            </div>
                                        </form>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <jsp:include page="footer.jsp" />
                        <br/><br/>
                    </div>
                </div>
                <div class="cleared"></div>
            </div>
            <div class="cleared"></div>
            <p class="art-page-footer"></p>
        </div>
    </body>

</html>








