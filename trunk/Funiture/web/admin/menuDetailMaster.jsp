<%-- 
    Document   : menuDetailMaster
    Created on : Jan 3, 2012, 7:41:39 PM
    Author     : Jik
--%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="productDetail.do" method="post" enctype="multipart/form-data" >

            <table border="0" width="700px" >
                <tr>
                    <td colspan="4" align="center"><h1> Add Product</h1></td>
                </tr>
                <c:if test="${param.menuCodeId==null}" >
                    <input type="hidden" name="action" value="Add" />
                    <tr>
                        <td colspan="2" align="right" >Menu Group</td>
                        <td colspan="2">
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
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"align="right">Menu Model</td>
                        <td colspan="2"><input name="menuModel" id="menuModel" type="text" size="10" /></td>
                    </tr>
                   
                    
                    <tr>
                        <td colspan="2" align="right">MenuSeq </td>
                        <td colspan="2"><input name="menuSeq" type="text" size="10"/> </td>
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
                                <select name="menuGroupId">
                                    <c:forEach items="${query1.rows}" var="group">
                                        <c:if test="${group.menu_group_id == product.menu_group_id }" >
                                            <option value="${group.menu_group_id}" selected>${group.menu_g_name_t}</option>
                                        </c:if>
                                        <c:if test="${group.menu_group_id != product.menu_group_id }" >
                                            <option value="${group.menu_group_id}" >${group.menu_g_name_t}</option>
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
                            <td height="46" colspan="2" align="right">Product Image</td>
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

    </body>
</html>
