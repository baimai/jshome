<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="queryProduct" dataSource="webdb">
    SELECT * FROM product_detail_master where product_detail_Id = ${param.product_detail_Id}
</sql:query>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  >
<title>Akio Dresser</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="Our Akio dresser has a solid hardwood frame.  Features include inset panel sides and for spacious drawers and two wicker baskets." />
<meta name="keywords" content="Hardwood, drawers, wicker, asian, beechwood" />
<meta name="robots" content="*" />
<link rel="icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />
<!--[if lt IE 7]>
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



</head>
<body class=" catalog-product-view product-akio-dresser categorypath-furniture-bedroom-html category-bedroom">
<div class="wrapper">
        <noscript>
        <div class="noscript">
            <div class="noscript-inner">
                <p><strong>JavaScript seem to be disabled in your browser.</strong></p>
                <p>You must have JavaScript enabled in your browser to utilize the functionality of this website.</p>
            </div>
        </div>
    </noscript>
    <div class="page">
      <div class="header">
 

    </head>
    <body class=" catalog-product-view product-akio-dresser categorypath-furniture-bedroom-html category-bedroom">
        <c:forEach var="product" items="${queryProduct.rows}">
         
        <div class="main-container col2-right-layout">
            <div class="main">
                <div class="col-main">
                    <div class="page-title">


                        <h3>${product.Product_D_Name_T}</h3>

                    </div>
                    <div id="messages_product_view"></div>
                    <div class="product-view">
                        <div class="product-essential">
                            
                                <div class="no-display">
                                    <input type="hidden" name="product" value="41" />
                                    <input type="hidden" name="related_product" id="related-products-field" value="" />
                                </div>

                                <div class="product-shop">
                                    <div class="product-name">
                                        <h1>${product.Product_D_Name_T}</h1>
                                    </div>

                                    <p class="email-friend"><a href="http://freedemo.templates-master.com/f002/sendfriend/product/send/id/41/cat_id/23/">Email to a Friend</a></p>

                                    <p class="no-rating"><a href="http://freedemo.templates-master.com/f002/review/product/list/id/41/category/23/#review-form">Be the first to review this product</a></p>

                                    <p class="availability in-stock">Availability: <span>In stock</span></p>



                                    <div class="price-box">
                                        <span class="regular-price" id="product-price-41">
                                            <span class="price">${product.Product_Price1}</span>                </span>

                                    </div>


                                    <div class="add-to-box">

                                        <form action="addProduct.do">
                                        <div class="add-to-cart">
                                            <label for="qty">Qty:</label>
                                            <input type="text" name="amount"  maxlength="12"  class="input-text qty" />
                                            <input type="hidden" name="productName" value="${product.Product_D_Name_T}" />
                                            <input type="hidden" name="productCode" value="${product.Product_Code}" />
                                            <input type="hidden" name="status" value="+" />
                                            <input type="submit" value="ADD" />
                                        </div>
                                        </form>
                                        <span class="or">OR</span>


                            <p class="email-friend"><a href="http://freedemo.templates-master.com/f002/sendfriend/product/send/id/41/cat_id/23/">ทดสอบ</a></p>
            
                <p class="no-rating"><a href="http://freedemo.templates-master.com/f002/review/product/list/id/41/category/23/#review-form">Be the first to review this product</a></p>
                        
    <p class="availability in-stock">Availability: <span>In stock</span></p>

                                        <ul class="add-to-links">
                                            <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/41/" class="link-wishlist">Add to Wishlist</a></li>
                                            <li><span class="separator">|</span> <a href="http://freedemo.templates-master.com/f002/catalog/product_compare/add/product/41/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvZnVybml0dXJlL2JlZHJvb20vYWtpby1kcmVzc2VyLmh0bWw_X19fU0lEPVU,/" class="link-compare">Add to Compare</a></li>
                                        </ul>
                                    </div>



                                    <div class="short-description">
                                        <h2>Quick Overview</h2>
                                        <div class="std">Our Akio dresser has a solid hardwood frame.  </div>
                                    </div>


    <div class="add-to-cart">
                <label for="qty">Qty:</label>
        <input type="text" name="qty" id="qty" maxlength="12" value="" title="Qty" class="input-text qty" />
                <button type="button" title="Add to Cart" class="button btn-cart" onClick="productAddToCartForm.submit()"><span><span>Add to Cart</span></span></button>
            </div>
                                                    <span class="or">OR</span>
                                                                
<ul class="add-to-links">
    <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/41/" class="link-wishlist">Add to Wishlist</a></li>
    
</ul>
                </div>
                                
            
                            <div class="short-description">
                    <h2>Quick Overview</h2>
                    <div class="std">Our Akio dresser has a solid hardwood frame.  </div>
                </div>
            
            
            
        </div>

                                </div>


                                <div class="product-img-box">
                                    <p class="product-image product-image-zoom">
                                        <a href="jshome/images/slideshow/slide-05.jpg" width="848" height="288"  rel="lightbox" > <img src="jshome/images/thumb/smallpost_thumb2_4.jpg" alt="HTC Touch Diamond" width="339" id="image" title="HTC Touch Diamond" /></a></p>
                                </div>

                                <div class="clearer"></div>
                            
                        </div>

                        <div class="product-collateral">
                            <div class="box-collateral box-description">
                                <h2>Details</h2>
                                <div class="std">
                                    Features include inset panel sides and for spacious drawers and two wicker baskets. 41"Wx18"Dx36"H.    </div>
                            </div>
                            <div class="box-collateral box-additional">
                                <h2>Additional Information</h2>
                                <table class="data-table" id="product-attribute-specs-table">
                                    <col width="25%" />
                                    <col />
                                    <tbody>
                                        <tr>
                                            <th class="label">Model</th>
                                            <td class="data">${product.Product_Spec1_T}</td>
                                        </tr>
                                        <tr>
                                            <th class="label">Dimensions</th>
                                            <td class="data">${product.Product_Spec2_T}</td>
                                        </tr>
                                        <tr>
                                            <th class="label">Finish</th>
                                            <td class="data">${product.Product_Spec3_T}</td>
                                        </tr>
                                        <tr>
                                            <th class="label">Country of Origin</th>
                                            <td class="data">${product.Product_Spec1_T}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="box-collateral box-tags">

                                
                                    <div class="form-add">
                                        <label for="productTagName"></label>
                                        <div class="input-box">

                                        </div>

                                    </div>
                                
                                <p class="note"></p>

                            </div>
                        </div>
                    </div>                </div>
                <div class="col-right sidebar"><div class="block block-viewed">

                    </div>
                    <div class="block block-cart">
                        <div class="block-title">
                            <strong><span>My Cart</span></strong>
                        </div>
                        <div class="block-content">
                                 <c:set var="total" value="0"/>
                                 <c:forEach var="list" items="${sessionScope.productList}">
                                     <div class="empty"  id="productList">
                                     ${list.productName} x ${list.amount}
                                     </div>
                                     <c:set var="total" value="${total+(list.amount*product.Product_Price1)}"/>
                                 </c:forEach>
                                 <div class="empty"  id="totalPrice">
                                    Total :  
                                    <fmt:formatNumber value="${total}" type="number" pattern="###,###,##0.00" />
                                    Baht
                                 </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>

</c:forEach>
    </body>
</html>