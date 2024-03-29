<%--
    Document   : jshome_HotNewProProduct
    Created on : 7 ส.ค. 2555, 12:36
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

<sql:query var="query2" dataSource="webdb">
    SELECT * FROM pic_product_setup_detail psd
    join product_detail_master pdm on psd.pic_detail_id = pdm.Product_Detail_Id
    join pic_product_setup pps on psd.Pic_Id = pps.Pic_Id
    join menu_detail_master md on  pps.Pic_Id = md.Pic_Id
    where md.menu_model='002' and pdm.product_d_display_flag = 'Y'
    order by psd.pic_seq
    limit 0,6
</sql:query>

<sql:query var="query3" dataSource="webdb">
    SELECT * FROM pic_product_setup_detail psd
    join product_detail_master pdm on psd.pic_detail_id = pdm.Product_Detail_Id
    join pic_product_setup pps on psd.Pic_Id = pps.Pic_Id
    join menu_detail_master md on  pps.Pic_Id = md.Pic_Id
    where md.menu_model='003' and pdm.product_d_display_flag = 'Y'
    order by psd.pic_seq
    limit 0,6
</sql:query>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link href="css/movingboxes.css" media="screen" rel="stylesheet">
	<link href="css/movingboxes-ie.css" rel="stylesheet" media="screen" />
        <script src="js/jquery.movingboxes.js"></script>
        
        <style>
            /* Dimensions set via css in MovingBoxes version 2.2.2+ */

            #slider2 { width: 900px; }
            #slider2 li { width: 250px; }
            #slider3 { width: 900px; }
            #slider3 li { width: 250px; }
            #slider4 { width: 900px; }
            #slider4 li { width: 250px; }
        </style>

        <script>
            $(function(){

                $('#slider2').movingBoxes({
                    /* width and panelWidth options deprecated, but still work to keep the plugin backwards compatible
                        width: 500,
                        panelWidth: 0.5,
                     */
                    //startPanel   : 3,      // start with this panel
                    wrap         : true,   // if true, the panel will "wrap" (it really rewinds/fast forwards) at the ends
                    buildNav     : true,   // if true, navigation links will be added
                    navFormatter : function(){ return "&#9679;"; } // function which returns the navigation text for each panel
                });
                $('#slider3').movingBoxes({
                    /* width and panelWidth options deprecated, but still work to keep the plugin backwards compatible
                        width: 500,
                        panelWidth: 0.5,
                     */
                    startPanel   : 3,      // start with this panel
                    wrap         : false,   // if true, the panel will "wrap" (it really rewinds/fast forwards) at the ends
                    buildNav     : true,   // if true, navigation links will be added
                    navFormatter : function(){ return "&#9679;"; } // function which returns the navigation text for each panel
                });
                $('#slider4').movingBoxes({
                    /* width and panelWidth options deprecated, but still work to keep the plugin backwards compatible
                        width: 500,
                        panelWidth: 0.5,
                     */
                    startPanel   : 3,      // start with this panel
                    wrap         : false,   // if true, the panel will "wrap" (it really rewinds/fast forwards) at the ends
                    buildNav     : true,   // if true, navigation links will be added
                    navFormatter : function(){ return "&#9679;"; } // function which returns the navigation text for each panel
                });

            });
        </script>
    </head>

    <body>
        <div class="main-container col1-layout">
            <div class="main">
                <img src="images/hotpromotion.png" width="100%" alt="flag-hot-red"/>
                <ul id="slider2">
                    <c:forEach var="hotProduct" items="${query.rows}">
                        <li>
                            <a href="productDetail.jsp?productDetailId=${hotProduct.product_detail_id}" title="${hotProduct.Product_D_Name_T}">
                                <img src="${hotProduct.Product_D_Pic_loc}" alt="title" /></a>
                            <h2>${hotProduct.Product_D_Name_T}</h2>
                        </li>
                    </c:forEach>
                </ul>
                <img src="images/newproduct.png" width="100%" alt="flag-new-blue"/>
                <ul id="slider3">
                    <c:forEach var="newProduct" items="${query2.rows}">
                        <li>
                            <a href="productDetail.jsp?productDetailId=${newProduct.product_detail_id}" title="${newProduct.Product_D_Name_T}">
                                <img src="${newProduct.Product_D_Pic_loc}" alt="title"/></a>
                            <h2>${newProduct.Product_D_Name_T}</h2>
                        </li>
                    </c:forEach>
                </ul>
                <img src="images/promotion.png" width="100%"  alt="flag-popular-red"/>
                <ul id="slider4">
                    <c:forEach var="proProduct" items="${query3.rows}">
                        <li>
                            <a href="productDetail.jsp?productDetailId=${proProduct.product_detail_id}" title="${proProduct.Product_D_Name_T}">
                                <img src="${proProduct.Product_D_Pic_loc}" alt="title"/></a>
                            <h2>${proProduct.Product_D_Name_T}</h2>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </body>

</html>
