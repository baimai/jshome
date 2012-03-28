<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : listOrder
    Created on : Mar 26, 2012, 5:01:27 PM
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<sql:query var="query1" dataSource="webdb">
    select date_format(ohm.order_date,'วันที่ %d %M %Y เวลา %H:%i') as order_date,pdm.product_d_name_t,odm.product_volumn,
    odm.product_cost,odm.product_amount,odm.discount_TEXT
    from order_header_master ohm
    join member_master mm on mm.member_id = ohm.member_id
    join order_detail_master odm on ohm.order_id = odm.order_id
    join product_detail_master pdm on odm.product_detail_id = pdm.product_detail_id
    where DATE_FORMAT(ohm.order_date,'%Y-%m-%d') = '${param.date}' and mm.member_id = ${sessionScope.loginDetail.memberId}
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="0" width="70%"  id="box-table-a">
            <thead>
                <tr>
                    <th width="20%">เวลาทำรายการ</th>
                    <th width="20%">ชื่อสินค้า</th>
                    <th width="5%">จำนวนสินค้า</th>
                    <th width="10%">ราคาต่อชิ้น</th>
                    <th width="12%">ราคารวม</th>
                    <th width="10%">โปรโมชั่น</th>
                <tr>
            </thead>
            <c:forEach var="order" items="${query1.rows}">
                <tbody>
                    <tr>
                        <td align="center">${order.order_date}</td>
                        <td align="center">${order.product_d_name_t}</td>
                        <td align="center">${order.product_volumn}</td>
                        <td align="center">${order.product_cost}</td>
                        <td align="center">${order.product_amount}</td>
                        <td align="center">${order.discount_text}</td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </body>
</html>
