<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : hotProduct_2
    Created on : 13 พ.ย. 2554, 22:32:15
    Author     : Achilles
--%>
<sql:query var="query" dataSource="webdb">
    SELECT * FROM pic_product_setup mps
    join product_detail_master pdm on mps.Product_Detail_Id = pdm.Product_Detail_Id
    where mps.Pic_Code = '00010'
    order by mps.Pic_code
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT * FROM pic_product_setup mps
    join product_detail_master pdm on mps.Product_Detail_Id = pdm.Product_Detail_Id
    where mps.Pic_Code = '00020'
    order by mps.Pic_code
</sql:query>
<sql:query var="query3" dataSource="webdb">
    SELECT * FROM pic_product_setup mps
    join product_detail_master pdm on mps.Product_Detail_Id = pdm.Product_Detail_Id
    where mps.pic_Code = '00030'
    order by mps.pic_code
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
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
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
        <div class="wrapper">

            <div class="page">


            </div>
        </div>        <div class="main-container col3-layout">


            <div class="main">
                <div class="col-wrapper">
                    <div align="center"><img src="jshome/images/hot.jpg" width="925" height="27" /></div>
                    <div id="tS2" class="jThumbnailScroller" style="margin-top:50px;">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                <c:forEach var="hotProduct" items="${query.rows}">
                                    <a href="productDetail.jsp?productDetailId=${hotProduct.product_detail_id}"><img src="${hotProduct.Product_D_Pic_loc}" /></a>
                                    </c:forEach>
                            </div>
                        </div>

                        <a href="#" class="jTscrollerPrevButton"></a>
                        <a href="#" class="jTscrollerNextButton"></a>
                    </div>
                    <div align="center"><img src="jshome/images/new.jpg" width="925" height="27" /></div>

                    <div id="tS3" class="jThumbnailScroller" style="margin-top:50px;">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                <c:forEach var="newProduct" items="${query2.rows}">
                                    <a href="productDetail.jsp?productDetailId=${newProduct.product_detail_id}"><img src="${newProduct.Product_D_Pic_loc}" /></a>
                                    </c:forEach>

                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton"></a>
                        <a href="#" class="jTscrollerNextButton"></a>
                    </div>
                    <div align="center">
                        <img src="jshome/images/promotion.jpg" width="925" height="27" /></div>
                    <div id="tS4" class="jThumbnailScroller" style="margin-top:50px;">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                <c:forEach var="proProduct" items="${query3.rows}">
                                    <a href="productDetail.jsp?productDetailId=${proProduct.product_detail_id}"><img src="${proProduct.Product_D_Pic_Loc}" /></a>
                                    </c:forEach>

                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton"></a>
                        <a href="#" class="jTscrollerNextButton"></a>
                    </div>
                </div>

            </div>
    </body>
</html>
