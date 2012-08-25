<%--
    Document   : jshome_AddProductSetup
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${param.picId != null}">
    <sql:query var="query" dataSource="webdb">
        SELECT * from pic_product_setup pps       
        where pps.Pic_Id = ${param.picId}
    </sql:query>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <link rel="stylesheet" type="text/css" media="screen" href="jqgrid4.2/themes/redmond/jquery-ui-1.8.1.custom.css" />
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
    <body >
        <div id="art-main">
            <div class="art-sheet">
                <div class="art-sheet-bl"></div>
                <div class="art-sheet-br"></div>
                <div class="art-sheet-bc"></div>
                <div class="art-sheet-cl"></div>
                <div class="art-sheet-cr"></div>
                <div class="art-sheet-cc"></div>
                <div class="art-sheet-body">
                    <jsp:include page="header.jsp"/>  <br><br>
                    <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>จัดการรูปแสดงสินค้า</h1>
                                        </div>
                                        <c:if test="${param.valid==1}"><div class="success-msg" style="background-color: lightgreen; ">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                        <c:if test="${param.error==1}"><div class="messager-error" style="background-color: #EB340A;">ไม่สามารถบันทึกข้อมูลได้</div></c:if>

                                        <c:if test="${param.picId == null}" >
                                            <form action="productSetup.do" method="post" id="form-validate" >
                                                <input type="hidden" name="action" value="Add" />
                                                <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                <div class="fieldset">
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสลำดับแสดงสินค้า : </label>
                                                                    <input type="text" value="" id="picCode" name="picCode"  class="input-text required-entry " /></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>คำอธิบาย(ไทย) :</label>
                                                                    <input type="text" value="" id="picNameT" name="picNameT" value=""class="input-text required-entry " /></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >คำอธิบาย(อังกฤษ) :</label>
                                                                    <input type="text" value="" id="picNameE" name="picNameE" class="input-text"/></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname">หมายเหตุ(ไทย) :</label>
                                                                    <textarea name="productRemarkT" rows="2" cols="20"  class="input-text" ></textarea></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname"> หมายเหตุ(อังกฤษ) :</label>
                                                                    <textarea name="productRemarkE" rows="2" cols="20"  class="input-text" ></textarea></div>
                                                            </div>
                                                    </ul>
                                                </div>
                                            </form>
                                        </c:if>
                                        <c:if test="${param.picId != null}" >
                                            <form action="productSetup.do" method="post" id="form-validate"  >
                                                <c:forEach var="productSetup" items="${query.rows}">
                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="picId" value="${productSetup.Pic_Id}"/>
                                                    <div >
                                                        <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                    </div>
                                                    <div class="fieldset">
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสลำดับแสดงสินค้า :</label>
                                                                    <input type="text" value="${productSetup.Pic_Code}" id="picCode" name="picCode" class="input-text required-entry " readonly /></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>คำอธิบาย(ไทย) :</label>
                                                                    <input type="text" value="${productSetup.Pic_Name_T}" id="picNameT" name="picNameT" class="input-text required-entry " /></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >คำอธิบาย(อังกฤษ) :</label>
                                                                    <input type="text" value="${productSetup.Pic_Name_E}" id="picNameE" name="picNameE" class="input-text "  /></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname">หมายเหตุ(ไทย) :</label>

                                                                    <textarea name="picRemarkT" rows="2" cols="20" value="${productSetup.Pic_Remark_T}" class="input-text" ></textarea></div>

                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname"> หมายเหตุ(อังกฤษ) :</label>

                                                                   <textarea name="picRemarkT" rows="2" cols="20" value="${productSetup.Pic_Remark_T}"  class="input-text" ></textarea></div>
                                                            </div>
                                                        </li>
                                                    </ul> </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
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
