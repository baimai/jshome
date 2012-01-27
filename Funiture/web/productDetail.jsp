<%-- 
    Document   : productDetail
    Created on : 17 พ.ย. 2554, 10:14:12
    Author     : Achilles
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="queryProduct" dataSource="webdb">
    SELECT *
    FROM product_detail_master 
    where product_detail_Id = ${param.productDetailId}
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/calendar-win2k-1.css" />
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
        <script type="text/javascript">
            function addToCart(){
                if(document.getElementById('qty').value > 0){
                    var productDetailId = document.getElementById('productDetailId').value ;
                    var qty = document.getElementById('qty').value ;
                    var productName = document.getElementById('productName').value ;
                    var productCode = document.getElementById('productCode').value ;
                    var productGroupId = document.getElementById('productGroupId').value ;
                    var productPrice = document.getElementById('productPrice').value ;
                    var productPath = document.getElementById('productPath').value ;
                    var status = "plus";
                    var param = "productDetailId="+productDetailId+"&amount="+qty+"&productPrice="+productPrice+"&productName="+productName+"&status="+status+"&productPath="+productPath+"&productCode="+productCode+"&productGroupId="+productGroupId;
                    postDataReturnText("addProduct.do",param,showCart);
                }
            }
            function showCart(text){
                //document.getElementById("productList").innerHTML=text;
                location.href="cartDetail.jsp";
            }
        </script>
    </head>
    <body>
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
                    <c:forEach var="product" items="${queryProduct.rows}">
                        <%-- product detail --%>
                        <div class="wrapper">

                            <div class="page">
                                <div class="main-container col2-right-layout">

                                    <div class="main">
                                        <div class="col-main">
                                            <div class="page-title">
                                                <h3>${product.product_d_name_t}</h3>
                                            </div>
                                            <div id="messages_product_view"></div>
                                            <div class="product-view">
                                                <div class="product-essential">
                                                    <form action="cartDetail.jsp" method="post" id="product_addtocart_form">
                                                        <div class="no-display">
                                                            <input type="hidden" name="product" value="51" />
                                                            <input type="hidden" name="related_product" id="related-products-field" value="" />
                                                        </div>

                                                        <div class="product-shop">
                                                            <div class="product-name">
                                                                <h1>${product.product_d_name_t}</h1>
                                                            </div>

                                                            <p class="email-friend"><a href="http://freedemo.templates-master.com/f002/sendfriend/product/send/id/51/">Email to a Friend</a></p>

                                                            <p class="no-rating"><a href="http://freedemo.templates-master.com/f002/review/product/list/id/51/#review-form">Be the first to review this product</a></p>

                                                            <p class="availability in-stock">สถานะสินค้า: <span>In stock</span></p>



                                                            <div class="price-box">
                                                                <span class="regular-price" id="product-price-51">
                                                                    <span class="price">${product.product_price1}</span>                </span>

                                                            </div>




                                                            <div class="add-to-box">


                                                                <div class="add-to-cart">
                                                                    <label for="qty">จำนวน:</label>
                                                                    <input type="hidden" id="productDetailId" name="productDetailId" value="${product.product_detail_id}" />
                                                                    <input type="hidden" id="productName" name="productName" value="${product.product_d_name_t}" />
                                                                    <input type="hidden" id="productCode" name="productCode" value="${product.product_code}" />
                                                                    <input type="hidden" id="productGroupId" name="productGroupId" value="${product.product_group_id}" />
                                                                    <input type="hidden" id="productPrice" name="productPrice" value="${product.product_price1}" />
                                                                    <input type="hidden" id="productPath" name="productPath" value="${product.product_d_pic_loc}"/>
                                                                    <input type="text" name="qty" id="qty" maxlength="12" value="" title="Qty" class="input-text qty" />
                                                                    <button type="button" title="เพิ่มไปยังตะกร้า" class="button btn-cart" onclick="addToCart()"><span><span>เพิ่มไปยังตะกร้า</span></span></button>
                                                                </div>
                                                                <span class="or">OR</span>

                                                                <ul class="add-to-links">
                                                                    <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/51/" class="link-wishlist">Add to Wishlist</a></li>
                                                                    <li><span class="separator">|</span> <a href="http://freedemo.templates-master.com/f002/catalog/product_compare/add/product/51/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvb3R0b21hbi5odG1sP19fX1NJRD1V/" class="link-compare">Add to Compare</a></li>
                                                                </ul>
                                                            </div>


                                                            <div class="short-description">
                                                                <h2>Quick Overview</h2>
                                                                <div class="std">With durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.</div>
                                                            </div>



                                                        </div>

                                                        <div class="product-img-box">
                                                            <p class="product-image product-image-zoom">
                                                                <img  src="${product.product_d_pic_loc}" alt="${product.product_d_name_t}" title="${product.product_d_name_t}"  /></p>


                                                        </div>

                                                        <div class="clearer"></div>
                                                    </form>

                                                </div>

                                                <div class="product-collateral">
                                                    <div class="box-collateral box-description">
                                                        <h2>รายละเอียด</h2>
                                                        <div class="std">
                                                            ${product.product_d_remark_t}   </div>
                                                    </div>
                                                    <div class="box-collateral box-additional">
                                                        <h2>ข้อมูลเพิ่มเติม</h2>
                                                        <table class="data-table" id="product-attribute-specs-table">
                                                            <col width="25%" />
                                                            <col />
                                                            <tbody>
                                                                <tr>
                                                                    <th class="label">Model</th>
                                                                    <td class="data">${product.product_spec1_t}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="label">Finish</th>
                                                                    <td class="data">${product.product_spec2_t}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="label">Country of Origin</th>
                                                                    <td class="data">${product.product_spec3_t}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>



                                                </div>
                                            </div>                </div>
                                            <jsp:include page="myCart.jsp" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <%-- end product detail --%>
                    <jsp:include page="footer.jsp" />
                    <br/><br/>
                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"><a href="http://www.2createawebsite.com/artisteer">Website Template created with Artisteer</a>.</p>

    </body>
</html>
