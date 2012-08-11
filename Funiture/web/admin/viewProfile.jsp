<%--
    Document   : jshome_ViewProfile
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<sql:query var="query2" dataSource="webdb">
    select *,concat(cm1.name_) as tumbon,concat(cm2.name_) as amphur,concat(cm3.name_) as province, mm.Create_Date,mm.Update_Date from member_master mm
    join company_master cm on cm.company_id = mm.company_id
    join common_province cm1 on mm.member_distinct = cm1.id_
    join common_province cm2 on mm.member_amphur = cm2.id_
    join common_province cm3 on mm.member_province = cm3.id_
    where mm.member_Id = ${param.memberId}
</sql:query>

<sql:query var="query" dataSource="webdb">
    select * from common_province where level_=1
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />       
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />       
        <link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.tabs.js"></script>  
        <script type="text/javascript">

            $(function() {
                var date = new Date();
               // date.format("m/dd/yy");  ${member.create_date}
               date.format("yy/dd/m");
            });

            function splitDate(date){
                var t = date.split("/");  //ถ้าเจอวรรคแตกเก็บลง array t
                return t[2]+"-"+t[0]+"-"+t[1];
            }

        </script>
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
                    <jsp:include page="header.jsp"/>
                    <br/><br/>
                    <c:forEach items="${query2.rows}" var="member" >
                        <div class="wrapper">
                            <div class="page">
                            </div>
                            <div class="main-container col1-layout">
                                <div class="main">
                                    <div class="col-main">
                                        <div class="account-create">
                                                    <div class="fieldset">
                                                        <input type="hidden" name="success_url" value="" />
                                                        <input type="hidden" name="error_url" value="" />
                                                        <h2 class="legend">ข้อมูลสมาชิก</h2>
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label for="firstname" >ชื่อ</label>
                                                                        <div class="input-box">
                                                                            <input type="text" id="firstname" name="memberName" value="${member.member_name}" title="First Name"class="input-text"   disabled/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="field name-lastname">
                                                                        <label for="lastname" >นามสกุล</label>
                                                                        <div class="input-box">
                                                                            <input type="text" id="lastname" name="memberSurName" value="${member.member_SurName}" title="Last Name" class="input-text" disabled/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            
                                                           <!-- <li class="fields">
                                                                <div class="field company-name">
                                                                    <label for="memberId">รหัสสมาชิก</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberId" id="memberId" value="${member.member_id}" title="Member Id"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field company-name">
                                                                    <label for="memberCompanry">รหัสบริษัท</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberCompanry" id="memberCompanry" value="${member.company_id}" title="Member Companry"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>-->

                                                                    <li class="fields">
                                                                <div class="field company-name">
                                                                    <label for="memberLogin">รหัสเข้าระบบ</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberLogin" id="memberLogin" value="${member.member_login}" title="Member Login"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field company-name">
                                                                    <label for="memberPassword">รหัสผ่าน</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberPassword" id="memberPassword" value="${member.member_password}" title="Member Password"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                                    </li>
                                                                <li>
                                                                <div class="field company-name">
                                                                    <label for="UserId">รหัสผู้ใช้</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberUserId" id="memberUserId" value="${member.User_Id}" title="Member User Id"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                                </li>

                                                                    <li class="fields">
                                                                <div class="field company-name">
                                                                    <label for="memberComName">ชื่อบริษัท</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberComName" id="memberComName" value="${member.member_com_name}" title="Company Name"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field company-name">
                                                                    <label for="memberNameAbbr">รหัสบริษัท</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberNameAbbr" id="memberNameAbbr" value="${member.member_name_abbr}" title="Company Name Abbr"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                             <!--<li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="status" class="required">สถานะสมาชิก</label>
                                                                    <div class="input-box">
                                                                        <!--<input type="text" name="memberStatus" id="memberStatus" value="${member.member_status}" title="Status" class="input-text validate-email required-entry" disabled/>
                                                                        <input type="text" name="memberStatus" id="memberStatus" value="<c:if test="${member.member_status == 'Y'}">Active</c:if><c:if test="${member.member_status != 'Y'}">InActive</c:if>" title="Status" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>-->
                                                            <br>
                                                            <h2 class="legend">ข้อมูลการติดต่อ</h2>
                                                            <li class="fields">
                                                                <div class="field name-lastname">
                                                                    <label for="Adress1" >ที่อยู่-1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberAddr1" id="Adress1" value="${member.member_addr1}" title="Adress1" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Adress2" >ที่อยู่-2</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberAddr2" id="Adress2" value="${member.member_addr2}" title="Adress2" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field name-lastname">
                                                                    <label for="Distinct" >ตำบล</label>
                                                                    <div class="input-box" id="showDistinct" >
                                                                        <input type="text" value="${member.tumbon} " class="input-text "disabled/>
                                                                    </div>
                                                                </div>

                                                                <div class="field name-lastname">
                                                                    <label for="Amphur" >อำเภอ</label>
                                                                    <div class="input-box" id="showAmphur" >
                                                                        <input type="text" value="${member.amphur}" class="input-text "disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field name-lastname">
                                                                    <label for="Province" >จังหวัด</label>
                                                                    <div class="input-box" id="showProvince" >
                                                                        <input type="text" value="${member.province}" class="input-text "disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Postcode" >รหัสไปรษณีย์</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberPstcode" id="Postcode" value="${member.member_pstcode}" title="Postcode" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field name-lastname">
                                                                    <label for="Tel1" >โทรศัพท์-1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberTel1" id="Tel1" value="${member.member_tel1}" title="Tel1" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Tel2" >โทรศัพท์-2</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberTel2" id="Tel2" value="${member.member_tel2}" title="Tel2" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="field name-lastname">
                                                                    <label for="Mobile1" >Mobile-1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberMobile1" id="Mobile1" value="${member.member_mobile1}" title="Mobile1" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Mobile2" >Mobile-2</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberMobile2" id="Mobile2" value="${member.member_mobile2}" title="Mobile2" class="input-text " disabled />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="field name-lastname">
                                                                    <label for="Fax" >โทรสาร-1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberFax1" id="Fax" value="${member.member_fax1}" title="Fax" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Fax" >โทรสาร-2</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberFax2" id="Fax" value="${member.member_fax2}" title="Fax" class="input-text " disabled/>
                                                                        </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="email_address" class="required">E-Mail-1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberEmail1" id="memberEmail1" value="${member.member_email1}" title="Email Address" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field email-address">
                                                                    <label for="email_address2" class="required">E-Mail-2</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberEmail2" id="memberEmail2" value="${member.member_email2}" title="Email Address2" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="email_address3" class="required">E-Mail-3</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberEmail3" id="memberEmail3" value="${member.member_email3}" title="Email Address3" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <br>
                                                            <h2 class="legend">ข้อมูลการสมัคร</h2>

                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="reg_date" class="required">วันที่ลงทะเบียน</label>
                                                                    <div class="input-box">
                                                                        <input type="date" name="memberRegDate" id="memberRegDate" value="<fmt:formatDate  value="${member.member_reg_date}"  pattern="dd/MM/yyyy" />" title="Reg Date" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="app_date" class="required">วันที่อนุมัติเข้าใช้งาน</label>
                                                                    <div class="input-box">
                                                                        <input type="date" name="memberAppDate" id="memberAppDate" value="<fmt:formatDate  value="${member.member_app_date}"  pattern="dd/MM/yyyy" />" title="App Date" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="Create Date" class="required">วันที่สร้าง</label>
                                                                    <div class="input-box">
                                                                        <input type="date" name="memberCreateDate" id="memberCreateDate" value="<fmt:formatDate  value="${member.create_date}"  pattern="dd/MM/yyyy" />" title="Create Date" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                                     
                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="Update Date" class="required">วันที่ปรับปรุง</label>
                                                                    <div class="input-box" >
                                                                        <input type="date" name="memberUpdate" id="memberUpdate" value="<fmt:formatDate  value="${member.update_date}"  pattern="dd/MM/yyyy" />" title="Update Date" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="Logo Loc" class="required">Path เก็บรูป Logo</label>
                                                                    <div class="input-box" >
                                                                        <input type="text" name="memberLogoLoc" id="memberLogoLoc" value="${member.member_logo_loc}" title="Logo Loc" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                            
                                            </div>
                                        </div>
                                    </div>

                                </div></div></div>
                            </c:forEach>
                    <br/><br/>
                </div>
            </div>
            <div class="cleared"></div>
        <div class="cleared"></div>
        <p class="art-page-footer"></p>
         <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>

</html>
