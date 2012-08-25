<%--
    Document   : jshome_ProductDetail
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.productDetailId!=null}">
    <sql:query var="query3" dataSource="webdb">
        SELECT pdm.*,cm.company_code,pgm.product_group_code,ccm.color_code,sm.quantity,sb.balance  FROM product_detail_master pdm
        left join company_master cm on cm.company_id = pdm.company_id
        left join product_group_master pgm on pgm.product_group_id = pdm.product_group_id
        left join color_code_master ccm on ccm.color_id = pdm.product_color_id
        left join stock_master sm on sm.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = sm.product_detail_id
        where pdm.product_detail_id =  ${param.productDetailId}
    </sql:query>
</c:if>

<sql:query var="query1" dataSource="webdb">
    SELECT pgm.product_g_name_t as groupName,pgm.product_group_id FROM product_group_master pgm
</sql:query>

<sql:query var="query2" dataSource="webdb">
    SELECT concat(cc.color_name_t) as colorName,cc.color_id FROM color_code_master cc
</sql:query>

<sql:query var="query4" dataSource="webdb">
    select u.unit_name_t as unitname , u.unit_id  from unit_master u
</sql:query>

<sql:query var="query5" dataSource="webdb">
    SELECT * FROM sale_discount_h_master sdh
</sql:query>

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

                                        <c:if test="${param.productDetailId==null}" >
                                            <form action="productDetail.do" method="post" id="form-validate" enctype="multipart/form-data" >

                                                <input type="hidden" name="action" value="Add" />
                                                <input type="hidden" value="0" name="qtyminus" />


                                                <div class="fieldset">
                                                    <h2 class="legend">เพิ่มรายการสินค้า</h2>
                                                    <img src="images/line.jpg" width="580" height="" alt=""/>

                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสกลุ่มสินค้า:</label>
                                                                    <select name="productGroupId" class="select"  class="input-text required-entry  ">
                                                                        <c:forEach items="${query1.rows}" var="group">
                                                                            <c:if test="${param.productGroupId != group.product_group_id}">
                                                                                <option value="${group.product_group_id}" >${group.product_g_name_t}</option>
                                                                            </c:if>
                                                                            <c:if test="${param.productGroupId == group.product_group_id}">
                                                                                <option value="${group.product_group_id}" selected>${group.product_g_name_t}</option>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> รหัสสินค้า:</label>
                                                                    <input name="productCode" id="productCode" type="text" class="input-text required-entry " />
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div  class=" field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสสินค้าต้นทาง:</label>
                                                                    <input name="productModelCode"  type="text" class="input-text required-entry "  />  
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> ชื่อสินค้า(ไทย):</label>
                                                                    <input name="nameTh" type="text" class="input-text required-entry " />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">  ชื่อสินค้า(อังกฤษ): </label>
                                                                    <input name="nameEn" type="text" class="input-text " />
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >สีของสินค้า:</label>
                                                                    <select name="colorId"  class="select">
                                                                        <c:forEach items="${query2.rows}" var="color" >
                                                                            <option value="${color.Color_Id}">${color.colorName}</option>
                                                                        </c:forEach>
                                                                    </select></div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> จำนวน:</label>
                                                                    <input type="text"  value="0" class="input-text required-entry validate-number"  name="qtyplus" style="text-align:right;"/>
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div  class="field number">
                                                                    <label for="firstname" class="required"><em>*</em> หน่วย:</label>
                                                                    <select name="unitId" class="select required-entry ">
                                                                        <c:forEach  items="${query4.rows}" var="unit">
                                                                            <option value="${unit.unit_id}">${unit.unit_Name_T}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> Path เก็บรูปภาพ:</label>
                                                                    <input type="file" name="upload" class="input-box required-entry" /></div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname">รูป Icon:</label>
                                                                    <input type="file" name="uploadIcon" class="input-box" />
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname"class="required"><em>*</em>สถานะสินค้า:</label>
                                                                    <select name="display" class="select required-entry ">
                                                                        <option value="Y">Show</option>
                                                                        <option value="N">Not Show</option>
                                                                        <option value="A">Show on Slide</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> คุณสมบัติ(ไทย):</label>
                                                                    <textarea   name="productSpect1_T" cols="25" rows="1" class="input-textarea required-entry "></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">คุณสมบัติ(อังกฤษ):</label>
                                                                    <textarea name="productSpect1_E" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> โครงสร้างสินค้า-1(ไทย):</label>
                                                                    <textarea name="productSpect2_T"  cols="25" rows="1" class="input-text required-entry"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">โครงสร้างสินค้า-1(อังกฤษ):</label>
                                                                    <textarea name="productSpect2_E" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">ขนาดสินค้า-1(ไทย):</label>
                                                                    <textarea name="productSpect4_T" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">ขนาดสินค้า-1(อังกฤษ):</label>
                                                                    <textarea name="productSpect4_E" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">สี(ไทย):</label>
                                                                    <textarea name="productSpect6_T" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">สี(อังกฤษ):</label>
                                                                    <textarea name="productSpect6_E" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">หมายเหตุ(ไทย):</label>
                                                                    <textarea name="productDRemarkT" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">หมายเหตุ(อังกฤษ):</label>
                                                                    <textarea name="productDRemarkE" cols="25" rows="1" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">ราคา</h2>
                                                    <img src="images/line.jpg" width="580" height="" alt=""/>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname"class="required"><em>*</em> ราคาขายส่ง:</label>
                                                                    <input name="price1" type="text" align="middle" class="input-text  required-entry validate-number" style="text-align:right;" />
                                                                    Baht (ราคาขายส่ง)
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">ราคาขายส่ง-Pro:</label>
                                                                    <input name="price2" type="text"  class="input-text validate-number" style="text-align:right;"/> Baht (ราคาขายส่ง Promotion)
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">ราคาขายปลีก:</label>
                                                                    <input name="price3" type="text"  class="input-text validate-number" style="text-align:right;" /> Baht (ราคาขายปลีก)
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">ราคาขายปลีก-Pro:</label>
                                                                    <input name="price4" type="text"  class="input-text validate-number" style="text-align:right;"/> Baht (ราคาขายปลีก Promotion)
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> รหัสส่วนลด:</label>
                                                                    <select name="discountId"  class="select required-entry validate-Login">
                                                                        <c:forEach items="${query5.rows}" var="discountId" >
                                                                            <option value="${discountId.discount_id}">${discountId.discount_Name_T}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <p class="required" style="float: left">* ข้อมูลที่จำเปนต้องหรอก</p>
                                                        <li class="fields">
                                                            <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </form>
                                        </c:if>


                                        <c:if test="${param.productDetailId!=null}" >
                                            <form action="productDetail.do" method="post" id="form-validate" enctype="multipart/form-data" >

                                                <c:forEach var="product" items="${query3.rows}" >

                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="productDetailId" value="${product.product_detail_id}"/>
                                                    <input type="hidden" name="product_d_pic_loc" value="${product.product_d_pic_loc}"/>
                                                    <input type="hidden" name="product_d_icon_loc" value="${product.product_d_icon_loc}"/>

                                                    <div class="fieldset">
                                                        <h2 class="legend">แก้ไขรายการสินค้า</h2>
                                                        <img src="images/line.jpg" width="580" height="" alt=""/>
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <img alt=""  src="../${product.product_d_pic_loc}" width="150" height="200" />
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>รหัสกลุ่มสินค้า:</label>
                                                                        <select name="productGroupId" class="select required-entry ">
                                                                            <c:forEach items="${query1.rows}" var="group" >
                                                                                <c:if test="${group.product_Group_Id == product.product_Group_Id }" >
                                                                                    <option value="${group.product_group_id}" selected>${group.product_g_name_t}</option>
                                                                                </c:if>
                                                                                <c:if test="${group.product_Group_Id != product.product_Group_Id }" >
                                                                                    <option value="${group.product_group_id}" >${group.product_g_name_t}</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >รหัสสินค้า:</label>
                                                                        <input name="productCode"  value="${product.product_code}" class="input-text "readonly/>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em> รหัสสินค้าต้นทาง:</label>
                                                                        <input name="productModelCode" type="text" value="${product.product_model_code}" class="input-text required-entry " />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>ชื่อสินค้า(ไทย):</label>
                                                                        <input name="nameTh" type="text" value="${product.product_d_name_t}" class="input-text required-entry " />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname">ชื่อสินค้า(อังกฤษ):</label>
                                                                        <input name="nameEn" type="text" class="input-text " value="${product.product_d_name_e}"/>
                                                                    </div> </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >สีของสินค้า:</label>

                                                                        <select name="colorId" class="select">
                                                                            <c:forEach items="${query2.rows}" var="color" >
                                                                                <c:if test="${color.color_Id == product.product_color_Id }" >
                                                                                    <option value="${color.Color_Id}" selected>${color.colorName}</option>
                                                                                </c:if>
                                                                                <c:if test="${color.color_Id != product.product_color_Id }" >
                                                                                    <option value="${color.Color_Id}">${color.colorName}</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select></div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em> จำนวน:</label>

                                                                        <c:if test="${product.balance != null && product.balance != ''}">
                                                                            <input type="text" class="input-text" value="${product.balance}" name="qtyold" size="5" disabled  style="text-align:right;" />
                                                                        </c:if>
                                                                        <c:if test="${product.balance == null || product.balance == ''}">
                                                                            <input type="text" class="input-text" value="0" name="qtyold" size="5" disabled  />
                                                                        </c:if>
                                                                    </div>

                                                                </div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>หน่วยนับ:</label>
                                                                        <select name="unitId" class="select ">
                                                                            <c:forEach items="${query4.rows}" var="unitId" >
                                                                                <c:if test="${unitId.unit_id == product.unit_id }" >
                                                                                    <option value="${unitId.unit_id}" selected>${unitId.unit_name_t}</option>
                                                                                </c:if>
                                                                                <c:if test="${unitId.unit_id != product.unit_id }" >
                                                                                    <option value="${unitId.unit_id}" >${unitId.unit_name_t}</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">

                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Path เก็บรูปภาพ:</label>
                                                                        <c:if test="${product.product_d_pic_loc!=null&&product.product_d_pic_loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${product.product_d_pic_loc==null||product.product_d_pic_loc==''}" >
                                                                            <label for="firstname" >Product Image:</label>
                                                                        </c:if>
                                                                        <input type="file" name="upload" class="input-text"/></div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <!-- <img alt=""  src="../${product.Product_D_Icon_Loc}" width="24" height="24" /> -->
                                                                        
                                                                        <c:if test="${product.Product_D_Icon_Loc!=null&&product.Product_D_Icon_Loc!=''}" >
                                                                            <label for="firstname">รูป Icon:</label>
                                                                        </c:if>
                                                                        <c:if test="${product.Product_D_Icon_Loc==null||product.Product_D_Icon_Loc==''}" >
                                                                            <label for="firstname">รูป Icon:</label>
                                                                        </c:if>
                                                                        <input type="file" name="uploadIcon" value="" class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em> สถานะสินค้า:</label>

                                                                        <select name="display" class="select required-entry">
                                                                            <option value="Y" <c:if test="${product.product_d_display_flag == 'Y'}"> selected</c:if> >Show</option>
                                                                            <option value="N" <c:if test="${product.product_d_display_flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                            <option value="A" <c:if test="${product.product_d_display_flag == 'A'}"> selected</c:if>>Show on Slide</option>
                                                                        </select></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em> คุณสมบัติ(ไทย):</label>
                                                                        <textarea name="productSpect1_T" cols="25" rows="1"  class="input-text required-entry ">${product.product_spec1_T}</textarea></div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >คุณสมบัติ(อังกฤษ):</label>
                                                                        <textarea name="productSpect1_E" cols="25" rows="1">${product.product_spec1_E}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em> โครงสร้างสินค้า-1(ไทย):</label>
                                                                        <textarea name="productSpect2_T" cols="25" rows="1"  class="input-text required-entry ">${product.product_spec2_T}</textarea></div></div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >โครงสร้างสินค้า-1(อังกฤษ):</label>
                                                                        <textarea name="productSpect2_E" cols="25" rows="1">${product.product_spec2_E}</textarea></div></div>
                                                            </li>
                                                            <!---<li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >โครงสร้างสินค้า 2</label>
                                                                        <textarea name="spect3Th" cols="25" rows="1">${product.product_spec3_T}</textarea></div></div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Spect 3 E</label>
                                                                        <textarea name="spect3En" cols="25" rows="2">${product.product_spec3_E}</textarea></div></div>
                                                            </li>-->
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ขนาดสินค้า-1(ไทย):</label>
                                                                        <textarea name="productSpect4_T" cols="25" rows="1">${product.product_spec4_T}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ขนาดสินค้า-1(อังกฤษ):</label>
                                                                        <textarea name="productSpect4_E" cols="25" rows="2">${product.product_spec4_E}</textarea></div></div>
                                                            </li>
                                                            <!--- <li class="fields">
                                                                 <div class="customer-name">
                                                                     <div   class="field name-firstname">
                                                                         <label for="firstname" >ขนาดสินค้า 2</label>
                                                                         <textarea name="spect5Th" cols="25" rows="2">${product.product_spec5_T}</textarea></div></div>
                                                                 <div class="customer-name">
                                                                     <div   class="field name-firstname">
                                                                         <label for="firstname" >Product Spect 5 E</label>
                                                                         <textarea name="spect5En" cols="25" rows="2">${product.product_spec5_E}</textarea></div></div>
                                                             </li>-->
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >สี(ไทย):</label>
                                                                        <textarea name="productSpect6_T" cols="25" rows="1">${product.product_spec6_T}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >สี(อังกฤษ):</label>
                                                                        <textarea name="productSpect6_E" cols="25" rows="1">${product.product_spec6_E}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >หมายเหตุ(ไทย):</label>
                                                                        <textarea name="productDRemarkT" cols="25" rows="1">${product.product_d_remark_T}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >หมายเหตุ(อังกฤษ):</label>
                                                                        <textarea name="productDRemarkE" cols="25" rows="1">${product.product_d_remark_E}</textarea></div></div>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <div class="fieldset">
                                                        <h2 class="legend">ราคา</h2>
                                                        <img src="images/line.jpg" width="580" height="" alt=""/>

                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>ราคาขายส่ง:</label>
                                                                        <input name="price1" type="text" value="${product.product_Price1}" class="input-text required-entry validate-number" style="text-align:right;" /> Baht (ราคาขายส่ง)</div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ราคาขายส่ง-Pro:</label>
                                                                        <input name="price2" type="text" value="${product.product_Price2}" class="input-text validate-number" style="text-align:right;"/> Baht (ราคาขายส่ง Promotion)</div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ราคาขายปลีก:</label>
                                                                        <input name="price3" type="text" value="${product.product_Price3}" class="input-text validate-number" style="text-align:right;" /> Baht (ราคาขายปลีก)</div>
                                                                </div></li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ราคาขายปลีก-Pro:</label>
                                                                        <input name="price4" type="text" value="${product.product_Price4}" class="input-text validate-number" style="text-align:right;" /> Baht (ราคาขายปลีก Promotion)</div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div  class="field name-firstname">
                                                                        <label for="firstname" class="required">รหัสส่วนลด:</label>
                                                                        <select name="discountId"  class="select required-entry">
                                                                            <c:forEach items="${query5.rows}" var="discountId" >
                                                                                <c:if test="${discountId.Discount_Id == product.discount_Id }" >
                                                                                    <option value="${discountId.discount_id}" selected>${discountId.discount_Name_T}</option>
                                                                                </c:if>
                                                                                <c:if test="${discountId.Discount_Id != product.discount_Id }" >
                                                                                    <option value="${discountId.discount_id}">${discountId.discount_Name_T}</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <p class="required" style="float: left">* ข้อมูลที่จำเปนต้องหรอก</p>
                                                            </li>
                                                            <li>
                                                                <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </form>
                                        </c:if>

                                        <script type="text/javascript">
                                            //<![CDATA[
                                            var dataForm = new VarienForm('form-validate', true);
                                            //]]>
                                        </script>

                                        <br><br>
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

