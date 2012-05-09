<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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
    SELECT * FROM unit_master u;
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <title>JSP Page</title>
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
                                        <form action="productDetail.do" method="post" enctype="multipart/form-data" >
                                            <%--<div class="warning_box">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.
                                            </div>--%>
                                            <c:if test="${param.valid==1}"><div class="valid_box">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                            <c:if test="${param.error==1}"><div class="error_box">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
                                            <c:if test="${param.productDetailId==null}" >
                                                <input type="hidden" name="action" value="Add" />
                                                <input type="hidden" value="0" name="qtyminus" />
                                                <div class="buttons-set">
                                                    <p class="required">* ข้อมูลที่จำเปนต้องหรอก</p>
                                                    <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>

                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">ตั้งค่า</h2>

                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>Product Group </label>
                                                                    <select name="productGroupId" class="select"  class="input-text required-entry ">
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
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> Product Code </label>
                                                                    <input name="productCode" id="productCode" type="text" class="input-text required-entry" />
                                                                </div>
                                                            </div>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class=" field name-firstname">
                                                                    <label for="firstname" >Model Code</label>
                                                                    <input name="productModelCode" id="productCode" type="text" class="input-text"  />
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" > Color</label>
                                                                    <select name="colorId"  class="select">
                                                                        <c:forEach items="${query2.rows}" var="color" >
                                                                            <option value="${color.Color_Id}">${color.colorName}</option>
                                                                        </c:forEach>
                                                                    </select></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >Product Max Sale</label>
                                                                    <input name="productMaxSale" type="text" class="input-text" /></div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >Product Image</label>
                                                                    <input type="file" name="upload" class="input-box" /></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">

                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname">Product Display</label>

                                                                    <select name="display" class="select">
                                                                        <option value="Y">Show</option>
                                                                        <option value="N">Not Show</option>
                                                                        <option value="A">Show on Slide</option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname">Quatity</label>
                                                                    <input type="text"  value="0" class="input-text"  name="qtyplus" />


                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div  class="field number">
                                                                    <label for="firstname">หน่วย</label>
                                                                    <select name="unitId" class="select">
                                                                        <c:forEach  items="${query4.rows}" var="unit">
                                                                            <option value="${unit.unit_id}">${unit.unit_name_t}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">ราคา</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname"class="required"><em>*</em>  Price 1</label>
                                                                    <input name="price1" type="text"  class="input-text required-entry"/>

                                                                    Baht (ราคาขายส่ง)

                                                                </div>
                                                            </div>

                                                        </li>

                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Price 2</label>
                                                                    <input name="price2" type="text"  class="input-text"/> Baht (ราคาขายส่ง Promotion)
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname"> Price 3</label>
                                                                    <input name="price3" type="text"  class="input-text" /> Baht (ราคาขายปลีก)
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Price 4</label>
                                                                    <input name="price4" type="text"  class="input-text"/> Baht (ราคาขายปลีก Promotion)
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">ชื่อและ speck</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>   Product Name T </label>
                                                                    <input name="nameTh" type="text" class="input-text required-entry" />
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname"> Product Name E  </label>
                                                                    <input name="nameEn" type="text" class="input-text required-entry" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">คุณสมบัติของสินค้า</label>
                                                                    <textarea name="spect1Th" cols="25" rows="2"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Product Spect  1 E</label>
                                                                    <textarea name="spect1En" cols="30" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">โครงสร้างสินค้า 1</label>
                                                                    <textarea name="spect2Th" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Product Spect  2 E</label>
                                                                    <textarea name="spect2En" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">โครงสร้างสินค้า 2</label>
                                                                    <textarea name="spect3Th" cols="25" rows="2" class="input-text"></textarea>
                                                                </div> </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Product Spect 3 E</label>
                                                                    <textarea name="spect3En" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">ขนาดสินค้า 1</label>
                                                                    <textarea name="spect4Th" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Product Spect 4 E</label>
                                                                    <textarea name="spect4En" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">ขนาดสินค้า 2</label>
                                                                    <textarea name="spect5Th" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Product Spect 5 E</label>
                                                                    <textarea name="spect5En" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">สีของสินค้า</label>
                                                                    <textarea name="spect6Th" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Product Spect 6 E</label>
                                                                    <textarea name="spect6En" cols="25" rows="2" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Remark T</label>
                                                                    <textarea name="remarkTh" cols="25" rows="3" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname">Remark E</label>
                                                                    <textarea name="remarkEn" cols="25" rows="3" class="input-text"></textarea>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </c:if>
                                            <c:if test="${param.productDetailId!=null}" >


                                                <c:forEach var="product" items="${query3.rows}" >
                                                    <center><img src="../${product.product_d_pic_loc}" width="150" height="200" /></center>
                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="productDetailId" value="${product.product_detail_id}"/>
                                                    <input type="hidden" name="product_d_pic_loc" value="${product.product_d_pic_loc}"/>
                                                    <div class="buttons-set">
                                                        <p class="required">* ข้อมูลที่จำเปนต้องหรอก</p>

                                                        <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                    </div>
                                                    <div class="fieldset">
                                                        <h2 class="legend">ตั้งค่า</h2>
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>Product Group</label>
                                                                        <select name="productGroupId" class="select required-entry">
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
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>Product Code</label>
                                                                        <input name="productCode" class="input-text " value="${product.product_code}" readonly/>
                                                                    </div>
                                                                </div>

                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Model Code</label>
                                                                        <input name="productModelCode" type="text" class="input-text" value="${product.product_model_code}"/>
                                                                    </div>
                                                                </div>


                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Color</label>

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
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Max Sale</label>
                                                                        <input name="productMaxSale" type="text" class="input-text"  value="${product.product_max_sale}"/>
                                                                    </div>
                                                                </div>

                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Image</label>
                                                                        <input type="text" name="uploadtmp" value="${product.product_d_pic_loc}" class="input-text" readonly/>
                                                                    </div>
                                                                </div>

                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Image</label>
                                                                        <c:if test="${product.product_d_pic_loc!=null&&product.product_d_pic_loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${product.product_d_pic_loc==null||product.product_d_pic_loc==''}" >
                                                                            <label for="firstname" >Product Image</label>
                                                                        </c:if>
                                                                        <input type="file" name="upload" class="input-text"/></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Display</label>

                                                                        <select name="display" class="select">
                                                                            <option value="Y" <c:if test="${product.product_d_display_flag == 'Y'}"> selected</c:if> >Show</option>
                                                                            <option value="N" <c:if test="${product.product_d_display_flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                            <option value="A" <c:if test="${product.product_d_display_flag == 'A'}"> selected</c:if>>Show on Slide</option>
                                                                        </select></div>
                                                                </div>

                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Quatity</label>

                                                                        <c:if test="${product.balance != null && product.balance != ''}">
                                                                            <input type="text" class="input-text" value="${product.balance}" name="qtyold" size="5" disabled/>
                                                                        </c:if>
                                                                        <c:if test="${product.balance == null || product.balance == ''}">
                                                                            <input type="text" class="input-text" value="0" name="qtyold" size="5" disabled/>
                                                                        </c:if>
                                                                    </div>

                                                                </div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >หน่วยนับ</label>
                                                                        <select name="unitId">
                                                                            <c:forEach  items="${query4.rows}" var="unit">
                                                                                <option value="${unit.unit_id}">${unit.unit_name_t}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                        <!-- &nbsp;&nbsp;&nbsp; เพิ่ม <input type="text" name="qtyplus" value="0" size="5"/>
                                                                         &nbsp;&nbsp;&nbsp; ลด <input type="text" name="qtyminus" value="0" size="5"/>-->
                                                                    </div>

                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="fieldset">
                                                        <h2 class="legend">ราคา</h2>
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>Price 1</label>
                                                                        <input name="price1" type="text" class="input-text required-entry"  value="${product.product_Price1}"/> Baht (ราคาขายส่ง)</div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Price 2</label>
                                                                        <input name="price2" type="text" class="input-text"  value="${product.product_Price2}"/> Baht (ราคาขายส่ง Promotion)</div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Price 3</label>
                                                                        <input name="price3" type="text" class="input-text"  value="${product.product_Price3}"/> Baht (ราคาขายปลีก)</div>
                                                                </div></li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Price 4</label>
                                                                        <input name="price4" type="text" class="input-text"  value="${product.product_Price4}"/> Baht (ราคาขายปลีก Promotion)</div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <div class="fieldset">
                                                        <h2 class="legend">ราคา</h2>
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>Product Name T</label>
                                                                        <input name="nameTh" type="text" class="input-text required-entry" value="${product.product_d_name_t}"/>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"><em>*</em>  Product Name E</label>
                                                                        <input name="nameEn" type="text" class="input-text required-entry" value="${product.product_d_name_e}"/>
                                                                    </div> </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >คุณสมบัติของสินค้า</label>
                                                                        <textarea name="spect1Th" cols="25" rows="2" >${product.product_spec1_t}</textarea></div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Spect 1 E</label>
                                                                        <textarea name="spect1En" cols="25" rows="2">${product.product_spec1_e}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >โครงสร้างสินค้า 1</label>
                                                                        <textarea name="spect2Th" cols="25" rows="2">${product.product_spec2_t}</textarea></div></div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Spect 2 E</label>
                                                                        <textarea name="spect2En" cols="25" rows="2">${product.product_spec2_e}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >โครงสร้างสินค้า 2</label>
                                                                        <textarea name="spect3Th" cols="25" rows="2">${product.product_spec3_t}</textarea></div></div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Spect 3 E</label>
                                                                        <textarea name="spect3En" cols="25" rows="2">${product.product_spec3_e}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ขนาดสินค้า 1</label>
                                                                        <textarea name="spect4Th" cols="25" rows="2">${product.product_spec4_t}</textarea></div></div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Spect 4 E</label>
                                                                        <textarea name="spect4En" cols="25" rows="2">${product.product_spec4_e}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ขนาดสินค้า 2</label>
                                                                        <textarea name="spect5Th" cols="25" rows="2">${product.product_spec5_t}</textarea></div></div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Spect 5 E</label>
                                                                        <textarea name="spect5En" cols="25" rows="2">${product.product_spec5_e}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >สีของสินค้า </label>
                                                                        <textarea name="spect6Th" cols="25" rows="2">${product.product_spec6_t}</textarea></div></div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Product Spect 6 E</label>
                                                                        <textarea name="spect6En" cols="25" rows="2">${product.product_spec6_e}</textarea></div></div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Remark T</label>
                                                                        <textarea name="remarkTh" cols="25" rows="3">${product.product_d_remark_t}</textarea></div></div>
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Remark E</label>
                                                                        <textarea name="remarkEn" cols="25" rows="3">${product.product_d_remark_e}</textarea></div></div>
                                                            </li>




                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </c:if>

                                        </form>


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

    </body>
</html>

