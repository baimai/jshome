<%--
    Document   : jshome_Category_detail2
    Created on : 8 ส.ค. 2555, 10:36
    Author     : Sarawut
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query" dataSource="webdb">
    select count(pps.pic_id) as count,pps.*,md.*
    From  pic_product_setup pps
    join pic_product_setup_detail ppd on ppd.pic_id = pps.Pic_Id
    JOIN  product_detail_master pdm on pdm.product_detail_id = ppd.product_detail_id
    JOIN  product_group_master  pgm on pgm.product_group_id  = pdm.product_group_id
    JOIN  menu_detail_master    md  on md.pic_id = pps.pic_id
    WHERE pdm.product_d_display_flag = 'Y' and pgm.product_g_display_flag = 'Y' and
    md.Menu_Code_Id != 4
    group by pps.pic_id
    order by pps.pic_id
</sql:query>

<sql:query var="query2" dataSource="webdb">
    SELECT count(pdm.product_detail_id) as count,pgm.* FROM product_group_master pgm
    left join (select * from product_detail_master where product_d_display_flag = 'Y') pdm on pdm.product_group_id = pgm.product_group_id
    where pgm.product_g_display_flag = 'Y'
    group by product_group_code
    order by product_group_code
</sql:query>

<!DOCTYPE html>
<html  >

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />

        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
        <script type="text/javascript"language="javascript">
            function showProduct(text){
                document.getElementById("productList").innerHTML=text;
            }
            function setProduct(menuId,pageShow,curPage,menuType){
                var param = "menuId="+menuId+"&show="+pageShow+"&page="+curPage+"&menuType="+menuType;
                document.getElementById('menuId').value = menuId;
                document.getElementById('navShow').value = pageShow;
                document.getElementById('menuType').value = menuType;
                postDataReturnText("categoryProduct.jsp",param,showProduct);
            }
            function addToCart(productCode,productName,amount,status,productGroup,productPrice){
                var param = "productCode="+productCode+"&productName="+productName+"&amount="+amount+"&status="+status+"&productGroup="+productGroup+"&productPrice="+productPrice
                postDataReturnText("addProduct.do",param,showCart);
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
            });
        </script>
    </head>

    <body class="  catalog-category-view" onload="setProduct('1','9','1','picId');" >
        <input type="hidden" value="" id="menuId"/>
        <input type="hidden" value="9" id="navShow"/>
        <input type="hidden" value="1" id="navCurPage"/>
        <input type="hidden" value="name" id="navSort"/>
        <input type="hidden" value="picId" id="menuType"/>
        <div class="wrapper">
            <div class="page"></div>
        </div>
        <div class="main-container col3-layout">
            <div class="main">                
                <div class="col-wrapper">
                    <div id="productList"></div>

                    <div class="col-left sidebar">
                        <img src="images/P1-2.png" width="180" height="35" alt="P1-2"/>
                        <div class="block block-layered-nav">
                            <div class="block-content">
                                <ul>      
                                    <c:forEach var="menu" items="${query.rows}">
                                        <li><img src="${menu.Menu_C_Icon_Loc}" /><a href="#" onclick="setProduct('${menu.pic_id}',document.getElementById('navShow').value,'1','picId');">${menu.menu_c_name_t}</a> (${menu.count})</li>
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
                                        <li>
                                            <img src="${menu2.Product_Icon_Loc}" width="30" height="30"/><a href="#" onclick="setProduct('${menu2.product_group_id}',document.getElementById('navShow').value,'1','group');">${menu2.product_g_name_t}</a> (${menu2.count})</li>
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