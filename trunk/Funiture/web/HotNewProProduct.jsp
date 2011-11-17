<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : hotProduct_2
    Created on : 13 พ.ย. 2554, 22:32:15
    Author     : Achilles
--%>
<sql:query var="query" dataSource="webdb">
    SELECT * FROM menu_product_setup mps
    join product_detail_master pdm on mps.Product_Code = pdm.Product_Code
    where mps.Menu_Code = '011'
    order by mps.Menu_code,mps.Product_Code
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT * FROM menu_product_setup mps
    join product_detail_master pdm on mps.Product_Code = pdm.Product_Code
    where mps.Menu_Code = '012'
    order by mps.Menu_code,mps.Product_Code
</sql:query>
<sql:query var="query3" dataSource="webdb">
    SELECT * FROM menu_product_setup mps
    join product_detail_master pdm on mps.Product_Code = pdm.Product_Code
    where mps.Menu_Code = '013'
    order by mps.Menu_code,mps.Product_Code
</sql:query>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="jshome/css/jquery.thumbnailScroller.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="jshome/js/jquery-ui-1.8.13.custom.min.js"></script>
<script>
/* jQuery.noConflict() for using the plugin along with other libraries. 
   You can remove it if you won't use other libraries (e.g. prototype, scriptaculous etc.) or 
   if you include jQuery before other libraries in yourdocument's head tag. 
   [more info: http://docs.jquery.com/Using_jQuery_with_Other_Libraries] */
jQuery.noConflict(); 
/* calling thumbnailScroller function with options as parameters */
(function($){
window.onload=function(){ 
	$("#tS2").thumbnailScroller({ 
		scrollerType:"hoverPrecise", 
		scrollerOrientation:"horizontal", 
		scrollSpeed:2, 
		scrollEasing:"easeOutCirc", 
		scrollEasingAmount:600, 
		acceleration:4, 
		scrollSpeed:800, 
		noScrollCenterSpace:10, 
		autoScrolling:0, 
		autoScrollingSpeed:2000, 
		autoScrollingEasing:"easeInOutQuad", 
		autoScrollingDelay:500 
	});
	$("#tS3").thumbnailScroller({ 
		scrollerType:"hoverPrecise", 
		scrollerOrientation:"horizontal", 
		scrollSpeed:2, 
		scrollEasing:"easeOutCirc", 
		scrollEasingAmount:600, 
		acceleration:4, 
		scrollSpeed:800, 
		noScrollCenterSpace:10, 
		autoScrolling:0, 
		autoScrollingSpeed:2000, 
		autoScrollingEasing:"easeInOutQuad", 
		autoScrollingDelay:500 
	});
	$("#tS4").thumbnailScroller({ 
		scrollerType:"hoverPrecise", 
		scrollerOrientation:"horizontal", 
		scrollSpeed:2, 
		scrollEasing:"easeOutCirc", 
		scrollEasingAmount:600, 
		acceleration:4, 
		scrollSpeed:800, 
		noScrollCenterSpace:10, 
		autoScrolling:0, 
		autoScrollingSpeed:2000, 
		autoScrollingEasing:"easeInOutQuad", 
		autoScrollingDelay:500 
	});
}
})(jQuery);
</script>
<script src="jshome/js/jquery.thumbnailScroller.js"></script>
        
    </head>
    <body>
        <div align="center"><img src="jshome/images/hot.jpg" width="940" height="27" /></div>
        <div id="tS2" class="jThumbnailScroller" style="margin-top:50px;">
            <div class="jTscrollerContainer">
                <div class="jTscroller">
                    <c:forEach var="hotProduct" items="${query.rows}">
                        <a href="products_detail.html"><img src="${hotProduct.Product_D_Logo}" /></a>			
                        </c:forEach>
                </div>
            </div>

            <a href="#" class="jTscrollerPrevButton"></a>
            <a href="#" class="jTscrollerNextButton"></a>
        </div>
        <div align="center"><img src="jshome/images/new.jpg" width="940" height="27" /></div>

        <div id="tS3" class="jThumbnailScroller" style="margin-top:50px;">
            <div class="jTscrollerContainer">
                <div class="jTscroller">
                    <c:forEach var="newProduct" items="${query2.rows}">
                        <a href="products_detail.html"><img src="${newProduct.Product_D_Logo}" /></a>			
                        </c:forEach>

                </div>
            </div>
            <a href="#" class="jTscrollerPrevButton"></a>
            <a href="#" class="jTscrollerNextButton"></a>
        </div>
        <div align="center"><img src="jshome/images/promotion.jpg" width="940" height="27" /></div>
            <div id="tS4" class="jThumbnailScroller" style="margin-top:50px;">
                <div class="jTscrollerContainer">
                    <div class="jTscroller">
                       <c:forEach var="proProduct" items="${query3.rows}">
                        <a href="products_detail.html"><img src="${proProduct.Product_D_Logo}" /></a>			
                        </c:forEach>

                    </div>
                </div>
                <a href="#" class="jTscrollerPrevButton"></a>
                <a href="#" class="jTscrollerNextButton"></a>
            </div>
    </body>
</html>
