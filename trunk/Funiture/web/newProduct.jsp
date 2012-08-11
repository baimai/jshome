<%--
    Document   : jshome_newProduct
    Created on : 8 ส.ค. 2555, 13:56
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query" dataSource="webdb">
    SELECT * FROM pic_product_setup_detail psd
    join product_detail_master pdm on psd.pic_detail_id = pdm.Product_Detail_Id
    join pic_product_setup pps on psd.pic_id = pps.Pic_Id
    join menu_detail_master md on  pps.pic_id = md.Pic_id
    where md.menu_model='001' and pdm.product_d_display_flag = 'Y'
    order by psd.pic_seq
    limit 0,6
</sql:query>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/jquery.thumbnailScroller.css" rel="stylesheet" />

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
        <script src="js/jquery-ui-1.8.13.custom.min.js"></script>
        
        <style type="text/css">
            <!--
            body {
                margin-left: 0px;
                /*margin-top: 40px;*/
                margin-right: 0px;
                margin-bottom: 0px;
            }
            -->
        </style>

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
    </head>

    <body>

    <tr>
        <td>
            <div align="center"><img src="jshome/images/new.jpg" width="953" height="27" /></div>
        </td>
    </tr>
    <tr>
        <td>
            <div id="tS3" class="jThumbnailScroller" style="margin-top:50px;">
                <div class="jTscrollerContainer">
                    <div class="jTscroller">
                        <c:forEach var="newProduct" items="${query.rows}">
                            <a href="products_detail.html"><img src="${newProduct.Product_D_Pic_loc}" /></a>

                        </c:forEach>
                        ${hotProduct.Product_D_Name_T}
                    </div>
                </div>
                <a href="#" class="jTscrollerPrevButton"></a>
                <a href="#" class="jTscrollerNextButton"></a>
            </div></td>
    </tr>
</body>

</html>
