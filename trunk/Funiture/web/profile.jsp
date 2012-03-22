<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:query var="query2" dataSource="webdb">
    select * from member_master mm
    join company_master cm on cm.company_id = mm.company_id
    where mm.member_Id = ${sessionScope.loginDetail.memberId}
</sql:query>
<sql:query var="query" dataSource="webdb">
    select * from common_province where level_=1
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
         <title>jshome</title>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
               <!--[if lt IE 7]>
        <script type="text/javascript">
        //<![CDATA[
            var BLANK_URL = 'http://freedemo.templates-master.com/js/blank.html';
            var BLANK_IMG = 'http://freedemo.templates-master.com/js/spacer.gif';
        //]]>
        </script>
        <![endif]-->
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/print.css" media="print" />
        <script type="text/javascript" src="jshome/js/prototype/prototype.js"></script>
        <script type="text/javascript" src="jshome/js/lib/ccard.js"></script>
        <script type="text/javascript" src="jshome/js/prototype/validation.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/dragdrop.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/controls.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/slider.js"></script>
        <script type="text/javascript" src="jshome/js/varien/js.js"></script>
        <script type="text/javascript" src="jshome/js/varien/form.js"></script>
        <script type="text/javascript" src="jshome/js/varien/menu.js"></script>
        <script type="text/javascript" src="jshome/js/mage/translate.js"></script>
        <script type="text/javascript" src="jshome/js/mage/cookies.js"></script>
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
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
                    <jsp:include page="head.jsp"/>
                    <br/><br/>

                            <c:forEach items="${query2.rows}" var="member" >
                                <script type="text/javascript">
                changeCommonProvince(2,${member.member_province});
                changeCommonProvince(3,${member.member_amphur});
                                </script>


                                <br></br>
                                <div class="wrapper">

                                    <div class="page">


                                    </div>        <div class="main-container col1-layout">
                                        <div class="main">
                                            <div class="col-main">
                                                <div class="account-create">
                                                    <div class="page-title">
                                                        <h1>สร้างบัญชีใหม่</h1>
                                                    </div>
                                                    <form action="editProfile.do" method="post" id="form-validate" >
                                                        <div class="fieldset">
                                                            <h2 class="legend">ข้อมูลการล็อกอิน</h2>
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
                                                                        <button name="action" value="changePassword" class="button" ><span><span>เปลี่ยนรหัสผ่าน</span></span></button>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </form>
                                                    <form action="editProfile.do" method="post" id="form-validate" >
                                                        <input type="hidden" name="memberId" value="${member.member_Id}" />
                                                        <div class="fieldset">
                                                            <input type="hidden" name="success_url" value="" />
                                                            <input type="hidden" name="error_url" value="" />
                                                            <h2 class="legend">แก้ไขข้อมูลส่วนตัว</h2>
                                                            <ul class="form-list">
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label for="firstname" >ชื่อ</label>
                                                                            <div class="input-box">
                                                                                <input type="text" id="firstname" name="memberName" value="${member.member_name}" title="First Name"class="input-text"   />
                                                                            </div>
                                                                        </div>
                                                                        <div class="field name-lastname">
                                                                            <label for="lastname" >นามสกุล</label>
                                                                            <div class="input-box">
                                                                                <input type="text" id="lastname" name="memberSurName" value="${member.member_SurName}" title="Last Name" class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="field email-address">
                                                                        <label for="email_address" class="required">อีเมลล์</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberEmail1" id="memberEmail1" value="${member.member_email1}" title="Email Address" class="input-text validate-email required-entry" />
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
                                                                <li class="fields">
                                                                    <div class="field name-lastname">
                                                                        <label for="Adress1" >ที่อยู่ 1</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberAddr1" id="Adress1" value="${member.member_addr1}" title="Adress1" class="input-text " />
                                                                        </div>
                                                                    </div>
                                                                    <div class="field name-lastname">
                                                                        <label for="Adress2" >ที่อยู่ 2</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberAddr2" id="Adress2" value="${member.member_addr2}" title="Adress2" class="input-text " />
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="field name-lastname">
                                                                        <label for="Distinct" >ตำบลt</label>
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
                                                                            <select name="memberProvince" id="memberProvince" onchange="changeCommonProvince(2,this.value)" style="width:200px">
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
                                                                        <label for="Tel1" >เบอร์โทรศัพท์ </label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberTel1" id="Tel1" value="${member.member_tel1}" title="Tel1" class="input-text " />
                                                                        </div>
                                                                    </div>
                                                                    <div class="field name-lastname">
                                                                        <label for="Tel2" >เบอร์โทรศัพท์</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberTel2" id="Tel2" value="${member.member_tel2}" title="Tel2" class="input-text " />
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="field name-lastname">
                                                                        <label for="Mobile1" >เบอร์โทรศัพท์มือถือ</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberMobile1" id="Mobile1" value="${member.member_mobile1}" title="Mobile1" class="input-text " />
                                                                        </div>
                                                                    </div>
                                                                    <div class="field name-lastname">
                                                                        <label for="Mobile2" >เบอร์โทรศัพท์มือถือ</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="memberMobile2" id="Mobile2" value="${member.member_mobile2}" title="Mobile2" class="input-text " />
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>

                                                                    <label for="Fax" >แฟ็กซ์</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberFax1" id="Fax" value="${member.member_fax1}" title="Fax" class="input-text " />
                                                                    </div>
                                                                </li>
                                                                <li>

                                                                    <label for="Fax" >แฟ็กซ์</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberFax2" id="Fax" value="${member.member_fax2}" title="Fax" class="input-text " />
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>

                                                        <div class="buttons-set">


                                                            <button name="action" value="editProfile" class="button" ><span><span>เยืนยัน</span></span></button>
                                                        </div>
                                                    </form>

                                                    <script type="text/javascript">
                                                        //<![CDATA[
                                                        var dataForm = new VarienForm('form-validate', true);
                                                        //]]>
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>



                            <jsp:include page="footer.jsp" />
                            <br/><br/>
                            </div>


                            </div>
                            <div class="cleared"></div>
                            </div>

                            <div class="cleared"></div>
                            <p class="art-page-footer"></p>

                            </body>
                            </html>
