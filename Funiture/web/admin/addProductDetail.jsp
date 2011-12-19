<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : addProductDetail
    Created on : 13 ธ.ค. 2554, 17:10:20
    Author     : Achilles
--%>

<c:if test="${param.productCode!=null}">
    <sql:query var="query3" dataSource="webdb">
        SELECT *  FROM product_detail_master where product_code like '${param.productCode}'
    </sql:query>  
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="">

            <table border="0" width="900px" >
                <tr>
                    <td colspan="2" align="center"><h1> Add Product</h1></td>
                </tr>
                <c:if test="${param.productCode==null}" >
                    <tr>
                        <td align="right" width="300">Product Group</td>
                        <td><input type="text" size="10"/></td>
                    </tr>
                    <tr>
                        <td align="right">Product Code</td>
                        <td><input name="productCode" type="text" size="10"/></td>
                    </tr>
                    <tr>
                        <td align="right">Product Name (Thai)</td>
                        <td><input name="nameTh" type="text" size="30"/></td>
                    </tr>
                    <tr>
                        <td align="right">Product Name (Eng)</td>
                        <td><input name="nameEn" type="text" size="30"/></td>
                    </tr>
                    <tr>
                        <td align="right">Price 1</td>
                        <td><input name="price1" type="text" size="10"/> Baht</td>
                    </tr>
                    <tr>
                        <td align="right">Price 2</td>
                        <td><input name="price2" type="text" size="10"/> Baht</td>
                    </tr>
                    <tr>
                        <td align="right">Price 3</td>
                        <td><input name="price3" type="text" size="10"/> Baht</td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 1 (Thai)</td>
                        <td><textarea name="spect1Th" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 2 (Thai)</td>
                        <td><textarea name="spect2Th" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 3 (Thai)</td>
                        <td><textarea name="spect3Th" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 4 (Thai)</td>
                        <td><textarea name="spect4Th" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 5 (Thai)</td>
                        <td><textarea name="spect5Th" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 6 (Thai)</td>
                        <td><textarea name="spect6Th" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 1 (Eng)</td>
                        <td><textarea name="spect1En" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 2 (Eng)</td>
                        <td><textarea name="spect2En" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 3 (Eng)</td>
                        <td><textarea name="spect3En" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 4 (Eng)</td>
                        <td><textarea name="spect4En" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 5 (Eng)</td>
                        <td><textarea name="spect5En" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Spect 6 (Eng)</td>
                        <td><textarea name="spect6En" cols="25" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Image</td>
                        <td><input name="image" type="text" size="5"/></td>
                    </tr>
                    <tr>
                        <td align="right">Product Icon</td>
                        <td><input name="icon" type="text" size="5"/></td>
                    </tr>
                    <tr>
                        <td align="right">Remark (Thai)</td>
                        <td><textarea name="remarkTh" cols="25" rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Remark (Eng)</td>
                        <td><textarea name="remarkEn" cols="25" rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">Product Display</td>
                        <td><input name="display" type="radio"/>Yes<input name="display" type="radio"/>No</td>
                    </tr>
                    <tr>
                        <td align="right"><input type="submit" value="Add/Edit"></td>
                        <td><input type="reset" value="Reset"></td>
                    </tr>
                </c:if>
                <c:if test="${param.productCode!=null}" >
                    <c:forEach var="product" items="${query3.rows}" >
                        <tr>
                            <td align="right" width="300">Product Group</td>
                            <td><input type="text" size="10" value="${product.product_group_id}"/></td>
                        </tr>
                        <tr>
                            <td align="right">Product Code</td>
                            <td><input name="productCode" type="text" size="10" value="${product.product_code}"/></td>
                        </tr>
                        <tr>
                            <td align="right">Product Name (Thai)</td>
                            <td><input name="nameTh" type="text" size="30" value="${product.product_d_name_t}"/></td>
                        </tr>
                        <tr>
                            <td align="right">Product Name (Eng)</td>
                            <td><input name="nameEn" type="text" size="30" value="${product.product_d_name_e}"/></td>
                        </tr>
                        <tr>
                            <td align="right">Price 1</td>
                            <td><input name="price1" type="text" size="10" value="${product.product_price1}"/> Baht</td>
                        </tr>
                        <tr>
                            <td align="right">Price 2</td>
                            <td><input name="price2" type="text" size="10" value="${product.product_price2}"/> Baht</td>
                        </tr>
                        <tr>
                            <td align="right">Price 3</td>
                            <td><input name="price3" type="text" size="10" value="${product.product_price3}"/> Baht</td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 1 (Thai)</td>
                            <td><textarea name="spect1Th" cols="25" rows="2" value="${product.product_spect1_t}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 2 (Thai)</td>
                            <td><textarea name="spect2Th" cols="25" rows="2" value="${product.product_spect2_t}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 3 (Thai)</td>
                            <td><textarea name="spect3Th" cols="25" rows="2" value="${product.product_spect3_t}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 4 (Thai)</td>
                            <td><textarea name="spect4Th" cols="25" rows="2" value="${product.product_spect4_t}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 5 (Thai)</td>
                            <td><textarea name="spect5Th" cols="25" rows="2" value="${product.product_spect5_t}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 6 (Thai)</td>
                            <td><textarea name="spect6Th" cols="25" rows="2" value="${product.product_spect6_t}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 1 (Eng)</td>
                            <td><textarea name="spect1En" cols="25" rows="2" value="${product.product_spect1_e}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 2 (Eng)</td>
                            <td><textarea name="spect2En" cols="25" rows="2" value="${product.product_spect2_e}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 3 (Eng)</td>
                            <td><textarea name="spect3En" cols="25" rows="2" value="${product.product_spect3_e}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 4 (Eng)</td>
                            <td><textarea name="spect4En" cols="25" rows="2" value="${product.product_spect4_e}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 5 (Eng)</td>
                            <td><textarea name="spect5En" cols="25" rows="2" value="${product.product_spect5_e}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Spect 6 (Eng)</td>
                            <td><textarea name="spect6En" cols="25" rows="2" value="${product.product_spect6_e}"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Image</td>
                            <td><input name="image" type="text" size="5"/></td>
                        </tr>
                        <tr>
                            <td align="right">Product Icon</td>
                            <td><input name="icon" type="text" size="5"/></td>
                        </tr>
                        <tr>
                            <td align="right">Remark (Thai)</td>
                            <td><textarea name="remarkTh" cols="25" rows="3">${product.product_d_remark_t}</textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Remark (Eng)</td>
                            <td><textarea name="remarkEn" cols="25" rows="3">${product.product_d_remark_e}</textarea></td>
                        </tr>
                        <tr>
                            <td align="right">Product Display</td>
                            <c:if test="${product.product_d_display_flag == null}">
                                <td><input name="display" type="radio"/>Yes<input name="display" type="radio"/>No</td>
                                </c:if>
                                <c:if test="${product.product_d_display_flag == true}">
                                <td><input name="display" type="radio" value="1" checked />Yes<input name="display" type="radio" value="0" />No</td>
                                </c:if>
                                <c:if test="${product.product_d_display_flag == false}">
                                <td><input name="display" type="radio" value="1"  />Yes<input name="display" type="radio" value="0" checked />No</td>
                                </c:if>
                        </tr>
                        <tr>
                            <td align="right"><input type="submit" value="Add/Edit"></td>
                            <td><input type="reset" value="Reset"></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </form>
    </body>
</html>
