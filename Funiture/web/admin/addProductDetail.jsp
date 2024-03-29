<%--
    Document   : jshome_AddProductDetail
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.productDetailId!=null}">
    <sql:query var="query3" dataSource="webdb">
        SELECT pdm.*,cm.company_code,pgm.product_group_code,ccm.color_code  FROM product_detail_master pdm
        left join company_master cm on cm.company_id = pdm.company_id
        left join product_group_master pgm on pgm.product_group_id = pdm.product_group_id
        left join color_code_master ccm on ccm.color_id = pdm.product_color_id
        where product_detail_id =  ${param.productDetailId}
    </sql:query>  
</c:if>

<sql:query var="query1" dataSource="webdb">
    SELECT pgm.product_g_name_t as groupName,pgm.product_group_id FROM product_group_master pgm
</sql:query>

<sql:query var="query2" dataSource="webdb">
    SELECT cc.color_name_t as colorName,cc.color_id FROM color_code_master cc
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <c:if test="${param.valid==1}"><div class="success-msg" style="background-color: lightgreen; ">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
        <c:if test="${param.error==1}"><div class="messager-error" style="background-color: #EB340A;">ไม่สามารถบันทึกข้อมูลได้</div></c:if>

        <form action="productDetail.do" method="post" enctype="multipart/form-data" >

            <table border="0" width="700px" >
                <tr>
                    <td colspan="4" align="center"><h1> Add Product</h1></td>
                </tr>

                <c:if test="${param.productDetailId==null}" >
                    <input type="hidden" name="action" value="Add" />
                    <tr>
                        <td colspan="2" align="right" >Product Group</td>
                        <td colspan="2">
                            <select name="productGroupId">
                                <c:forEach items="${query1.rows}" var="group">
                                    <c:if test="${param.productGroupId != group.product_group_id}">
                                        <option value="${group.product_group_id}" >${group.product_g_name_t}</option>
                                    </c:if>
                                    <c:if test="${param.productGroupId == group.product_group_id}">
                                        <option value="${group.product_group_id}" selected>${group.product_g_name_t}</option>
                                    </c:if>
                                </c:forEach>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"align="right">Product Code</td>
                        <td colspan="2"><input name="productCode" id="productCode" type="text" size="10" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"align="right">Color</td>
                        <td colspan="2">
                            <select name="colorId">
                                <c:forEach items="${query.rows}" var="color" >
                                    <option value="${color.Color_Id}">${color.colorName}</option>
                                </c:forEach>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">Price 1</td>
                        <td colspan="2"><input name="price1" type="text" size="10"/> Baht</td>
                    </tr>
                    <tr>
                        <td colspan="2"align="right">Price 2</td>
                        <td colspan="2"><input name="price2" type="text" size="10"/> Baht</td>
                    </tr>
                    <tr>
                        <td colspan="2"align="right">Price 3</td>
                        <td colspan="2"><input name="price3" type="text" size="10"/> Baht</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">Product Image</td>
                        <td colspan="2" ><input type="file" name="upload" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"align="right">Product Icon</td>
                        <td colspan="2"><input name="iconLoc" type="text" size="5"/></td>
                    </tr>

                    <tr>
                        <td colspan="2" align="right">Product Display</td>
                        <td colspan="2"><input name="display" type="radio"/>Yes<input name="display" type="radio"/>No</td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td colspan="2" align="center" bgcolor="blue">  Thai</td>
                                    <td colspan="2" align="center" bgcolor="yellow">  English</td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Product Name </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><input name="nameTh" type="text" size="23"/></td>
                                    <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Name </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><input name="nameEn" type="text" size="23"/></td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 1 </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect1Th" cols="25" rows="2"></textarea></td>
                                    <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 1 </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect1En" cols="25" rows="2"></textarea></td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 2 </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect2Th" cols="25" rows="2"></textarea></td>
                                    <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 2 </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect2En" cols="25" rows="2"></textarea></td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 3 </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect3Th" cols="25" rows="2"></textarea></td>
                                    <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 3 </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect3En" cols="25" rows="2"></textarea></td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 4 </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect4Th" cols="25" rows="2"></textarea></td>
                                    <td bgcolor="lightyellow" style="border-right: none;"align="right">Product Spect 4 </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect4En" cols="25" rows="2"></textarea></td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 5 </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect5Th" cols="25" rows="2"></textarea></td>
                                    <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 5 </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect5En" cols="25" rows="2"></textarea></td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 6 </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect6Th" cols="25" rows="2"></textarea></td>
                                    <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 6 </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect6En" cols="25" rows="2"></textarea></td>
                                </tr>
                                <tr>
                                    <td bgcolor="lightblue" style="border-right: none;" align="right">Remark </td>
                                    <td bgcolor="lightblue" style="border-left: none;"><textarea name="remarkTh" cols="25" rows="3"></textarea></td>
                                    <td bgcolor="lightyellow" style="border-right: none;" align="right">Remark </td>
                                    <td bgcolor="lightyellow" style="border-left: none;"><textarea name="remarkEn" cols="25" rows="3"></textarea></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><input type="submit" value="Add/Edit"></td>
                        <td colspan="2"><input type="reset" value="Reset"></td>
                    </tr>

                </c:if>
                <c:if test="${param.productDetailId!=null}" >

                    <c:forEach var="product" items="${query3.rows}" >
                        <input type="hidden" name="action" value="Edit" />
                        <input type="hidden" name="productDetailId" value="${product.product_detail_id}"/>
                        <tr>
                            <td colspan="2" align="right" >Product Group</td>
                            <td colspan="2">
                                <select name="productGroupId">
                                    <c:forEach items="${query1.rows}" var="group">
                                        <c:if test="${group.product_Group_Id == product.product_Group_Id }" >
                                            <option value="${group.product_group_id}" selected>${group.product_g_name_t}</option>
                                        </c:if>
                                        <c:if test="${group.product_Group_Id != product.product_Group_Id }" >
                                            <option value="${group.product_group_id}" >${group.product_g_name_t}</option>
                                        </c:if>
                                    </c:forEach>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"align="right">Product Code</td>
                            <td colspan="2"><input name="productCode" type="text" size="10" value="${product.product_code}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"align="right">Company Code</td>
                            <td colspan="2"><input name="companyCode" type="text" size="10"  value="${product.company_code}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"align="right">Color</td>
                            <td colspan="2">
                                <select name="colorId">
                                    <c:forEach items="${query.rows}" var="color" >
                                        <c:if test="${color.color_Id == product.product_color_Id }" >
                                            <option value="${color.Color_Id}">${color.colorName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">Price 1</td>
                            <td colspan="2"><input name="price1" type="text" size="10" value="${product.product_Price1}"/> Baht</td>
                        </tr>
                        <tr>
                            <td colspan="2"align="right">Price 2</td>
                            <td colspan="2"><input name="price2" type="text" size="10" value="${product.product_Price2}"/> Baht</td>
                        </tr>
                        <tr>
                            <td colspan="2"align="right">Price 3</td>
                            <td colspan="2"><input name="price3" type="text" size="10" value="${product.product_Price3}"/> Baht</td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">Product Image</td>
                            <td colspan="2" ><input name="picLoc" type="text" size="5"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"align="right">Product Icon</td>
                            <td colspan="2"><input name="iconLoc" type="text" size="5"/></td>
                        </tr>

                        <tr>
                            <td colspan="2" align="right">Product Display</td>
                            <td colspan="2"><input name="display" type="radio"/>Yes<input name="display" type="radio"/>No</td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td colspan="2" align="center" bgcolor="blue">  Thai</td>
                                        <td colspan="2" align="center" bgcolor="yellow">  English</td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Product Name </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><input name="nameTh" type="text" size="23" value="${product.product_d_name_t}"/></td>
                                        <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Name </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><input name="nameEn" type="text" size="23" value="${product.product_d_name_e}"/></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 1 </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect1Th" cols="25" rows="2" >${product.product_spec1_t}</textarea></td>
                                        <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 1 </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect1En" cols="25" rows="2">${product.product_spec1_e}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 2 </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect2Th" cols="25" rows="2">${product.product_spec2_t}</textarea></td>
                                        <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 2 </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect2En" cols="25" rows="2">${product.product_spec2_e}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 3 </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect3Th" cols="25" rows="2">${product.product_spec3_t}</textarea></td>
                                        <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 3 </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect3En" cols="25" rows="2">${product.product_spec3_e}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 4 </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect4Th" cols="25" rows="2">${product.product_spec4_t}</textarea></td>
                                        <td bgcolor="lightyellow" style="border-right: none;"align="right">Product Spect 4 </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect4En" cols="25" rows="2">${product.product_spec4_e}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 5 </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect5Th" cols="25" rows="2">${product.product_spec5_t}</textarea></td>
                                        <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 5 </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect5En" cols="25" rows="2">${product.product_spec5_e}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 6 </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><textarea name="spect6Th" cols="25" rows="2">${product.product_spec6_t}</textarea></td>
                                        <td bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 6 </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><textarea name="spect6En" cols="25" rows="2">${product.product_spec6_e}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="lightblue" style="border-right: none;" align="right">Remark </td>
                                        <td bgcolor="lightblue" style="border-left: none;"><textarea name="remarkTh" cols="25" rows="3">${product.product_d_remark_t}</textarea></td>
                                        <td bgcolor="lightyellow" style="border-right: none;" align="right">Remark </td>
                                        <td bgcolor="lightyellow" style="border-left: none;"><textarea name="remarkEn" cols="25" rows="3">${product.product_d_remark_e}</textarea></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right"><input type="submit" value="Add/Edit"  ></td>
                            <td colspan="2"><input type="reset" value="Reset"></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </form>
        <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>

</html>
