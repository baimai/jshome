<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:query var="query" dataSource="webdb">
    select * from common_province where level_=1
</sql:query>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Create New Customer Account</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="description" content="Default Description" />
        <meta name="keywords" content="Magento, Varien, E-commerce" />
        <meta name="robots" content="*" />
        <link rel="icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />
        <!--[if lt IE 7]>
        <script type="text/javascript">
        //<![CDATA[
            var BLANK_URL = 'http://freedemo.templates-master.com/js/blank.html';
            var BLANK_IMG = 'http://freedemo.templates-master.com/js/spacer.gif';
        //]]>
        </script>
        <![endif]-->
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

        <!--[if lt IE 8]>
        <link rel="stylesheet" type="text/css" href="http://freedemo.templates-master.com/skin/frontend/default/f002/css/styles-ie.css" media="all" />
        <![endif]-->
        <!--[if lt IE 7]>
        <script type="text/javascript" src="http://freedemo.templates-master.com/js/lib/ds-sleight.js"></script>
        <script type="text/javascript" src="http://freedemo.templates-master.com/skin/frontend/base/default/js/ie6.js"></script>
        <![endif]-->
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
            function checkMemberLogin(memberLogin){
                var param = "memberLogin="+memberLogin;
                postDataReturnText("chkValidate.do",param,chkValidate);
            }
            function chkValidate(text){
                document.getElementById("chkValidate").innerHTML=text;
                             
            }
            function showAmphur(text){
                document.getElementById("showAmphur").innerHTML=text;
            }
            function showDistinct(text){
                document.getElementById("showDistinct").innerHTML=text;
            }
           function checkBeforeSubmit(){
               if(document.getElementById("chkValidate").innerHTML!="ข้อมูลล็อกอินนี้สามารถใช้ได้"){
                   
                }else{
                    alert("ขอคุณสำหรับการลงทะเบียน");
                   // window.close();
                }
           }

        </script>
        <script type="text/javascript">
            //<![CDATA[
            optionalZipCountries = [];
            //]]>
        </script>
        <script type="text/javascript">var Translator = new Translate({"Credit card number doesn't match credit card type":"Credit card number does not match credit card type","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Please use only letters (a-z or A-Z), numbers (0-9) or underscores (_) in this field, first character must be a letter."});</script></head>
    <body class=" customer-account-create" onload="changeCommonProvince(2,1);changeCommonProvince(3,77)">
        <div class="wrapper">
            <noscript>
                <div class="noscript">
                    <div class="noscript-inner">
                        <p><strong>JavaScript seem to be disabled in your browser.</strong></p>
                        <p>You must have JavaScript enabled in your browser to utilize the functionality of this website.</p>
                    </div>
                </div>
            </noscript>
            <div class="page">


            </div>        <div class="main-container col1-layout">
                <div class="main">
                    <div class="col-main">
                        <div class="account-create">
                            <div class="page-title">
                                <h1>Create an Account</h1>
                            </div>
                            <form action="admin/memberMaster.do" method="post" id="form-validate">
                                <div class="fieldset">
                                    <h2 class="legend">Login Information</h2>
                                    <ul class="form-list">
                                        <li>   <div class="field">
                                                <label for="login" class="required"><em>*</em>login</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberLogin" id="memberLogin" title="memberLogin" class="input-text required-entry validate-Login" onkeyup="checkMemberLogin(this.value)" on/>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label for="chkMemberLogin" >Validate</label>
                                                <div class="input-box" id="chkValidate" style="color: red">
                                                    <em><span >กรุณากรอกข้อมูลล็อกอิน</span></em>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fields">
                                            <div class="field">
                                                <label for="password" class="required"><em>*</em>Password</label>
                                                <div class="input-box">
                                                    <input type="password" name="memberPassword" id="password" title="Password" class="input-text required-entry validate-password" />
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label for="confirmation" class="required"><em>*</em>Confirm Password</label>
                                                <div class="input-box">
                                                    <input type="password" name="confirmation" title="Confirm Password" id="confirmation" class="input-text required-entry validate-cpassword" />
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="fieldset">
                                    <input type="hidden" name="success_url" value="" />
                                    <input type="hidden" name="error_url" value="" />
                                    <h2 class="legend">Personal Information</h2>
                                    <ul class="form-list">
                                        <li class="fields">
                                            <div class="customer-name">
                                                <div class="field name-firstname">
                                                    <label for="firstname" >First Name</label>
                                                    <div class="input-box">
                                                        <input type="text" id="firstname" name="memberName" value="" title="First Name"class="input-text"   />
                                                    </div>
                                                </div>
                                                <div class="field name-lastname">
                                                    <label for="lastname" >Last Name</label>
                                                    <div class="input-box">
                                                        <input type="text" id="lastname" name="memberSurName" value="" title="Last Name" class="input-text" />
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fields">
                                            <div class="field email-address">
                                                <label for="email_address" class="required"><em>*</em>Email Address</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberEmail1" id="memberEmail1" value="" title="Email Address" class="input-text validate-email required-entry" />
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fields">
                                            <div class="field company-name">
                                                <label for="memberComName">Company Name</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberComName" id="memberComName" value="" title="Company Name"class="input-text"  />
                                                </div>
                                            </div>
                                            <div class="field company-name">
                                                <label for="memberNameAbbr">Company Name Abbr</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberNameAbbr" id="memberNameAbbr" value="" title="Company Name Abbr"class="input-text"  />
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fields">
                                            <div class="field name-lastname">
                                                <label for="Adress1" >Adress1</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberAddr1" id="Adress1" value="" title="Adress1" class="input-text " />
                                                </div>
                                            </div>
                                            <div class="field name-lastname">
                                                <label for="Adress2" >Adress2</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberAddr2" id="Adress2" value="" title="Adress2" class="input-text " />
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fields">
                                            <div class="field name-lastname">
                                                <label for="Distinct" >Distinct</label>
                                                <div class="input-box" id="showDistinct" >

                                                </div>
                                            </div>

                                            <div class="field name-lastname">
                                                <label for="Amphur" >Amphur</label>
                                                <div class="input-box" id="showAmphur" >

                                                </div>
                                            </div>
                                        </li><li class="fields">
                                            <div class="field name-lastname">
                                                <label for="Province" >Province</label>
                                                <div class="input-box" id="showProvince" >
                                                    <select name="memberProvince" id="memberProvince" onchange="changeCommonProvince(2,this.value)" style="width:200px">
                                                        <c:forEach var="province" items="${query.rows}">
                                                            <option value="${province.id_}">${province.name_}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="field name-lastname">
                                                <label for="Postcode" >Postcode</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberPstcode" id="Postcode" value="" title="Postcode" class="input-text " />
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fields">
                                            <div class="field name-lastname">
                                                <label for="Tel1" >Tel1</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberTel1" id="Tel1" value="" title="Tel1" class="input-text " />
                                                </div>
                                            </div>
                                            <div class="field name-lastname">
                                                <label for="Tel2" >Tel2</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberTel2" id="Tel2" value="" title="Tel2" class="input-text " />
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="field name-lastname">
                                                <label for="Mobile1" >Mobile</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberMobile1" id="Mobile1" value="" title="Mobile1" class="input-text " />
                                                </div>
                                            </div>
                                            <div class="field name-lastname">
                                                <label for="Mobile2" >Mobile2</label>
                                                <div class="input-box">
                                                    <input type="text" name="memberMobile2" id="Mobile2" value="" title="Mobile2" class="input-text " />
                                                </div>
                                            </div>
                                        </li>
                                        <li>

                                            <label for="Fax" >Fax</label>
                                            <div class="input-box">
                                                <input type="text" name="memberFax1" id="Fax" value="" title="Fax" class="input-text " />
                                            </div>
                                        </li>
                                        <li>

                                            <label for="Fax" >Fax</label>
                                            <div class="input-box">
                                                <input type="text" name="memberFax2" id="Fax" value="" title="Fax" class="input-text " />
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div class="buttons-set">
                                    <p class="required">* Required Fields</p>

                                    <button name="action" value="Submit" >Submit</button>
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

    </body>
</html>
