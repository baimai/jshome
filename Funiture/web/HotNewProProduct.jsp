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
        <!-- the CSS for Smooth Div Scroll -->
        <link rel="Stylesheet" type="text/css" href="css/smoothDivScroll.css" />

        <!-- jQuery UI widget factory -->
        <script src="js/jquery.ui.widget.js" type="text/javascript"></script>

        <!-- Smooth Div Scroll 1.1 - minified for faster loading-->
        <script src="js/jquery.smoothDivScroll-1.1-min.js" type="text/javascript"></script>
        <!-- Script for specified scrolling -->
        <script type="text/javascript">
            // Initialize the plugin with no custom options
            $(window).load(function() {
                $("div#makeMeScrollable").smoothDivScroll({
                    autoScroll: "onstart" ,
                    autoScrollDirection: "backandforth",
                    autoScrollStep: 1,
                    autoScrollInterval: 15,
                    startAtElementId: "startAtMe",
                    visibleHotSpots: "always"
                });
            });
        </script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" /> 

        <style type="text/css">
            #makeMeScrollable
            {
                
                width:95%;
                margin-left: 25px;
                height: 250px;
                position: relative;
            }

            #makeMeScrollable div.scrollableArea img
            {
                position: relative;
                float: left;
                margin: 0;
                padding: 0;
            }
        </style>
    </head>
    <body>
        <div class="main-container col1-layout">
            <div class="main">
              
                    

                <img src="images/hotpromotion.png" width="100%" alt="flag-hot-red"/>

                    <div id="makeMeScrollable">
                        <div class="scrollingHotSpotLeft"></div>
                        <div class="scrollingHotSpotRight"></div>
                        <div class="scrollWrapper">
                            <div class="scrollableArea">
                                <c:forEach var="hotProduct" items="${query.rows}">
                                    <a href="productDetail.jsp?productDetailId=${hotProduct.product_detail_id}"><img src="${hotProduct.Product_D_Pic_loc}" title="${hotProduct.Product_D_Name_T}"/></a>
                                    </c:forEach>
                            </div>
                        </div>
                    </div>
                
                <br>
               
                  
                   
                        <img src="images/newproduct.png" width="100%" alt="flag-new-blue"/>
                           

                    <div id="makeMeScrollable">
                        <div class="scrollingHotSpotLeft"></div>
                        <div class="scrollingHotSpotRight"></div>
                        <div class="scrollWrapper">
                            <div class="scrollableArea">
                                <c:forEach var="newProduct" items="${query2.rows}">
                                    <a href="productDetail.jsp?productDetailId=${newProduct.product_detail_id}"><img src="${newProduct.Product_D_Pic_loc}" title="${newProduct.Product_D_Name_T}" /></a>
                                    </c:forEach>

                            </div>
                        </div>

                    </div>
               
                <br>
               
                    
                   
                        <img src="images/promotion.png" width="100%"  alt="flag-popular-red"/>
                            
                   
                    <div id="makeMeScrollable">
                        <div class="scrollingHotSpotLeft"></div>
                        <div class="scrollingHotSpotRight"></div>
                        <div class="scrollWrapper">
                            <div class="scrollableArea">
                                <c:forEach var="proProduct" items="${query3.rows}">
                                    <a href="productDetail.jsp?productDetailId=${proProduct.product_detail_id}"><img src="${proProduct.Product_D_Pic_Loc}" title="${proProduct.Product_D_Name_T}"/></a>
                                    </c:forEach>

                            </div>
                        

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
