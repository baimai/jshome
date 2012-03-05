<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="query" dataSource="webdb">
    SELECT * FROM pic_product_setup mps
    join product_detail_master pdm on mps.Product_Detail_Id = pdm.Product_Detail_Id
    where mps.Pic_Code = '99999' and pdm.product_d_display_flag = 'A'
    order by mps.Pic_code,mps.pic_seq
    limit 0,6
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>slide</title>
        <link rel="stylesheet" href="jshome/css/default/default.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="jshome/css/pascal/pascal.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="jshome/css/orman/orman.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="jshome/css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript" src="jshome/js/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="jshome/js/jquery.nivo.slider.pack.js"></script>
        <script type="text/javascript">
            $(window).load(function() {
                $('#slider').nivoSlider();
            });
        </script>

    </head>
    <body>
        <div id="wrapper">
            <div class="slider-wrapper theme-default">
                <div class="ribbon"></div>
                <div id="slider" class="nivoSlider" >
                    <c:forEach var="hotProduct" items="${query.rows}">
                        <img src="${hotProduct.Product_D_Pic_loc}" alt="" title="${hotProduct.Product_D_Name_T}"/>
                    </c:forEach>

                </div>
                <div id="htmlcaption" class="nivo-html-caption">
                    <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
                </div>
            </div>
        </div>
    </body>
</html>
