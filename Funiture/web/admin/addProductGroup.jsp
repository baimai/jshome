<%--
    Document   : jshome_AddProductGroup
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.productGroupId!=null}">
    <sql:query var="query" dataSource="webdb">
        SELECT *
        FROM product_group_master pgm
        where pgm.Product_Group_Id =  ${param.productGroupId}
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

                                        <c:if test="${param.productGroupId==null}" >
                                            <form action="productGroup.do" method="post" id="form-validate"  enctype="multipart/form-data" >
                                                <input type="hidden" name="action" value="Add" />
                                                <div class="fieldset">
                                                    <h2 class="legend">เพิ่มกลุ่มสินค้า</h2>
                                                    <img src="images/line.jpg" width="580" height="" alt=""/>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสกลุ่มสินค้า : </label>
                                                                    <input type="text" name="productGroupCode" value=""class="input-text required-entry " />
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>ชื่อกลุ่มสินค้า(ไทย) :</label>
                                                                    <input type="text" name="productGNameT" value="" class="input-text required-entry " /></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >ชื่อกลุ่มสินค้า(อังกฤษ) :</label>
                                                                    <input type="text" name="productGNameE" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >Path เก็บรูป Icon :</label>
                                                                    <input type="file" name="upload" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >สถานะกลุ่มสินค้า :</label>
                                                                    <select name="productGDisplayFlag" class="select">
                                                                        <option value="Y"> แสดงกลุ่มสินค้า</option>
                                                                        <option value="N"> ไม่แสดงกลุ่มสินค้า</option>
                                                                        <option value="A">กลุ่มสินค้าโฆษณา </option>
                                                                    </select></div>

                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >หมายเหตุ(ไทย) :</label>
                                                                    <textarea name="productRemarkT" rows="2" cols="20"
                                                                              class="input-text"></textarea></div>
                                                            </div>
                                                        </li>


                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >หมายเหตุ(อังกฤษ) :</label>
                                                                    <textarea name="productRemarkE" rows="2" cols="20"
                                                                              class="input-text"></textarea></div>
                                                            </div>
                                                        </li>

                                                        <!--

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >วันที่สร้าง :</label>
                                                                    <td><input type="text" name="createDate" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>


                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >วันที่ปรับปรุง :</label>
                                                                    <input type="text" name="updateDate" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >รหัสผู้ใช้ :</label>
                                                                    <input type="text" name="userId" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li> -->
                                                        <p class="required" style="text-align: left"> * ข้อมูลที่จำเปนต้องหรอก</p>
                                                        <button name="action" value="Add" class="button" ><span><span>บันทึก</span></span></button>
                                                        <button type="button" class="button" onClick="window.location='ProductGroup.jsp'" ><span><span>กลับ</span></span></button>
                                                    </ul>
                                                </div>
                                            </form>
                                        </c:if>

                                        <c:if test="${param.productGroupId!=null}" >
                                            <form action="productGroup.do" method="post" id="form-validate"  enctype="multipart/form-data" >
                                                <c:forEach var="productGroup" items="${query.rows}" >

                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="productGroupId" value="${productGroup.Product_Group_Id}"/>

                                                    <div class="fieldset">

                                                        <h2 class="legend">แก้ไขกลุ่มสินค้า</h2>
                                                        <img src="images/line.jpg" width="580" height="" alt=""/>

                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <!-- <label for="firstname" class="required">รหัสกลุ่มสินค้า <em>*</em>:</label> -->
                                                                        <label for="firstname" class="required">รหัสกลุ่มสินค้า:<em>*</em></label>
                                                                        <input type="text" name="productGroupCode" value="${productGroup.product_Group_Code}"  class="input-text" readonly/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required">ชื่อกลุ่มสินค้า(ไทย):<em>*</em></label>
                                                                        <input type="text" name="productGNameT" value="${productGroup.product_G_Name_T}" class="input-text required-entry" /></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ชื่อกลุ่มสินค้า(อังกฤษ) :</label>
                                                                        <input type="text" name="productGNameE" value="${productGroup.product_G_Name_E}" class="input-text"/></div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" > Icon :</label>
                                                                        <img src="../${productGroup.product_icon_loc}" class="input-text" /></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Path เก็บรูป Icon</label>
                                                                        <c:if test="${productGroup.product_icon_loc!=null&&productGroup.product_icon_loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${productGroup.product_icon_loc==null||productGroup.product_icon_loc==''}" >
                                                                            <label for="firstname" >Product Image</label>
                                                                        </c:if>
                                                                        <input type="file" name="upload" class="input-text"/></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >สถานะกลุ่มสินค้า :</label>
                                                                        <select name="productGDisplayFlag">
                                                                            <option value="Y"<c:if test="${productGroup.product_G_display_flag == 'Y'}"> selected</c:if>> แสดงกลุ่มสินค้า</option>
                                                                            <option value="N"<c:if test="${productGroup.product_G_display_flag == 'N'}"> selected</c:if>> ไม่แสดงกลุ่มสินค้า</option>
                                                                            <option value="A"<c:if test="${productGroup.product_G_display_flag == 'A'}"> selected</c:if>>กลุ่มสินค้าโฆษณา </option>
                                                                        </select></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >หมายเหตุ(ไทย) :</label>
                                                                        <textarea name="productRemarkT" rows="4" cols="20">${productGroup.Product_Remark_T}
                                                                        </textarea></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >หมายเหตุ(อังกฤษ) :</label>
                                                                        <textarea name="productRemarkE" rows="4" cols="20">${productGroup.Product_Remark_E}
                                                                        </textarea></div>
                                                                </div>
                                                            </li>

                                                            <!--

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >วันที่สร้าง :</label>
                                                                        <input type="text" name="createDate" value="${productGroup.Create_Date}" class="input-text" readonly="readonly" />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >วันที่ปรับปรุง :</label>
                                                                        <input type="text" name="updateDate" value="${productGroup.Update_Date}" class="input-text" readonly="readonly" /></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >รหัสผู้ใช้ :</label>
                                                                        <input type="text" name="userId" value="${productGroup.User_Id}" class="input-text" readonly="readonly" /></div>
                                                                </div>
                                                            </li> -->
                                                            <p class="required" style="text-align: left"> * ข้อมูลที่จำเปนต้องหรอก</p>
                                                            <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                        <button type="button" class="button" onClick="window.location='ProductGroup.jsp'" ><span><span>กลับ</span></span></button>
                                                        </ul>

                                                    </c:forEach>
                                                </c:if>
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

