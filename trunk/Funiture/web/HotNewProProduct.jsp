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

        <title>jshome</title>

        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" /> 
        <link href="css/movingboxes.css" media="screen" rel="stylesheet">
        <!--[if lt IE 9]>
	<link href="css/movingboxes-ie.css" rel="stylesheet" media="screen" />
	<![endif]-->

        <!-- Required script -->

        <script src="js/jquery.movingboxes.js"></script>

        <!-- Demo only -->

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
                    startPanel   : 3,      // start with this panel
                    wrap         : false,   // if true, the panel will "wrap" (it really rewinds/fast forwards) at the ends
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
                                <img src="${hotProduct.Product_D_Pic_loc}" alt="title"/></a>
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
