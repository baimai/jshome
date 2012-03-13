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
    where mps.Pic_Code = '00010' and pdm.product_d_display_flag = 'Y'
    order by mps.Pic_code,mps.pic_seq 
    limit 0,6
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT * FROM pic_product_setup mps
    join product_detail_master pdm on mps.Product_Detail_Id = pdm.Product_Detail_Id
    where mps.Pic_Code = '00020' and pdm.product_d_display_flag = 'Y'
    order by mps.Pic_code,mps.pic_seq 
    limit 0,6
</sql:query>
<sql:query var="query3" dataSource="webdb">
    SELECT * FROM pic_product_setup mps
    join product_detail_master pdm on mps.Product_Detail_Id = pdm.Product_Detail_Id
    where mps.pic_Code = '00030' and pdm.product_d_display_flag = 'Y'
    order by mps.pic_code,mps.pic_seq 
    limit 0,6
</sql:query>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="content-language" content="th" />
        <meta name="robots" content="index, company,category,contactUs" />
        <meta name="description" content="jshome " />
        <meta name="revisit-after" content="*"/>
        <meta name="keywords" content="ชุดโซฟาไม้,ชุดโซฟาผ้า,ชุดโต๊ะกลางหิน,ชุดมินิบาร์,ชุดหวายแท้,ชุดหวายซันทาน่า,เอเลียส,ชุดอลูอัล
              ,เตียงชายหาด,ชุดอาหารกระจก,ชุดอาหารไม้,ชุดอาหารหินกลม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 4 ที่นั่ง,โต๊ะกลางกระจก,
              โต๊ะกลาง,ชุดกาแฟ,เตียง,เก้าอี้,เก้าอี้ชิงช้า,ชั้นวางโทรศัพท์,ชั้นวางหนังสือ,ราวไม้ ,ฉากกั้น,กระเช้า, โต๊ะคาเฟ่" />
        <link rel="icon" href="images/js.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="images/js.ico" type="image/x-icon" />
        <title>jshome</title>
        <link href="jshome/css/jquery.thumbnailScroller.css" rel="stylesheet" />
        <script src="jshome/js/jquery-1.5.min.js" type="text/javascript"></script>
        <script src="jshome/js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" /> 
        <script type="text/javascript">
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
        <script src="jshome/js/jquery.thumbnailScroller.js" type="text/javascript"></script>
        <style type="text/css">
       /* $("[title]").tooltip();*/
        /* tooltip styling. by default the element to be styled is .tooltip  */
.tooltip {
	display:none;
	background:transparent url(/tools/img/tooltip/black_arrow.png);
	font-size:12px;
	height:70px;
	width:160px;
	padding:25px;
	color:#fff;
}
$("[title]").tooltip();
        </style>
    </head>
    <body>
        <div class="main-container col1-layout">
            <div class="main">
                <div class="col-main">
                    <div id="messages_product_view"></div>
                    <div class="page-title">
                        <h1><img src="images/icon/flag-hot-red.png" width="24" height="24" alt="flag-hot-red"/>
                            HotProduct</h1>
                    </div>

                    <div id="tS2" class="jThumbnailScroller" >
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                <c:forEach var="hotProduct" items="${query.rows}">
                                    <a href="productDetail.jsp?productDetailId=${hotProduct.product_detail_id}"><img src="${hotProduct.Product_D_Pic_loc}" title="${hotProduct.Product_D_Name_T}"/></a>
                                    </c:forEach>
                            </div>
                        </div>

                        <a href="#" class="jTscrollerPrevButton"></a>
                        <a href="#" class="jTscrollerNextButton"></a>
                    </div>
                </div>
                <br>
                <div class="col-main">
                    <div id="messages_product_view"></div>
                    <div class="page-title">
                        <h1><img src="images/icon/flag-new-blue.png" width="24" height="24" alt="flag-new-blue"/>
                            New Product</h1>
                    </div>

                    <div id="tS3" class="jThumbnailScroller" style="margin-top:50px;">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                <c:forEach var="newProduct" items="${query2.rows}">
                                    <a href="productDetail.jsp?productDetailId=${newProduct.product_detail_id}"><img src="${newProduct.Product_D_Pic_loc}" title="${newProduct.Product_D_Name_T}" /></a>
                                    </c:forEach>

                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton"></a>
                        <a href="#" class="jTscrollerNextButton"></a>
                    </div>
                </div>
                <br>
                <div class="col-main">
                    <div id="messages_product_view"></div>
                    <div class="page-title">
                        <h1><img src="images/icon/flag-popular-red.png" width="24" height="24" alt="flag-popular-red"/>
                            Promotion</h1>
                    </div>
                    <div id="tS4" class="jThumbnailScroller" style="margin-top:50px;">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                <c:forEach var="proProduct" items="${query3.rows}">
                                    <a href="productDetail.jsp?productDetailId=${proProduct.product_detail_id}"><img src="${proProduct.Product_D_Pic_Loc}" title="${proProduct.Product_D_Name_T}"/></a>
                                    </c:forEach>

                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton"></a>
                        <a href="#" class="jTscrollerNextButton"></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
