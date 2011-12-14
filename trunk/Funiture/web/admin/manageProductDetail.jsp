<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : manageProductDetail
    Created on : 14 ธ.ค. 2554, 14:49:12
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="query" dataSource="webdb">
    SELECT * FROM product_detail_master 
    <c:if test="${param.productGroup != null }">
        where product_group = '${param.productGroup}'
    </c:if>
    limit ${(param.page-1)*param.show},${param.show}
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT count(*) as count FROM product_detail_master
    <c:if test="${param.productGroup != null }">
        where product_group = '${param.productGroup}'
    </c:if>
</sql:query>
<sql:query var="query3" dataSource="webdb">
    SELECT * FROM product_group_master
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <select>
            <c:forEach items="${query3.rows}" var="group">
                <c:if test="${param.productGroup == group.product_group && param.productGroup != null}">
                    <option value="${group.product_group}" selected>${group.product_g_name_t} </option>
                </c:if>
                <c:if test="${param.productGroup != group.product_group && param.productGroup == null}">
                    <option value="${group.product_group}" >${group.product_g_name_t}</option>
                </c:if>
            </c:forEach>
        </select>
        <c:forEach items="${query2.rows}" var="recordNum" >
            <c:set var="total" value="${recordNum.count}" />
        </c:forEach>
        <table>
            <tr>
                <td><c:if test="${param.page != 1}" >
                        <a  href="manageProductDetail.jsp?page=1&show=${param.show}" title="Backward" style="text-decoration: none" >
                            <img src="../images/icon/00247.png" width="15" height="15" alt="next"/>
                        </a>
                        <a  href="manageProductDetail.jsp?page=${param.page-1}&show=${param.show}" title="back"  style="text-decoration: none;" >
                            <img src="../images/icon/00245.png" width="15" height="15" alt="back" />
                        </a>
                    </c:if>
                    <c:if test="${param.page == 1}" >
                        <img src="../images/icon/00247.png" width="15" height="15" alt="next"/>
                        <img src="../images/icon/00245.png" width="15" height="15" alt="back" />    
                    </c:if>
                </td>
                <td>
                    <c:forEach begin="1" step="1" end="${param.page-1}" var="count">
                        <c:if test="${count >= (param.page-3)}">
                            <a href="manageProductDetail.jsp?page=${count}&show=${param.show}" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" >${count}</a>
                        </c:if>
                    </c:forEach>
                    <a style="padding:3px 5px;border:1px solid #000; color:#000; background-color:#fff;" >${param.page}</a>
                    <c:forEach begin="${param.page+1}" step="1" end="${((total/param.show)+(1-((total/param.show)%1))%1)}" var="count2">                                    
                        <c:if test="${count2 <= (param.page+3)}">
                            <a href="manageProductDetail.jsp?page=${count2}&show=${param.show}" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" >${count2}</a>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:if test="${param.page < ((total/param.show)+(1-((total/param.show)%1))%1) }">
                        <a  href="manageProductDetail.jsp?page=${param.page+1}&show=${param.show}" title="Next"  style="text-decoration: none">
                            <img src="../images/icon/00246.png" width="15" height="15" alt="next"/>
                        </a>
                        <a  href="manageProductDetail.jsp?page=<fmt:formatNumber value="${(total/param.show)+(1-((total/param.show)%1))%1}" type="number" pattern="#"/>&show=${param.show}" title="forward"  style="text-decoration: none">
                            <img src="../images/icon/00248.png" width="15" height="15" alt="forward"/>
                        </a>
                    </c:if>
                    <c:if test="${param.page >= ((total/param.show)+(1-((total/param.show)%1))%1) }">                                   
                        <img src="../images/icon/00246.png" width="15" height="15" alt="next"/>                                       
                        <img src="../images/icon/00248.png" width="15" height="15" alt="forward"/>
                    </c:if>
                </td>
                <td>
                    show <select onchange="window.location='manageProductDetail.jsp?page=${param.page}&show='+this.value;">
                        <c:forEach begin="1" end="20" step="2" var="show">
                            <c:if test="${show == param.show}" >
                                <option value="${show}" selected="selected"  > ${show} </option>
                            </c:if>
                            <c:if test="${show != param.show}" >
                                <option value="${show}"  > ${show} </option>
                            </c:if>
                        </c:forEach>
                    </select> per page
                </td>
            </tr>
        </table>
        <table border="1" width="900">
            <c:forEach var="product" items="${query.rows}">
                <tr><td width="150">
                        <img src="../${product.product_d_logo}" width="150" height="100" />
                    </td>
                    <td width="70px">
                        ${product.product_group}
                    </td>
                    <td width="70px">
                        ${product.product_code}
                    </td>
                    <td width="200px">
                        ${product.product_d_name_t}
                    </td>
                    <td width="100px">
                        ${product.product_price1}
                    </td>
                    <td width="210px">
                        ${product.product_d_remark_t}
                    </td>
                    <td>
                        <a href="manageProductDetail.jsp?page=${param.page}&show=${param.show}&productCode=${product.product_code}">Edit</a>
                    </td>

                </tr>
            </c:forEach>
        </table> 
    </body>
</html>
