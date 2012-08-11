<%--
    Document   : jshome_MyCart
    Created on : 8 ส.ค. 2555, 13:56
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
    </head>

    <body>
        <div class="col-right sidebar">
            <div class="block block-cart"><img src="images/P3-2.png" width="120" height="35" alt="P3-2"/>
                <div class="">
                    <br>
                    <strong></strong>
                </div>
                <div class="block-content">
                    <c:forEach var="list" items="${sessionScope.productList}">
                        <c:set var="price" value="${list.productPrice*list.amount}" />
                        <div class="empty"  id="productList">
                            ${list.productName} x ${list.amount}
                        </div>
                        <c:set var="total" value="${total+price}"/>
                    </c:forEach>
                    <div class="empty"  id="totalPrice">
                        รวม ${total} บาท
                    </div>
                </div>
                <c:if test="${sessionScope.productList == null}">
                    <div class="block-content">
                        <div class="empty"  id="productList">
                            ไม่มีสินค้าในรายการ
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
    
</html>
