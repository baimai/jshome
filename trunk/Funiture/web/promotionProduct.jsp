<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : promotionProduct
    Created on : 8 พ.ย. 2554, 23:35:28
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:query var="query" dataSource="webdb">
    SELECT * FROM menu_product_setup mps
         join product_detail_master pdm on mps.Product_Code = pdm.Product_Code
         where mps.Menu_Code = '013'
    order by mps.Menu_code,mps.Product_Code
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <tr>
        <td><div align="center"><img src="jshome/images/promotion.jpg" width="951" height="27" /></div></td>
    </tr>
    <tr>
        <td><!-- thumbnail scroller markup begin -->
            <div id="tS4" class="jThumbnailScroller" style="margin-top:50px;">
                <div class="jTscrollerContainer">
                    <div class="jTscroller">
                       <c:forEach var="proProduct" items="${query.rows}">
                        <a href="products_detail.html"><img src="${proProduct.Product_D_Logo}" /></a>			
                        </c:forEach>

                    </div>
                </div>
                <a href="#" class="jTscrollerPrevButton"></a>
                <a href="#" class="jTscrollerNextButton"></a>
            </div>
            <!-- thumbnail scroller markup end --></td>
    </tr>
</body>
</html>
