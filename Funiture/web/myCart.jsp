<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : myCart
    Created on : 9 ธ.ค. 2554, 17:25:41
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <div class="col-right sidebar">
            <div class="block block-cart">
                <div class="block-title">
                    <strong><span>สินค้าในตะกร้า</span></strong>
                </div>
                <c:if test="${sessionScope.productList != null}">
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
                </c:if>
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
