<%--
    Document   : jshome_Profile
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
        <script type="text/javascript" src="ui/jquery.ui.tabs.js"></script>
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
                    <jsp:include page="head.jsp"/>
                    <br>
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
                                            <h1>ข้อมูลส่วนตัว</h1>
                                        </div>
                                        <form action="" method="" id="">
                                            <div class="col2-set">
                                                <div class="col-1 new-users">
                                                    <div class="content">
                                                        <form action="editProfile.do" method="post" id="form-validate" >
                                                            <div class="fieldset">
                                                                <!--<div class="buttons-set"></div> เส้น -->
                                                                <h2 class="legend">ข้อมูลการล็อกอิน</h2>
                                                                <img src="images/line.jpg" width="400" height="" alt=""/>
                                                                <ul class="form-list">
                                                                    <li class="fields">
                                                                        <div class="field">
                                                                            <label for="password" class="required"><em>*</em>รหัสผ่านเก่า</label>
                                                                            <div class="input-box">
                                                                                <input type="password" name="memberPasswordOld" id="passwordOld" title="Password" class="input-text required-entry validate-password" />
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="fields">
                                                                        <div class="field">
                                                                            <label for="password" class="required"><em>*</em>รหัสผ่านใหม่</label>
                                                                            <div class="input-box">
                                                                                <input type="password" name="memberPassword" id="password" title="Password" class="input-text required-entry validate-password" />
                                                                            </div>
                                                                            <p class="required" style="text-align: left">* ข้อมูลที่จำเป็นต้องกรอก</p>
                                                                            <button name="action" value="changePassword" class="button" ><span><span>เปลี่ยนรหัสผ่าน</span></span></button>
                                                                        </div>
                                                                        <div class="field">
                                                                            <label for="confirmation" class="required"><em>*</em>ยืนยันรหัสผ่านใหม่</label>
                                                                            <div class="input-box">
                                                                                <input type="password" name="confirmation" title="Confirm Password" id="confirmation" class="input-text required-entry validate-cpassword" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="field">
                                                                            <div>&nbsp</div>
                                                                            <input type="hidden" name="memberLogin" value="${member.member_login}" />
                                                                            <input type="hidden" name="memberId" value="${member.member_Id}" />
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <form action="editProfile.do" method="post" id="form-validate" >
                                                                <input type="hidden" name="memberId" value="${member.member_Id}" />
                                                                <div class="fieldset">
                                                                    <input type="hidden" name="success_url" value="" />
                                                                    <input type="hidden" name="error_url" value="" />
                                                                    <h2 class="legend">แก้ไขข้อมูลส่วนตัว</h2>
                                                                    <img src="images/line.jpg" width="400" height="" alt=""/>
                                                                    <ul class="form-list">
                                                                        <li class="fields">
                                                                            <div class="customer-name">
                                                                                <div class="field name-firstname">
                                                                                    <label for="firstname" class="required"><em>*</em> ชื่อ</label>
                                                                                    <div class="input-box">
                                                                                        <input type="text" id="firstname" name="memberName" value="${member.member_name}" title="First Name"class="input-text required-entry validate-one-required"   />
                                                                                    </div>
                                                                                </div>
                                                                                <div class="field name-lastname">
                                                                                    <label for="lastname" class="required"><em>*</em> นามสกุล</label>
                                                                                    <div class="input-box">
                                                                                        <input type="text" id="lastname" name="memberSurName" value="${member.member_SurName}" title="Last Name" class="input-text required-entry validate-one-required" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="fields">
                                                                            <div class="field company-name">
                                                                                <label for="memberComName">ชื่อบริษัท</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberComName" id="memberComName" value="${member.company_name_t}" title="Company Name"class="input-text"  />
                                                                                </div>
                                                                            </div>
                                                                            <div class="field company-name">
                                                                                <label for="memberNameAbbr">ชื่อย่อบริษัท</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberNameAbbr" id="memberNameAbbr" value="${member.company_name_abbr}" title="Company Name Abbr"class="input-text"  />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <br>
                                                                        <h2 class="legend">แก้ไขข้อมูลการติดต่อ</h2>
                                                                        <img src="images/line.jpg" width="400" height="" alt=""/>
                                                                        <li class="fields">
                                                                            <div class="field name-lastname">
                                                                                <label for="Adress1" class="required"><em>*</em> ที่อยู่-1</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberAddr1" id="Adress1" value="${member.member_addr1}" title="Adress1" class="input-text required-entry validate-one-required" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="field name-lastname">
                                                                                <label for="Adress2" >ที่อยู่-2</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberAddr2" id="Adress2" value="${member.member_addr2}" title="Adress2" class="input-text " />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="fields">
                                                                            <div class="field name-lastname">
                                                                                <label for="Distinct" >ตำบล</label>
                                                                                <div class="input-box" id="showDistinct" >
                                                                                </div>
                                                                            </div>
                                                                            <div class="field name-lastname">
                                                                                <label for="Amphur" >อำเภอ</label>
                                                                                <div class="input-box" id="showAmphur" >
                                                                                </div>
                                                                            </div>
                                                                        </li><li class="fields">
                                                                            <div class="field name-lastname">
                                                                                <label for="Province" >จังหวัด</label>
                                                                                <div class="input-box" id="showProvince" >
                                                                                    <select name="memberProvince"  id="memberProvince"  onchange="changeCommonProvince(2,this.value)" style="width:260px">
                                                                                        <c:forEach var="province" items="${query.rows}">
                                                                                            <c:if test="${province.id_==member.member_province}">
                                                                                                <option value="${province.id_}" selected>${province.name_}</option>
                                                                                            </c:if>
                                                                                            <c:if test="${province.id_!=member.member_province}">
                                                                                                <option value="${province.id_}" >${province.name_}</option>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="field name-lastname">
                                                                                <label for="Postcode" >รหัสไปรษณีย์</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberPstcode" id="Postcode" value="${member.member_pstcode}" title="Postcode" class="input-text " />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="fields">
                                                                            <div class="field name-lastname">
                                                                                <label for="Tel1" >โทรศัพท์-1 </label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberTel1" id="Tel1" value="${member.member_tel1}" title="Tel1" class="input-text required-entry validate-one-required" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="field name-lastname">
                                                                                <label for="Tel2" >โทรศัพท์-2</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberTel2" id="Tel2" value="${member.member_tel2}" title="Tel2" class="input-text " />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="field name-lastname">
                                                                                <label for="Mobile1" class="required"><em>*</em> Mobile-1</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberMobile1" id="Mobile1" value="${member.member_mobile1}" title="Mobile1" class="input-text " />
                                                                                </div>
                                                                            </div>
                                                                            <div class="field name-lastname">
                                                                                <label for="Mobile2" >Mobile-2</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberMobile2" id="Mobile2" value="${member.member_mobile2}" title="Mobile2" class="input-text " />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="field name-lastname">
                                                                                <label for="Fax" >โทรสาร-1</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberFax1" id="Fax" value="${member.member_fax1}" title="Fax" class="input-text " />
                                                                                </div>
                                                                            </div>
                                                                            <div class="field name-lastname">
                                                                                <label for="Fax" >โทรสาร-2</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberFax2" id="Fax" value="${member.member_fax2}" title="Fax" class="input-text " />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="fields">
                                                                            <div class="field email-address">
                                                                                <label for="email_address" class="required"><em>*</em> E-Mail-1</label>

                                                                                <div class="input-box">
                                                                                    <input type="text" name="memberEmail1" id="memberEmail1" value="${member.member_email1}" title="Email Address" class="input-text validate-email required-entry" />
                                                                                </div>
                                                                                <p class="required" style="text-align: left">* ข้อมูลที่จำเป็นต้องกรอก</p>

                                                                                <button name="action" value="editProfile" class="button" ><span><span>บันทึก</span></span></button>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </form>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
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