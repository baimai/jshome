<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.productList!=null}">
    <%-- List สินค้าที่ใกล้เคียง สีต่างกัน--%>
    <sql:query var="query" dataSource="webdb">
        select * from (select * from product_detail_master pdm where pdm.product_detail_id not in (
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            ${list.productDetailId}
        </c:forEach>
        ) and pdm.product_code in (
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            '${list.productCode}'
        </c:forEach>
        )
        order by rand() limit 2) tbl1
        union all
        select * from ( select * from product_detail_master pdm where pdm.product_detail_id not in (
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            ${list.productDetailId}
        </c:forEach>
        ) and pdm.product_group_id in(
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            ${list.productGroupId}
        </c:forEach>
        )
        order by rand() limit 2) tbl2 limit 2
    </sql:query>
</c:if>

<!DOCTYPE html>
<html  >
    <title>Shopping Cart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <meta http-equiv="content-language" content="th" />
        <meta name="robots" content="index, company,category,contactUs" />
        <meta name="description" content="jshome " />
        <meta name="revisit-after" content="*"/>
        <meta name="keywords" content="ชุดโซฟาไม้,ชุดโซฟาผ้า,ชุดโต๊ะกลางหิน,ชุดมินิบาร์,ชุดหวายแท้,ชุดหวายซันทาน่า,เอเลียส,ชุดอลูอัล
              ,เตียงชายหาด,ชุดอาหารกระจก,ชุดอาหารไม้,ชุดอาหารหินกลม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 4 ที่นั่ง,โต๊ะกลางกระจก,
              โต๊ะกลาง,ชุดกาแฟ,เตียง,เก้าอี้,เก้าอี้ชิงช้า,ชั้นวางโทรศัพท์,ชั้นวางหนังสือ,ราวไม้ ,ฉากกั้น,กระเช้า, โต๊ะคาเฟ่" />
        <link rel="icon" href="images/js.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="images/js.ico" type="image/x-icon" />   <!--[if lt IE 7]>
    <script type="text/javascript">
    //<![CDATA[
        var BLANK_URL = 'http://freedemo.templates-master.com/js/blank.html';
        var BLANK_IMG = 'http://freedemo.templates-master.com/js/spacer.gif';
    //]]>
    </script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="jshome/css/calendar-win2k-1.css" />
    <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
    <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
    <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
    <link rel="stylesheet" type="text/css" href="jshome/css/print.css" media="print" />
  
    <!--[if lt IE 8]>
    <link rel="stylesheet" type="text/css" href="http://freedemo.templates-master.com/skin/frontend/default/f002/css/styles-ie.css" media="all" />
    <![endif]-->
    <!--[if lt IE 7]>
    <script type="text/javascript" src="http://freedemo.templates-master.com/js/lib/ds-sleight.js"></script>
    <script type="text/javascript" src="http://freedemo.templates-master.com/skin/frontend/base/default/js/ie6.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
    <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/thickbox.js"></script>
    <link rel="stylesheet" href="css/thickbox.css" type="text/css" media="screen" />

</head>

<body class=" checkout-cart-index">
    <div id="art-main">
        <div class="art-sheet">
            <div class="art-sheet-bl"></div>
            <div class="art-sheet-br"></div>
            <div class="art-sheet-bc"></div>
            <div class="art-sheet-cl"></div>
            <div class="art-sheet-cr"></div>
            <div class="art-sheet-cc"></div>
            <div class="art-sheet-body">
                <jsp:include page="head.jsp"/>
                <jsp:include page="slide.jsp"/>
                <br><br>
               
                            <%--หน้า cartDetail.jsp --%>
                            <div class="wrapper">
                                <div class="page">
                                </div>        <div class="main-container col1-layout">
                                    <div class="main">
                                        <div class="col-main">
                                            <div class="cart">
                                                <div class="page-title title-buttons">
                                                    <h1>ตะกร้าสินค้า</h1>
                                                    <ul class="checkout-types">
                                                        <c:if test="${sessionScope.loginDetail != null}">
                                                            <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="window.location='addOrder.do';"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                        </c:if>
                                                        <c:if test="${sessionScope.loginDetail == null}">
                                                            <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="alert('กรุณาเข้าสู่ระบบก่อน')"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                                <form action="addProduct.do" method="get">
                                                    <fieldset>
                                                        <table id="shopping-cart-table" class="data-table cart-table">
                                                            <col width="1" />
                                                            <col width="1" />
                                                            <col width="1"/>
                                                            <col  />
                                                            <col width="1" />
                                                            <col width="1" />
                                                            <col width="1" />
                                                            <thead>
                                                                <tr>
                                                                    <th rowspan="1" class="a-center">&nbsp;</th>
                                                                    <th rowspan="1">&nbsp;</th>
                                                                    <th rowspan="1">รหัสสินค้า</th>
                                                                    <th rowspan="1"><span class="nobr">ชื่อสินค้า</span></th>
                                                                    <th class="a-center" colspan="1"><span class="nobr">ราคา</span></th>
                                                                    <th rowspan="1" class="a-center">จำนวนชิ้น</th>
                                                                    <th class="a-center" colspan="1">ราคารวม</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <td colspan="50" class="a-right">
                                                                        <button type="button" title="สั่งสินค้าเพิ่มเติม" class="button btn-continue" onclick="location.href='category.jsp'"><span><span>สั่งสินค้าเพิ่มเติม</span></span></button>
                                                                        <input type="hidden" name="status" id="status" value="update" />
                                                                        <button type="submit" title="ปรับปรุงรายการสินค้า" class="button btn-update"><span><span>ปรับปรุงรายการสินค้า</span></span></button>
                                                                    </td>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                                <c:forEach var="product" items="${sessionScope.productList}">

                                                                    <tr>
                                                                        <td class="a-center"><a href="addProduct.do?productDetailId=${product.productDetailId}&status=remove" title="ลบรายการ" class="btn-remove2">ลบรายการ</a></td>
                                                                        <td><a href="productDetail.jsp?productDetailId=${product.productDetailId}" target="_blank" title=""><img src="${product.productPath}" width="75" height="75" alt="" /></a></td>
                                                                        <td>${product.productCode}</td>
                                                                        <td>
                                                                            <h2 class="product-name">                                                                               
                                                                               <a href="productDetail.jsp?productDetailId=${product.productDetailId}"> ${product.productName}</a>
                                                                            </h2>
                                                                        </td>
                                                                        <td class="a-right">
                                                                            <span class="cart-price">

                                                                                <span class="price"><fmt:formatNumber value="${product.productPrice}" type="number"  pattern="###,###,##0.00"/></span>
                                                                            </span>


                                                                        </td>
                                                                        <td class="a-center">
                                                                            <input name="amounts" id="amounts" value="${product.amount}" size="4" title="Qty" class="input-text qty" maxlength="12" />
                                                                        </td>
                                                                        <td class="a-right">
                                                                            <span class="cart-price">

                                                                                <span class="price"><fmt:formatNumber value="${product.productPrice*product.amount}" type="number"  pattern="###,###,##0.00"/></span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </fieldset>
                                                </form>
                                                <div class="cart-collaterals">
                                                    <div class="col2-set">
                                                        <div class="col-1">
                                                            <div class="crosssell">
                                                                <h2>สินค้าแนะนำ</h2>
                                                                <ul id="crosssell-products-list">
                                                                    <c:forEach var="relate" items="${query.rows}" >
                                                                        <li class="item">
                                                                            <a class="product-image" href="productDetail.jsp?productDetailId=${relate.product_detail_id}" title="${relate.product_d_name_t}"><img src="${relate.product_d_pic_loc}" width="75" height="75" alt="${relate.product_d_name_t}" /></a>
                                                                            <div class="product-details">
                                                                                <h3 class="product-name"><a href="productDetail.jsp?productDetailId=${relate.product_detail_id}">${relate.product_d_name_t}</a></h3>



                                                                                <div class="price-box">
                                                                                    <span class="regular-price" id="product-price-42">
                                                                                        <span class="price">฿ <fmt:formatNumber value="${relate.product_price1}" type="number"  pattern="###,###,##0.00"/></span>                </span>

                                                                                </div>

                                                                                        <button type="button" title="เพิ่ม" class="button btn-cart" onclick="window.location='productDetail.jsp?productDetailId=${relate.product_detail_id}'"><span><span>เพิ่มไปยังตะกร้า</span></span></button>
                                                                                
                                                                            </div>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="totals">
                                                        <c:set var="total" value="0" />
                                                        <c:forEach var="list" items="${sessionScope.productList}">
                                                            <c:set var="price" value="${list.productPrice*list.amount}" />
                                                            <c:set var="total" value="${total+price}"/>
                                                        </c:forEach>




                                                        <table id="shopping-cart-totals-table">
                                                            <col />
                                                            <col width="1" />
                                                            <tfoot>
                                                                <tr>
                                                                    <td style="" class="a-right" colspan="1">
                                                                        <strong>ราคารวมทั้งสิ้น</strong>
                                                                    </td>
                                                                    <td style="" class="a-right">
                                                                        <strong><span class="price"> ฿ <fmt:formatNumber value="${total}" type="number" pattern="###,###,##0.00" /></span></strong>
                                                                    </td>
                                                                </tr>
                                                            </tfoot>


                                                            <tbody>
                                                                <tr>
                                                                    <td style="" class="a-right" colspan="1">
                                                                        ราคารวมสินค้าทั้งหมด   </td>
                                                                    <td style="" class="a-right">
                                                                        <span class="price">฿ <fmt:formatNumber value="${total}" type="number" pattern="###,###,##0.00" /></span>    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <ul class="checkout-types">
                                                            <c:if test="${sessionScope.loginDetail != null}">
                                                                <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="window.location='addOrder.do';"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                            </c:if>
                                                            <c:if test="${sessionScope.loginDetail == null}">
                                                                <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="alert('กรุณาเข้าสู่ระบบก่อน')"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                            </c:if>
                                                           
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <%--จบหน้า cartDetail.jsp --%>
                       

                <br/><br/>
                <jsp:include page="footer.jsp" />
                <br/><br/>
            </div>


        </div>
        <div class="cleared"></div>
    </div>

    <div class="cleared"></div>
    <p class="art-page-footer"></p>


</body>
</html>
