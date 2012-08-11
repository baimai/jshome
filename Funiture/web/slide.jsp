<%--
    Document   : jshome_slide
    Created on : 7 ส.ค. 2555, 12:36
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query" dataSource="webdb">
    SELECT * FROM pic_product_setup_detail psd
    join product_detail_master pdm on psd.pic_detail_id = pdm.Product_Detail_Id
    join pic_product_setup pps on psd.Pic_Id = pps.Pic_Id
    join menu_detail_master md on  pps.Pic_Id = md.Pic_Id
    where md.menu_model='004' 
    order by psd.pic_seq
    limit 0,6
</sql:query>

<!DOCTYPE html>
<html >

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <link rel="stylesheet" href="css/default/default.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/pascal/pascal.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/orman/orman.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <link rel="icon" href="images/js.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="images/js.ico" type="image/x-icon" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />

        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>

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
