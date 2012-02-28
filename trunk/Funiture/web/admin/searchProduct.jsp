<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : searchProduct
    Created on : Feb 27, 2012, 10:24:14 AM
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<sql:query var="query" dataSource="webdb">
    select * from product_detail_master
    where product_code like '%${param.productCode}%' and
    product_d_name_t like '%${param.productName}%' and
    product_group_id like '%${param.productGroupId}%'
    limit ${(param.page-1)*5},5
</sql:query>
<sql:query var="query2" dataSource="webdb">
    select count(*) as count from product_detail_master
   where product_code like '%${param.productCode}%' and
    product_d_name_t like '%${param.productName}%' and
    product_group_id like '%${param.productGroupId}%'
</sql:query>
<c:forEach items="${query2.rows}" var="rec">
    <c:set var="record" value="${rec.count}"/>
</c:forEach>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
    </head>
    <body>
        <table width="500px">
            <thead>
                <tr>
                    <th width="130px">Picture</th>
                    <th width="170px">Product Code</th>
                    <th width="200px">Product Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${query.rows}">
                    <tr>
                        <td><img src="../${product.product_d_pic_loc}" width="120" height="80"/></td>
                        <td align="cenetr"><a>${product.product_code}</a></td>
                        <td align="center"><a href="#" onclick="document.getElementById('productCode').value = '${product.product_code}'; $( '#dialog-form' ).dialog( 'close' );">${product.product_D_name_t}</a></td>
                    </tr>
                </c:forEach>
                    <tr>
                        <td>
                        <c:forEach  var="navi" varStatus="counter" begin="1" end="${((record/5)+(1-((record/5)%1))%1)}" step="1">
                            <a onclick="setSearch(document.getElementById('productCode2').value,document.getElementById('productName2').value,document.getElementById('productGroupId2').value,'${counter.count}')" href="#"> ${counter.count}</a>
                        </c:forEach>
                        </td>
                    </tr>
            </tbody>

        </table>
    </body>
</html>
