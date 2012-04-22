
<%-- 
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${param.productGroupId!=null}">
    <sql:query var="query" dataSource="webdb">
        SELECT pgm.Product_Group_Code,
        pgm.Product_G_Name_T,
        pgm.Product_G_Name_E,
        pgm.Product_Pic_Loc,
        pgm.Product_Icon_Loc,
        pgm.Product_Remark_T,
        pgm.Product_Remark_E,
        pgm.Product_G_Display_Flag,
        pgm.Create_Date,
        pgm.Update_Date,
        pgm.User_Id
        FROM product_group_master pgm
        where pgm.product_group_id =  ${param.productGroupId}
    </sql:query>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <link rel="stylesheet" type="text/css" href="css/validator.css" media="all">
        <script src="js/jquery-1.3.2.js" type="text/javascript"> </script>
        <script src="js/jquery.validate.js" type="text/javascript"> </script>
        <script src="js/jquery.validation.functions.js" type="text/javascript"> </script>

        <title>JSP Page</title>
        <script type="text/javascript">
            /* <![CDATA[ */
            jQuery(function(){
                jQuery("#ValidField").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "กรุณากรอกข้อมูล"
                });
                jQuery("#ValidNumber").validate({
                    expression: "if (!isNaN(VAL) && VAL) return true; else return false;",
                    message: "Please enter a valid number"
                });
                jQuery("#ValidInteger").validate({
                    expression: "if (VAL.match(/^[0-9]*$/) && VAL) return true; else return false;",
                    message: "Please enter a valid integer"
                });
                jQuery("#ValidDate").validate({
                    expression: "if (!isValidDate(parseInt(VAL.split('-')[2]), parseInt(VAL.split('-')[0]), parseInt(VAL.split('-')[1]))) return false; else return true;",
                    message: "Please enter a valid Date"
                });
                jQuery("#ValidEmail").validate({
                    expression: "if (VAL.match(/^[^\\W][a-zA-Z0-9\\_\\-\\.]+([a-zA-Z0-9\\_\\-\\.]+)*\\@[a-zA-Z0-9_]+(\\.[a-zA-Z0-9_]+)*\\.[a-zA-Z]{2,4}$/)) return true; else return false;",
                    message: "Please enter a valid Email ID"
                });
                jQuery("#ValidPassword").validate({
                    expression: "if (VAL.length > 5 && VAL) return true; else return false;",
                    message: "Please enter a valid Password"
                });
                jQuery("#ValidConfirmPassword").validate({
                    expression: "if ((VAL == jQuery('#ValidPassword').val()) && VAL) return true; else return false;",
                    message: "Confirm password field doesn't match the password field"
                });
                jQuery("#ValidSelection").validate({
                    expression: "if (VAL != '0') return true; else return false;",
                    message: "Please make a selection"
                });
                jQuery("#ValidMultiSelection").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please make a selection"
                });
                jQuery("#ValidRadio").validate({
                    expression: "if (isChecked(SelfID)) return true; else return false;",
                    message: "Please select a radio button"
                });
                jQuery("#ValidCheckbox").validate({
                    expression: "if (isChecked(SelfID)) return true; else return false;",
                    message: "Please check atleast one checkbox"
                });
                jQuery('.AdvancedForm').validated(function(){
                    alert("Use this call to make AJAX submissions.");
                });
            });
            /* ]]> */
        </script>
        <style type="text/css">
            .adHeadline {font: bold 10pt Arial; text-decoration: underline; color: #003366;}
            .adText {font: normal 10pt Arial; text-decoration: none; color: #000000;}
        </style>
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

                                        <form action="productGroup.do" method="post" enctype="multipart/form-data" >
                                            <%--<div class="warning_box">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.
                                            </div>--%>
                                            <c:if test="${param.valid==1}"><div class="valid_box">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                            <c:if test="${param.error==1}"><div class="error_box">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
                                            <c:if test="${param.productGroupId==null}" >
                                                <input type="hidden" name="action" value="Add" />
                                                <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                <table border="1"  width="90%">

                                                    <tbody>
                                                        <tr>
                                                            <td align="right" width="45%">รหัสกลุ่มสินค้า <em>*</em>:</td>
                                                            <td width="45%" align="left"><input type="text" name="productGroupCode" value="" id="ValidField"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">ชื่อกลุ่มสินค้า(ไทย) :</td>
                                                            <td><input type="text" name="productGNameT" value="" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">ชื่อกลุ่มสินค้า(อังกฤษ) :</td>
                                                            <td><input type="text" name="productGNameE" value="" /></td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right">Path เก็บรูป Icon :</td>
                                                            <td><input type="file" name="upload" value="" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">สถานะกลุ่มสินค้า :</td>
                                                            <td><select name="productGDisplayFlag">
                                                                    <option value="Y"> แสดงกลุ่มสินค้า</option>
                                                                    <option value="N"> ไม่แสดงกลุ่มสินค้า</option>
                                                                    <option value="A">กลุ่มสินค้าโฆษณา </option>
                                                                </select></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">หมายเหตุ(ไทย) :</td>
                                                            <td><textarea name="productRemarkT" rows="4" cols="20">
                                                                </textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">หมายเหตุ(อังกฤษ) :</td>
                                                            <td><textarea name="productRemarkE" rows="4" cols="20">
                                                                </textarea></td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right">วันที่สร้าง :</td>
                                                            <td><input type="text" name="createDate" value="" readonly="readonly" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">วันที่ปรับปรุง :</td>
                                                            <td><input type="text" name="updateDate" value="" readonly="readonly" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">รหัสผู้ใช้ :</td>
                                                            <td><input type="text" name="userId" value="" readonly="readonly" /></td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </c:if>
                                            <c:if test="${param.productGroupId!=null}" >
                                                <c:forEach var="productGroup" items="${query.rows}" >
                                                    <center></center>
                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="productGroupId" value="${productGroup.product_group_id}"/>
                                                    
                                                  
                                                    <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                    <table border="1"  width="90%">

                                                        <tbody>
                                                            <tr>
                                                                <td align="right" width="45%">รหัสกลุ่มสินค้า <em>*</em>:</td>
                                                                <td width="45%" align="left"><input type="text" name="productGroupCode" value="${productGroup.product_Group_Code}" readonly/></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">ชื่อกลุ่มสินค้า(ไทย) :</td>
                                                                <td><input type="text" name="productGNameT" value="${productGroup.product_G_Name_T}" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">ชื่อกลุ่มสินค้า(อังกฤษ) :</td>
                                                                <td><input type="text" name="productGNameE" value="${productGroup.product_G_Name_E}" /></td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right">Path เก็บรูป Icon :</td>
                                                                <td><img src="../${productGroup.product_icon_loc}" width="150" height="200" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">Product Image</td>
                                                                        <c:if test="${productGroup.product_icon_loc!=null&&productGroup.product_icon_loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${productGroup.product_icon_loc==null||productGroup.product_icon_loc==''}" >
                                                                            <td align="right">Product Image</td>
                                                                        </c:if>
                                                                       <td> <input type="file" name="upload" class="input-text"/></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">สถานะกลุ่มสินค้า :</td>
                                                                <td><select name="productGDisplayFlag">
                                                                        <option value="Y"<c:if test="${productGroup.product_G_display_flag == 'Y'}"> selected</c:if>> แสดงกลุ่มสินค้า</option>
                                                                        <option value="N"<c:if test="${productGroup.product_G_display_flag == 'N'}"> selected</c:if>> ไม่แสดงกลุ่มสินค้า</option>
                                                                        <option value="A"<c:if test="${productGroup.product_G_display_flag == 'A'}"> selected</c:if>>กลุ่มสินค้าโฆษณา </option>
                                                                    </select></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">หมายเหตุ(ไทย) :</td>
                                                                <td><textarea name="productRemarkT" rows="4" cols="20">${productGroup.Product_Remark_T}
                                                                    </textarea></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">หมายเหตุ(อังกฤษ) :</td>
                                                                <td><textarea name="productRemarkE" rows="4" cols="20">${productGroup.Product_Remark_E}
                                                                    </textarea></td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right">วันที่สร้าง :</td>
                                                                <td><input type="text" name="createDate" value="${productGroup.Create_Date}" readonly="readonly" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">วันที่ปรับปรุง :</td>
                                                                <td><input type="text" name="updateDate" value="${productGroup.Update_Date}" readonly="readonly" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">รหัสผู้ใช้ :</td>
                                                                <td><input type="text" name="userId" value="${productGroup.User_Id}" readonly="readonly" /></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                </c:forEach>
                                            </c:if>

                                        </form>



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

