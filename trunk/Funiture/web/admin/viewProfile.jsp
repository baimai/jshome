<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:query var="query2" dataSource="webdb">
    select *,concat(cm1.name_) as tumbon,concat(cm2.name_) as amphur,concat(cm3.name_) as province from member_master mm
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html >
    <head>
        <title>Create New Customer Account</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />       
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />       
      
        <link type="text/css" href="../jshome/themes/base/jquery.ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="../jshome/js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="../jshome/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../jshome/ui/jquery.ui.tabs.js"></script>  
    
        


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


                            </div>        <div class="main-container col1-layout">
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
                                                            <li class="fields">
                                                                <div class="field email-address">
                                                                    <label for="email_address" class="required">อีเมลล์</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberEmail1" id="memberEmail1" value="${member.member_email1}" title="Email Address" class="input-text validate-email required-entry" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field company-name">
                                                                    <label for="memberComName">ชื่อบริษัท</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberComName" id="memberComName" value="${member.company_name_t}" title="Company Name"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field company-name">
                                                                    <label for="memberNameAbbr">ชื่อย่อบริษัท</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberNameAbbr" id="memberNameAbbr" value="${member.company_name_abbr}" title="Company Name Abbr"class="input-text"  disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field name-lastname">
                                                                    <label for="Adress1" >ที่อยู่ 1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberAddr1" id="Adress1" value="${member.member_addr1}" title="Adress1" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Adress2" >ที่อยู่ 2</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberAddr2" id="Adress2" value="${member.member_addr2}" title="Adress2" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field name-lastname">
                                                                    <label for="Distinct" >ตำบล</label>
                                                                    <div class="input-box" id="showDistinct" >
                                                                        <input type="text" value="${member.tumbon}" disabled/>
                                                                    </div>
                                                                </div>

                                                                <div class="field name-lastname">
                                                                    <label for="Amphur" >อำเภอ</label>
                                                                    <div class="input-box" id="showAmphur" >
                                                                        <input type="text" value="${member.amphur}" disabled/>
                                                                    </div>
                                                                </div>
                                                            </li><li class="fields">
                                                                <div class="field name-lastname">
                                                                    <label for="Province" >จังหวัด</label>
                                                                    <div class="input-box" id="showProvince" >
                                                                        <input type="text" value="${member.province}" disabled/>
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
                                                                    <label for="Tel1" >เบอร์โทรศัพท์ </label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberTel1" id="Tel1" value="${member.member_tel1}" title="Tel1" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Tel2" >เบอร์โทรศัพท์</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberTel2" id="Tel2" value="${member.member_tel2}" title="Tel2" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="field name-lastname">
                                                                    <label for="Mobile1" >เบอร์โทรศัพท์มือถือ</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberMobile1" id="Mobile1" value="${member.member_mobile1}" title="Mobile1" class="input-text " disabled/>
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="Mobile2" >เบอร์โทรศัพท์มือถือ</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="memberMobile2" id="Mobile2" value="${member.member_mobile2}" title="Mobile2" class="input-text " disabled />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>

                                                                <label for="Fax" >แฟ็กซ์</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="memberFax1" id="Fax" value="${member.member_fax1}" title="Fax" class="input-text " disabled/>
                                                                </div>
                                                            </li>
                                                            <li>

                                                                <label for="Fax" >แฟ็กซ์</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="memberFax2" id="Fax" value="${member.member_fax2}" title="Fax" class="input-text " disabled/>
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

    </body>
</html>
