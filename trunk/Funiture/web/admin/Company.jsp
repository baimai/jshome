<%--
    Document   : jshome_Company
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${applicationScope.Company_Id!=null}">
    <sql:query var="company1" dataSource="webdb">
        SELECT * from company_master cpm
        where cpm.Company_Id =  ${applicationScope.Company_Id}
    </sql:query>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <title>jshome</title>
        <link type="text/css" href="development-bundle/themes/base/ui.all.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/ui.multiselect.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/prototype/prototype.js"></script>
        <script type="text/javascript" src="js/lib/ccard.js"></script>
        <script type="text/javascript" src="js/prototype/validation.js"></script>
        <script type="text/javascript" src="js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="js/scriptaculous/dragdrop.js"></script>
        <script type="text/javascript" src="js/scriptaculous/controls.js"></script>
        <script type="text/javascript" src="js/scriptaculous/slider.js"></script>
        <script type="text/javascript" src="js/varien/js.js"></script>
        <script type="text/javascript" src="js/varien/form.js"></script>
        <script type="text/javascript" src="js/varien/menu.js"></script>
        <script type="text/javascript" src="js/mage/translate.js"></script>
        <script type="text/javascript" src="js/mage/cookies.js"></script>
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
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
                                            <h1>ข้อมูลบริษัท</h1>
                                        </div>
                                        <c:if test="${param.valid==1}"><div class="success-msg" style="background-color: lightgreen; ">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                        <c:if test="${param.error==1}"><div class="messager-error" style="background-color: #EB340A;">ไม่สามารถบันทึกข้อมูลได้</div></c:if>

                                        <c:if test="${applicationScope.Company_Id==null}" >
                                                <form action="companyMasterController.do" method="post" id="form-validate" enctype="multipart/form-data" >
                                                    <c:forEach var="company" items="${company1.rows}" >
                                                        <input type="hidden" name="companyId" value="${company.company_id}"/>
                                                        <div class="fieldset">
                                                            <h2 class="legend">ตั้งค่า</h2>
                                                            <img src="images/line.jpg" width="580" height="" alt=""/>
                                                            <ul class="form-list">
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label for="firstname" class="required"><em>*</em>รหัสบริษัท:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" id="firstname" name="companyCode" value="" title="First Name"class="input-text required-entry "/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="field name-lastname">
                                                                            <label for="lastname" class="required"><em>*</em>รหัสย่อบริษัท:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" id="lastname" name="companyNameAbbr" value="" title="Last Name" class="input-text required-entry validate-code"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label class="required"><em>*</em>Header Website:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="uploadheadtmp" value=""  class="input-text" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Header Website:</label>
                                                                           
                                                                                <label for="firstname">Header Website:</label>
                                                                            <input type="file" name="uploadhead" class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>Company Logo:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="uploadlogoLogtmp" value=""  class="input-text" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Company Logo:</label>
                                                                            
                                                                                <label for="firstname" >Company Logo:</label>
                                                                            <input type="file" name="uploadlogoLog" class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>Cataloge:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="uploadcatalogetmp" value=""  class="input-text" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Cataloge:</label>
                                                                            
                                                                                <label for="firstname" >Cataloge:</label>
                                                                            <input type="file" name="uploadcataloge" class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>สถานะจำนวนสินค้า:</label>
                                                                            <div class="select">
                                                                                <select name="showStockBalanceFlag">
                                                                                    <option value="N" >Not Show</option>
                                                                                    <option value="Y" >Show</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>สถานะราคาสินค้า:</label>
                                                                            <div class="select">
                                                                                <select name="showPriceListFlag">
                                                                                    <option value="N" >Not Show</option>
                                                                                    <option value="W" >ราคาขายส่ง</option>
                                                                                    <option value="R" >ราคาขายปลีก</option>
                                                                                    <option value="A" >ราคาขาย</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>สถานะสั่งซื้อสินค้า:</label>
                                                                            <div class="select">
                                                                                <select name="showOrderFlag">
                                                                                    <option value="N" >Not Show</option>
                                                                                    <option value="Y" >Show    </option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="fieldset">
                                                            <h2 class="legend">รายละเอียดบริษัท:</h2>
                                                            <img src="images/line.jpg" width="580" height="" alt=""/>
                                                            <ul class="form-list">
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>ชื่อบริษัท(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyNameT" value="" size="30"  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">ชื่อบริษัท(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyNameE" value="" size="30"  class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>ที่อยู่บริษัท(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAddrT" value="" class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">ที่อยู่บริษัท(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAddrE" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>ตำบล(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyDistrictT" value=""  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">

                                                                            <label align="right">ตำบล(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyDistrictE" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>อำเภอ(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAmphurT" value=""  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">อำเภอ(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAmphurE" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>จังหวัด(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyProvinceT" value=""  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">จังหวัด(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyProvinceE" value=""  class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>รหัสไปรษณีย์:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyPostCode" value=""  class="input-text required-entry validate-number"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>โทรศัพท์-1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyTel1" value=""  class="input-text required-entry validate-phoneStrict"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรศัพท์-2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyTel2" value=""   class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรศัพท์-3:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyTel3" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>โทรสาร-1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyFax1" value=""  class="input-text required-entry validate-fax"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรสาร-2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyFax2" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรสาร-3:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyFax3" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>Mobile-1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyMobile1" value=""  class="input-text required-entry validate-phoneLax"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Mobile-2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyMobile2" value=""  class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Mobile-3:</label>

                                                                            <div class="input-box">
                                                                                <input type="text" name="companyMobile3" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>E-mail-บริษัท1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyEmail1" value=""  class="input-text required-entry validate-email"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">E-mail-บริษัท2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyEmail2" value=""  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>E-mail-รับแจ้ง order:</label>

                                                                            <div class="input-box">
                                                                                <input type="text" name="companyEmail3" value=""  class="input-text required-entry validate-email"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>แสดงภาษา:</label>
                                                                            <div class="select option">
                                                                                <select name="languageFlag">
                                                                                    <option value="T" >Thai</option>
                                                                                    <option value="E">English</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <p class="required" style="text-align: left"> * ข้อมูลที่จำเปนต้องหรอก:</p>
                                                                 <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                            </ul>
                                                        </div>
                                                    </c:forEach>
                                                </form>
                                            </c:if>

                                            <c:if test="${applicationScope.Company_Id!=null}" >
                                                <form action="companyMasterController.do" method="post" id="form-validate" enctype="multipart/form-data" >


                                                    <c:forEach var="company" items="${company1.rows}" >
                                                        <input type="hidden" name="companyId" value="${company.company_id}"/>
                                                        <div class="fieldset">
                                                            <h2 class="legend">ตั้งค่า</h2>
                                                            <img src="images/line.jpg" width="580" height="" alt=""/>
                                                            <ul class="form-list">
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label for="firstname" class="required"><em>*</em>รหัสบริษัท:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" id="firstname" name="companyCode" value="${company.Company_Code}" title="First Name"class="input-text required-entry "/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="field name-lastname">
                                                                            <label for="lastname" class="required"><em>*</em>รหัสย่อบริษัท:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" id="lastname" name="companyNameAbbr" value="${company.Company_Name_Abbr}" title="Last Name" class="input-text required-entry validate-code"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label class="required"><em>*</em>Header Website:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="uploadheadtmp" value="${company.Company_Header_Loc}"  class="input-text" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Header Website:</label>
                                                                            <c:if test="${company.Company_Header_Loc!=null&&company.Company_Header_Loc!=''}" >
                                                                            </c:if>
                                                                            <c:if test="${company.Company_Header_Loc==null||company.Company_Header_Loc==''}" >
                                                                                <label for="firstname">Header Website:</label>
                                                                            </c:if>
                                                                            <input type="file" name="uploadhead" class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>Company Logo:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="uploadlogoLogtmp" value="${company.Company_Logo_Loc}"  class="input-text" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Company Logo:</label>
                                                                            <c:if test="${company.Company_Logo_Loc!=null&&company.Company_Logo_Loc!=''}" >
                                                                            </c:if>
                                                                            <c:if test="${company.Company_Logo_Loc==null||company.Company_Logo_Loc==''}" >
                                                                                <label for="firstname" >Company Logo:</label>
                                                                            </c:if>
                                                                            <input type="file" name="uploadlogoLog" class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>Cataloge:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="uploadcatalogetmp" value="${company.Company_Catalog_Loc}"  class="input-text" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Cataloge:</label>
                                                                            <c:if test="${company.Company_Catalog_Loc!=null&&company.Company_Catalog_Loc!=''}" >
                                                                            </c:if>
                                                                            <c:if test="${company.Company_Catalog_Loc==null||company.Company_Catalog_Loc==''}" >
                                                                                <label for="firstname" >Cataloge:</label>
                                                                            </c:if>
                                                                            <input type="file" name="uploadcataloge" class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>สถานะจำนวนสินค้า:</label>
                                                                            <div class="select">
                                                                                <select name="showStockBalanceFlag">
                                                                                    <option value="N" <c:if test="${company.Show_Stock_Balance_Flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                                    <option value="Y" <c:if test="${company.Show_Stock_Balance_Flag == 'Y'}"> selected</c:if>>Show    </option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>สถานะราคาสินค้า:</label>
                                                                            <div class="select">
                                                                                <select name="showPriceListFlag">
                                                                                    <option value="N" <c:if test="${company.Show_Price_List_Flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                                    <option value="W" <c:if test="${company.Show_Price_List_Flag == 'W'}"> selected</c:if>>ราคาขายส่ง</option>
                                                                                    <option value="R" <c:if test="${company.Show_Price_List_Flag == 'R'}"> selected</c:if>>ราคาขายปลีก</option>
                                                                                    <option value="A" <c:if test="${company.Show_Price_List_Flag == 'A'}"> selected</c:if>>ราคาขาย</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>สถานะสั่งซื้อสินค้า:</label>
                                                                            <div class="select">
                                                                                <select name="showOrderFlag">
                                                                                    <option value="N" <c:if test="${company.Show_Order_Flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                                    <option value="Y" <c:if test="${company.Show_Order_Flag == 'Y'}"> selected</c:if>>Show    </option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="fieldset">
                                                            <h2 class="legend">รายละเอียดบริษัท:</h2>
                                                            <img src="images/line.jpg" width="580" height="" alt=""/>
                                                            <ul class="form-list">
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>ชื่อบริษัท(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyNameT" value="${company.Company_Name_T}" size="30"  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">ชื่อบริษัท(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyNameE" value="${company.Company_Name_E}" size="30"  class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>ที่อยู่บริษัท(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAddrT" value="${company.Company_Addr_T}" class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">ที่อยู่บริษัท(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAddrE" value="${company.Company_Addr_E}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>ตำบล(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyDistrictT" value="${company.Company_District_T}"  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">

                                                                            <label align="right">ตำบล(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyDistrictE" value="${company.Company_District_E}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>อำเภอ(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAmphurT" value="${company.Company_Amphur_T}"  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">อำเภอ(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyAmphurE" value="${company.Company_Amphur_E}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>จังหวัด(ไทย):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyProvinceT" value="${company.Company_Province_T}"  class="input-text required-entry validate-Login"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">จังหวัด(อังกฤษ):</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyProvinceE" value="${company.Company_Province_E}"  class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>รหัสไปรษณีย:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyPostCode" value="${company.Company_PostCode}"  class="input-text required-entry validate-number"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>โทรศัพท์-1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyTel1" value="${company.Company_Tel1}"  class="input-text required-entry validate-phoneStrict"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรศัพท์-2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyTel2" value="${company.Company_Tel2}"   class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรศัพท์-3:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyTel3" value="${company.Company_Tel3}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>โทรสาร-1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyFax1" value="${company.Company_Fax1}"  class="input-text required-entry validate-fax"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรสาร-2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyFax2" value="${company.Company_Fax2}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">โทรสาร-3:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyFax3" value="${company.Company_Fax3}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>Mobile-1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyMobile1" value="${company.Company_Mobile1}"  class="input-text required-entry validate-phoneLax"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Mobile-2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyMobile2" value="${company.Company_Mobile2}"  class="input-text"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">Mobile-3:</label>

                                                                            <div class="input-box">
                                                                                <input type="text" name="companyMobile3" value="${company.Company_Mobile3}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>E-mail-บริษัท1:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyEmail1" value="${company.Company_Email1}"  class="input-text required-entry validate-email"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right">E-mail-บริษัท2:</label>
                                                                            <div class="input-box">
                                                                                <input type="text" name="companyEmail2" value="${company.Company_Email2}"  class="input-text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>E-mail-รับแจ้ง order:</label>

                                                                            <div class="input-box">
                                                                                <input type="text" name="companyEmail3" value="${company.Company_Email3}"  class="input-text required-entry validate-email"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fields">
                                                                    <div class="customer-name">
                                                                        <div class="field name-firstname">
                                                                            <label align="right"class="required"><em>*</em>แสดงภาษา:</label>
                                                                            <div class="select option">
                                                                                <select name="languageFlag">
                                                                                    <option <c:if test="${company.Language_Flag == 'T'}"> selected</c:if> value="T" >Thai</option>
                                                                                    <option <c:if test="${company.Language_Flag == 'E'}"> selected</c:if> value="E">English</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <p class="required" style="text-align: left"> * ข้อมูลที่จำเปนต้องหรอก</p>
                                                                <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                                <button type="button" class="button" onClick="window.location='orderHeader.jsp'" ><span><span>กลับ</span></span></button>
                                                            </ul>
                                                        </div>
                                                    </c:forEach>
                                                </form>
                                            </c:if>

                                            <script type="text/javascript">
                                                var dataForm = new VarienForm('form-validate', true);
                                            </script>
                                            <br/><br/><br/><br/>
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
