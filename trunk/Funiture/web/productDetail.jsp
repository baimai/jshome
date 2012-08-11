<%--
    Document   : jshome_ProductDetail
    Created on : 8 ส.ค. 2555, 13:56
    Author     : Sarawut
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="queryProduct" dataSource="webdb">
    SELECT *,cm.show_stock_balance_flag,cm.show_price_list_flag,cm.show_order_flag
    FROM product_detail_master pdm
    join product_group_master pgm on pgm.product_group_id = pdm.product_group_id
    left join stock_balance sb on sb.product_detail_id = pdm.product_detail_id
    left join unit_master um on um.unit_id = sb.unit_id
    join company_master cm on cm.company_id = pdm.company_id
    where pdm.product_detail_Id = ${param.productDetailId}
</sql:query>

<sql:query var="queryRelate" dataSource="webdb">
    select *,cm.show_stock_balance_flag,cm.show_price_list_flag,cm.show_order_flag from (
    (select * from product_detail_master pdm
    where pdm.product_code = (select product_code from product_detail_master where product_detail_id = ${param.productDetailId}) and
    pdm.product_detail_id != ${param.productDetailId}
    order by rand()
    limit 2)
    union all
    (select * from product_detail_master pdm
    where pdm.product_group_id = (select product_group_id from product_detail_master where product_detail_id =${param.productDetailId}) and
    pdm.product_detail_id != ${param.productDetailId}
    order by rand())
    )tbl1
    join company_master cm on cm.company_id = tbl1.company_id
    where tbl1.product_D_display_flag = 'Y'
    order by rand()
    limit 2
</sql:query>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/calendar-win2k-1.css" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link type="text/css" href="development-bundle/themes/base/ui.all.css" rel="stylesheet" />

        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
       	<script src="external/bgiframe/jquery.bgiframe.js" type="text/javascript"></script>
        <script src="ui/jquery.ui.widget.js" type="text/javascript"></script>
        <script src="ui/jquery.ui.mouse.js" type="text/javascript"></script>
        <script src="ui/jquery.ui.draggable.js" type="text/javascript"></script>
        <script src="ui/jquery.ui.position.js" type="text/javascript"></script>
        <script src="ui/jquery.ui.resizable.js" type="text/javascript"></script>
        <script src="ui/jquery.ui.dialog.js" type="text/javascript"></script>
        <script src="ui/jquery.effects.core.js" type="text/javascript"></script>
        <script src="ui/jquery.effects.blind.js" type="text/javascript"></script>
        <script src="ui/jquery.effects.explode.js" type="text/javascript"></script>
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

        <script type="text/javascript">
            // increase the default animation speed to exaggerate the effect
            $.fx.speeds._default = 10;
            $(function() {
                $( "#dialog" ).dialog({
                   
                    autoOpen: false,
                    height: 400,
                    width: 650,
                    modal: true

                });

                $( "#opener" ).click(function() {
                    $( "#dialog" ).dialog( "open" );
                    return false;
                });
            });
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
                    <br><br>
                    <c:forEach var="product" items="${queryProduct.rows}">
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
                                                                ${product.product_d_name_t}
                                                            </div>
                                                            <div class="product-name">รหัสสินค้า :${product.product_code}</div>
                                                            <div class="product-name">ประเภทสินค้า  : ${product.product_g_name_t}</div>
                                                            <div class="product-name">สถานะสินค้า  : <c:if test="${product.balance != null&&product.balance !=''}">${product.balance}</c:if></div>                                                           
                                                            <c:if test="${product.show_price_list_flag == 'W'}">
                                                                <c:if test="${propduct.product_price1 != null}">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price1}" type="number" pattern="###,###,##0.00"  />(ขายส่ง)</span></span>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${product.product_price2 != null }">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price2}" type="number" pattern="###,###,##0.00"  />(ขายส่ง,ส่วนลด)</span></span>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${product.show_price_list_flag == 'R'}">
                                                                <c:if test="${product.product_price3 != null}">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price3}" type="number" pattern="###,###,##0.00"  />(ขายปลีก)</span></span>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${product.product_price4 != null}">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price4}" type="number" pattern="###,###,##0.00"  />(ขายปลีก,ส่วนลด)</span></span>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${product.show_price_list_flag == 'A'}">
                                                                <c:if test="${product.product_price1 != null}">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price1}" type="number" pattern="###,###,##0.00"  />(ขายส่ง)</span></span>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${product.product_price2 != null}">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price2}" type="number" pattern="###,###,##0.00"  />(ขายส่ง,ส่วนลด)</span></span>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${product.product_price3 != null}">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price3}" type="number" pattern="###,###,##0.00"  />(ขายปลีก)</span></span>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${product.product_price4 != null}">
                                                                    <div class="price-box">
                                                                        <span class="regular-price" id="product-price-166" >
                                                                            <span class="price" style="font-style: inherit;" > ราคา : ฿ <fmt:formatNumber value="${product.product_price4}" type="number" pattern="###,###,##0.00"  />(ขายปลีก,ส่วนลด)</span></span>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>
                                                            <div class="add-to-box">
                                                                <div class="add-to-cart">
                                                                    <input type="hidden" id="productDetailId" name="productDetailId" value="${product.product_detail_id}" />
                                                                    <input type="hidden" id="productName" name="productName" value="${product.product_d_name_t}" />
                                                                    <input type="hidden" id="productCode" name="productCode" value="${product.product_code}" />
                                                                    <input type="hidden" id="productGroupId" name="productGroupId" value="${product.product_group_id}" />
                                                                    <input type="hidden" id="productPrice" name="productPrice" value="${product.product_price1}" />
                                                                    <input type="hidden" id="productPath" name="productPath" value="${product.product_d_pic_loc}"/>
                                                                    <c:if test="${product.show_order_flag == 'Y'}">
                                                                        <c:if test="${product.balance >= 1 }">
                                                                            <label for="qty">จำนวน:</label>
                                                                            <input type="text" name="qty" id="qty" maxlength="12" value="" title="Qty" class="input-text qty" />
                                                                            <button type="button" title="เพิ่มไปยังตะกร้า" class="button btn-cart" onclick="addToCart()"><span><span>เพิ่มไปยังตะกร้า</span></span></button>
                                                                        </c:if>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div >
                                                            <div id="dialog"  title="${product.product_d_name_t}">
                                                                <img  src="${product.product_d_pic_loc}" alt="${product.product_d_name_t}"/>
                                                            </div>
                                                            <div  id="opener">
                                                                <img  src="${product.product_d_pic_loc}" alt="${product.product_d_name_t}" width="250px" height="150px" onclick="$( '#dialog' ).dialog( 'open' );"/>
                                                            </div>
                                                        </div>
                                                        <div class="clearer"></div>
                                                    </form>
                                                </div>
                                                <div class="product-collateral">
                                                    <div class="box-collateral box-additional">
                                                        <h2>รายละเอียด</h2>
                                                        <table class="data-table" id="product-attribute-specs-table">
                                                            <col width="25%" />
                                                            <col />
                                                            <tbody>
                                                                <c:if test="${product.product_spec1_t != null && product.product_spec1_t != ''}">
                                                                    <tr>
                                                                        <th class="label">คุณลักษณะ</th>
                                                                        <td class="data">${product.product_spec1_t}</td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${product.product_spec2_t != null && product.product_spec2_t != ''}">
                                                                    <tr>
                                                                        <th class="label">โครงสร้าง</th>
                                                                        <td class="data">${product.product_spec2_t}</td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${product.product_spec3_t != null && product.product_spec3_t != ''}">
                                                                    <tr>
                                                                        <c:if test="${product.product_spec2_t != null && product.product_spec2_t != ''}">
                                                                            <th class="label"></th>
                                                                        </c:if>
                                                                        <c:if test="${product.product_spec2_t == null || product.product_spec2_t == ''}">
                                                                            <th class="label">โครงสร้าง</th>
                                                                        </c:if>

                                                                        <td class="data">${product.product_spec3_t}</td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${product.product_spec4_t != null && product.product_spec4_t != ''}">
                                                                    <tr>
                                                                        <th class="label">ขนาด</th>
                                                                        <td class="data">${product.product_spec4_t}</td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${product.product_spec5_t != null && product.product_spec5_t != ''}">
                                                                    <tr>
                                                                        <c:if test="${product.product_spec4_t != null && product.product_spec4_t != ''}">
                                                                            <th class="label"></th>
                                                                        </c:if>
                                                                        <c:if test="${product.product_spec4_t == null || product.product_spec4_t == ''}">
                                                                            <th class="label">ขนาด</th>
                                                                        </c:if>

                                                                        <td class="data">${product.product_spec5_t}</td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${product.product_spec6_t != null && product.product_spec6_t != ''}">
                                                                    <tr>
                                                                        <th class="label">สี</th>
                                                                        <td class="data">${product.product_spec6_t}</td>
                                                                    </tr>
                                                                </c:if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box-collateral box-description">
                                                        <h2>ข้อมูลเพิ่มเติม</h2>
                                                        <div class="std">
                                                            ${product.product_d_remark_t}   </div>
                                                    </div>
                                                </div>
                                            </div>                </div>
                                            <jsp:include page="myCart.jsp" />
                                        <div class="col-right sidebar"><img src="images/P4.png" width="130" height="35" alt="P4"/>
                                            <div class="block block-cart">
                                                <div class="block-title">
                                                    <strong></strong>
                                                </div>
                                                <div class="block-content">
                                                    <c:forEach var="relate" items="${queryRelate.rows}">
                                                        <div class="empty"  id="productList">
                                                            <div><a href="productDetail.jsp?productDetailId=${relate.product_detail_id}"> <img width="90" height="40" src="${relate.product_d_pic_loc}"/></a></div>
                                                            <div><center><a href="productDetail.jsp?productDetailId=${relate.product_detail_id}">${relate.product_d_name_t}</a></center></div>
                                                            <c:if test="${relate.show_price_list_flag != 'N'}">
                                                                <c:if test="${relate.show_price_list_flag == 'A'}">

                                                                    <c:if test="${relate.product_price1 != null && relate.product_price1 != ''}">
                                                                        <div class="price-box"><center>
                                                                                <span class="regular-price" id="product-price-42" ><span class="price"  >฿ <fmt:formatNumber value="${relate.product_price1}" type="number" pattern="###,###,##0.00"  /></span></span></center></div>
                                                                            </c:if>
                                                                            <c:if test="${relate.product_price1 == null || relate.product_price1 == ''}">
                                                                        <div class="price-box"><center>
                                                                                <span class="regular-price" id="product-price-42" ><span class="price"  >฿ <fmt:formatNumber value="${relate.product_price3}" type="number" pattern="###,###,##0.00"  /></span></span></center></div>
                                                                            </c:if>
                                                                        </c:if>
                                                                        <c:if test="${relate.show_price_list_flag == 'W'}">
                                                                    <div class="price-box"><center>
                                                                            <span class="regular-price" id="product-price-42" ><span class="price" >฿ <fmt:formatNumber value="${relate.product_price1}" type="number" pattern="###,###,##0.00"  /></span></span></center></div>
                                                                        </c:if>
                                                                        <c:if test="${relate.show_price_list_flag == 'R'}">
                                                                    <div class="price-box"><center>
                                                                            <span class="regular-price" id="product-price-42" ><span class="price"  >฿ <fmt:formatNumber value="${relate.product_price3}" type="number" pattern="###,###,##0.00"  /></span></span></center></div>
                                                                        </c:if>
                                                                    </c:if>
                                                                    <c:if test="${relate.show_order_flag == 'Y'}"><center><button type="button" title="เพิ่มไปยังตะกร้า" class="button btn-cart" onclick="window.location='productDetail.jsp?productDetailId=${relate.product_detail_id}'"><span><span>เพิ่มไปยังตะกร้า</span></span></button></center></c:if>
                                                        </div>
                                                        <br/>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <jsp:include page="footer.jsp" />
                    <br/><br/>
                </div>
            </div>
            <div class="cleared"></div>
        </div>
        <div class="cleared"></div>
    </body>

</html>
