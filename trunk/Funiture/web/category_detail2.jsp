<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:query var="query" dataSource="webdb">
    select count(pps.pic_code) as count,pps.*,md.*
    From  pic_product_setup pps
    JOIN  product_detail_master pdm on pdm.product_detail_id = pps.product_detail_id
    JOIN  product_group_master  pgm on pgm.product_group_id  = pdm.product_group_id
    JOIN  menu_detail_master    md  on md.pic_code = pps.pic_code
    WHERE pdm.product_d_display_flag = 'Y' and pgm.product_g_display_flag = 'Y' and
    md.pic_code != '99999'
    group by pps.pic_code
    order by pps.pic_code
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT count(pdm.product_detail_id) as count,pgm.* FROM product_group_master pgm
    left join (select * from product_detail_master where product_d_display_flag = 'Y') pdm on pdm.product_group_id = pgm.product_group_id
    where pgm.product_g_display_flag = 'Y'
    group by product_group_code
    order by product_group_code
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  >
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <script type="text/javascript"language="javascript">

            function showProduct(text){
                document.getElementById("productList").innerHTML=text;
            }
            function setProduct(menuCode,pageShow,curPage,menuType){
                var param = "menuCode="+menuCode+"&show="+pageShow+"&page="+curPage+"&menuType="+menuType;
                document.getElementById('menuCode').value = menuCode;
                document.getElementById('navShow').value = pageShow;
                document.getElementById('menuType').value = menuType;
                postDataReturnText("categoryProduct.jsp",param,showProduct);
                //setTimeout("delay()",500);
                //postDataReturnText("plus.jsp",field,displayTable);
                //$('focusHere').focus();

            }
            function addToCart(productCode,productName,amount,status,productGroup,productPrice){
                var param = "productCode="+productCode+"&productName="+productName+"&amount="+amount+"&status="+status+"&productGroup="+productGroup+"&productPrice="+productPrice
                postDataReturnText("addProduct.do",param,showCart);
                //setTimeout("delay()",500);
                //postDataReturnText("plus.jsp",field,displayTable);
           
                // $('focusHere').focus();
            }
            function showCart(text){
                document.getElementById("myCart").innerHTML=text;
            }

            function delay(){

            }
            function test(){
                alert('test');
            }
            $(document).ready(function() {
                // $('focusHere').focus();

            });
        </script>

        <!--<script typcatalog-category-viewe="text/javascript">var Translator = new Translate({"Credit card number doesn't match credit card type":"Credit card number does not match credit card type","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Please use only letters (a-z or A-Z), numbers (0-9) or underscores (_) in this field, first character must be a letter."});</script --></head>
    <body class="  catalog-category-view" onload="setProduct('00010','9','1','picCode');" >
        <input type="hidden" value="" id="menuCode"/>
        <input type="hidden" value="9" id="navShow"/>
        <input type="hidden" value="1" id="navCurPage"/>
        <input type="hidden" value="name" id="navSort"/>
        <input type="hidden" value="picCode" id="menuType"/>
        <div class="wrapper">
            <div class="page">
            </div>
        </div><div class="main-container col3-layout">
            <div class="main">                
                <div class="col-wrapper">
                    <div id="productList">
                    </div>
                    <div class="col-left sidebar"><img src="images/P1-2.png" width="180" height="35" alt="P1-2"/>

                        <div class="block block-layered-nav">
                            
                            <div class="block-content">
                              
                                <ul>      
                                    <c:forEach var="menu" items="${query.rows}">
                                        <li><img src="${menu.Menu_C_Icon_Loc}" /><a href="#" onclick="setProduct('${menu.pic_code}',document.getElementById('navShow').value,'1','picCode');">${menu.menu_c_name_t}</a> (${menu.count})</li>
                                    </c:forEach>
                                </ul>

                            </div>
                        </div>

                    </div>
                    <div class="col-left sidebar"><img src="images/P2-2.png" width="180" height="35" alt="P2-2"/>
                        <div class="block block-layered-nav">

                           
                            <div class="block-content">
                               
                                <ul>
                                    <c:forEach var="menu2" items="${query2.rows}">
                                        <li><img src="${menu2.Product_Icon_Loc}" /><a href="#" onclick="setProduct('${menu2.product_group_id}',document.getElementById('navShow').value,'1','group');">${menu2.product_g_name_t}</a> (${menu2.count})</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>

                <jsp:include page="myCart.jsp" />
            </div>
        </div>
    </body>
</html>