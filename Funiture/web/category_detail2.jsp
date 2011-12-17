<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:query var="query" dataSource="webdb">
    SELECT count(*) as count,md.*,me.* FROM pic_product_setup me
    join menu_detail_master md on me.pic_code = md.pic_code
    group by me.pic_code
</sql:query>

<sql:query var="query2" dataSource="webdb">
    SELECT count(*) as count , 'ทั้งหมด' as T,'All' as E FROM pic_product_setup me
    join menu_detail_master md on me.pic_code = md.pic_code
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  >
    <head>
        <title>Computers - Electronics</title>
        <meta http-equiv="Content-Type" content="text/html; charset=tis-620" />
        <meta name="description" content="Default Description" />
        <meta name="keywords" content="Magento, Varien, E-commerce" />
        <meta name="robots" content="*" />
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <script language="javascript">

            function showProduct(text){
                document.getElementById("productList").innerHTML=text;
            }
            function setProduct(menuCode,pageShow,curPage){
                var param = "menuCode="+menuCode+"&show="+pageShow+"&page="+curPage
                document.getElementById('menuCode').value = menuCode;
                document.getElementById('navShow').value = pageShow;
                postDataReturnText("categoryProduct.jsp",param,showProduct);
                //setTimeout("delay()",500);
                //postDataReturnText("plus.jsp",field,displayTable);
           

            }
            function addToCart(productCode,productName,amount,status,productGroup,productPrice){
                var param = "productCode="+productCode+"&productName="+productName+"&amount="+amount+"&status="+status+"&productGroup="+productGroup+"&productPrice="+productPrice
                postDataReturnText("addProduct.do",param,showCart);
                //setTimeout("delay()",500);
                //postDataReturnText("plus.jsp",field,displayTable);
           

            }
            function showCart(text){
                document.getElementById("myCart").innerHTML=text;
            }

            function delay(){

            }
            function test(){
                alert('test');
            }
        </script>
  
        <!--<script type="text/javascript">var Translator = new Translate({"Credit card number doesn't match credit card type":"Credit card number does not match credit card type","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Please use only letters (a-z or A-Z), numbers (0-9) or underscores (_) in this field, first character must be a letter."});</script --></head>
    <body class=" catalog-category-view categorypath-electronics-computers-html category-computers" onload="setProduct('all','9','1');" >
        <input type="hidden" value="" id="menuCode"/>
        <input type="hidden" value="9" id="navShow"/>
        <input type="hidden" value="1" id="navCurPage"/>
        <input type="hidden" value="name" id="navSort"/>
        <div class="wrapper">

            <div class="page">


            </div>
        </div>        <div class="main-container col3-layout">


            <div class="main">
                <div class="col-wrapper">
                    <div id="productList">
                       
                    </div>
                    
                    <div class="col-left sidebar"><div class="block block-layered-nav">
                            <div class="block-title"><strong>Products Navigation</strong></div>
                            <div class="block-content">
                                <p class="block-subtitle">Shopping Options</p> 
                                <ul>
                                    <c:forEach var="all" items="${query2.rows}">
                                        <li><a href="#" onclick="setProduct('all',document.getElementById('navShow').value,'1');">${all.T}</a> (${all.count})</li>
                                    </c:forEach>        
                                    <c:forEach var="menu" items="${query.rows}">
                                        <li><a href="#" onclick="setProduct('${menu.menu_code}',document.getElementById('navShow').value,'1');">${menu.menu_c_name_t}</a> (${menu.count})</li>
                                    </c:forEach>
                                </ul>

                            </div>
                        </div>

                        <!--<div class="block block-banner">
                                    <a href="http://freedemo.templates-master.com/f002/checkout/cart/">
                                <img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/media/col_left_callout-1.jpg" width="195" alt="Our customer service is available 24/7. Call us at (800) DEMO-NUMBER." style="display:block;" />
                                </a>
                            </div>
                        
                        <div class="block block-banner">
                                    <a href="http://freedemo.templates-master.com/f002/checkout/cart/">
                                <img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/media/col_left_callout-2.jpg" width="195" alt="Our customer service is available 24/7. Call us at (800) DEMO-NUMBER." style="display:block;" />
                                </a>
                            </div> -->
                    </div>
                </div>
                <div id="myCart">
                    <jsp:include page="myCart.jsp" />
                </div>
            </div>

        </div>
    </body>
</html>