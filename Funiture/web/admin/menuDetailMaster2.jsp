<%-- 
    Document   : menuDetailMaster
    Created on : Jan 3, 2012, 7:41:39 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${param.menucodeId!=null}">
    <sql:query var="query3" dataSource="webdb">
        select md.*,cm.company_code,  from menu_detail_master md
        left join menu_group_master mg on mg.menu_group_id=md.menu_group_id
        left join company_master cm on cm.company_id=md.company_id
        where menu_code_id =  ${param.menuCodeId}
    </sql:query>
</c:if>
<sql:query var="query1" dataSource="webdb">
    SELECT mg.menu_g_name_t as groupName,mg.menu_group_id FROM menu_group_master mg
</sql:query>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
<link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
<link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
<link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
<script type="text/javascript" src="../jshome/js/prototype/prototype.js"></script>
<script type="text/javascript" src="../jshome/js/lib/ccard.js"></script>
<script type="text/javascript" src="../jshome/js/prototype/validation.js"></script>
<script type="text/javascript" src="../jshome/js/scriptaculous/builder.js"></script>
<script type="text/javascript" src="../jshome/js/scriptaculous/effects.js"></script>
<script type="text/javascript" src="../jshome/js/scriptaculous/dragdrop.js"></script>
<script type="text/javascript" src="../jshome/js/scriptaculous/controls.js"></script>
<script type="text/javascript" src="../jshome/js/scriptaculous/slider.js"></script>
<script type="text/javascript" src="../jshome/js/varien/js.js"></script>
<script type="text/javascript" src="../jshome/js/varien/form.js"></script>
<script type="text/javascript" src="../jshome/js/varien/menu.js"></script>
<script type="text/javascript" src="../jshome/js/mage/translate.js"></script>
<script type="text/javascript" src="../jshome/js/mage/cookies.js"></script>
<!--[if lt IE 8]>
<link rel="stylesheet" type="text/css" href="http://freedemo.templates-master.com/skin/frontend/default/f002/css/styles-ie.css" media="all" />
<![endif]-->
<!--[if lt IE 7]>
<script type="text/javascript" src="http://freedemo.templates-master.com/js/lib/ds-sleight.js"></script>
<script type="text/javascript" src="http://freedemo.templates-master.com/skin/frontend/base/default/js/ie6.js"></script>
<![endif]-->

<script type="text/javascript">
//<![CDATA[
optionalZipCountries = [];
//]]>
</script>
<script type="text/javascript">var Translator = new Translate({"Credit card number doesn't match credit card type":"Credit card number does not match credit card type","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Please use only letters (a-z or A-Z), numbers (0-9) or underscores (_) in this field, first character must be a letter."});</script>
</head>
<body class=" customer-account-create">
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
        <h1>Menu Detail</h1>
    </div>
            <form action="http://freedemo.templates-master.com/f002/customer/account/createpost/" method="post" id="form-validate">
            <div class="fieldset">
              <ul class="form-list">
          <li>
                        <label for="login" class="required"><em>*</em>Menu Group</label>
                        <div class="input-box">
                           <select name="menuGroupId">
                                <c:forEach items="${query1.rows}" var="group">
                                    <c:if test="${param.menuGroupId != group.menu_group_id}">
                                        <option value="${group.menu_group_id}" >${group.menu_g_name_t}</option>
                                    </c:if>
                                    <c:if test="${param.menuGroupId == group.menu_group_id}">
                                        <option value="${group.menu_group_id}" selected>${group.menu_g_name_t}</option>
                                    </c:if>
                                </c:forEach>

                            </select>
                        </div>
                    </li>
                <li class="fields">
                    <div class="field">
                        <label for="menuSeq" class="required"><em>*</em>Menu Seq</label>
                        <div class="input-box">
                            <input type="text" name="menuSeq" id="menuSeq" title="menuSeq" class="input-text required-entry validate-menuSeq" />
                        </div>
                    </div>
                    <div class="field">
                        <label for="menuModel" class="required"><em>*</em>MenuModel</label>
                        <div class="input-box">
                            <input type="text" name="menuModel" title="menuModel" id="menuModel" class="input-text required-entry validate-menuModel" />
                        </div>
                    </div>
                </li>
          </ul>
        </div>
        <div class="fieldset">
            <input type="hidden" name="success_url" value="" />
            <input type="hidden" name="error_url" value="" />
           
            <ul class="form-list">
                <li class="fields">
                    <div class="customer-name">
    <div class="field name-firstname">
        <label for="menuCNameT" >Menu Name TH</label>
        <div class="input-box">
            <input type="text" id="menuCNameT" name="menuCNameT" value="" title="First Name"class="input-text"   />
        </div>
    </div>
    <div class="field name-lastname">
        <label for="lastname" >Menu Name EN</label>
        <div class="input-box">
            <input type="text" id="lastname" name="memberSurName" value="" title="Last Name" class="input-text" />
        </div>
    </div>
</div>
                </li>
                <li class="fields">
                 <div class="field email-address">
                    <label for="showListSts" class="required"><em>*</em>Show List Status</label>
                    <div class="input-box">
                        <input name="showListSts" type="radio"/>Yes<input name="display" type="radio"/>No
                    </div>
                    </div>
                </li>
                 <li class="fields">
                <div class="field picCode">
                    <label for="picCode">PicCode</label>
                     <div class="input-box">
            <input type="text" id="picCode" name="picCode" value="" title="picCode" class="input-text" />
       
                    </div>
                    </div>
                     <div class="field company-name">
                    <label for="menuCRemarkT">Menu Code Remark TH</label>
                    <div class="input-box">
                        <input type="text" name="menuCRemarkT" id="menuCRemarkT" value="" title="menuCRemarkT"class="input-text"  />
                    </div>
                    </div>
                </li>                 
                <li class="fields">
                <div class="field name-lastname">
                    <label for="Adress1" >Menu Code Remark EN</label>
                    <div class="input-box">
                        <input type="text" name="menuCRemarkE" id="menuCRemarkE" value="" title="menuCRemarkE" class="input-text " />
                    </div>
                </div>
                                                  </ul>
        </div>
            
        <div class="buttons-set">
            <p class="required">* Required Fields</p>
            <p class="back-link"><a href="http://freedemo.templates-master.com/f002/customer/account/login/" class="back-link"><small>&laquo; </small>Back</a></p>
            <button type="submit" title="Submit" class="button"><span><span>Submit</span></span></button>
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
