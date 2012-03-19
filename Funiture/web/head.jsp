<%--
    Document   : header_2
    Created on : 13 พ.ย. 2554, 19:55:55
    Author     : Achilles
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:query var="query2" dataSource="webdb">
    select * from menu_group_master mg
    where mg.menu_permission='C'
    order by mg.Menu_Group_Id
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="content-language" content="th" />
        <meta name="robots" content="index, company,category,contactUs" />
        <meta name="description" content="jshome " />
        <meta name="revisit-after" content="*"/>
        <meta name="keywords" content="ชุดโซฟาไม้,ชุดโซฟาผ้า,ชุดโต๊ะกลางหิน,ชุดมินิบาร์,ชุดหวายแท้,ชุดหวายซันทาน่า,เอเลียส,ชุดอลูอัล
              ,เตียงชายหาด,ชุดอาหารกระจก,ชุดอาหารไม้,ชุดอาหารหินกลม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 4 ที่นั่ง,โต๊ะกลางกระจก,
              โต๊ะกลาง,ชุดกาแฟ,เตียง,เก้าอี้,เก้าอี้ชิงช้า,ชั้นวางโทรศัพท์,ชั้นวางหนังสือ,ราวไม้ ,ฉากกั้น,กระเช้า, โต๊ะคาเฟ่" />       
        <link rel="icon" href="images/js.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="images/js.ico" type="image/x-icon" />

        <link rel="stylesheet" href="css/top_menu.css" type="text/css" media="all" />
        <script type="text/javascript" src="jshome/js/jquery-1.7.2-ui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/print.css" media="print" />
        <script src="jshome/js/jquery-1.4.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="jshome/js/jquery-1.7.2-ui.min.js"></script>
        <script type="text/javascript" src="jshome/js/jquery.spasticNav.js"></script>
    <title>jshome</title>
    </head>
    <body >
        <c:set var="itemNum" value="0" />
        <c:forEach items="${sessionScope.productList}" varStatus="counter">
            <c:set var="itemNum" value="${counter.count}" />
        </c:forEach>
        <div class="header-topbar">
            <div class="quick-access">
                <div class="welcome-msg">
                    <c:if test="${sessionScope.loginDetail!=null}">ยินดีต้อนรับ ${sessionScope.loginDetail.memberFName} ${sessionScope.loginDetail.memberLName}</c:if>
                    <c:if test="${sessionScope.loginDetail==null}">ยินดีต้อนรับ ลูกค้า</c:if>
                </div>
                <div class="shop-access"><ul class="links">
                        <c:if test="${sessionScope.loginDetail!=null}"><li class="first" ><a href="profile.jsp" title="My Account" >My Account</a></li></c:if>

                        <li ><a href="#" title="My Cart" class="top-link-cart">My Cart (${itemNum} item)</a></li>
                        <li ><a href="forgotpassword.jsp" title="My Cart" class="top-link-cart">forgot password</a></li>
                        <li ><a href="cartDetail.jsp" title="Checkout" class="top-link-checkout">Checkout</a></li>
                        <li class=" last" >
                            <c:if test="${sessionScope.loginDetail!=null}"><a href="logout.do" title="Log Out" >Log Out</a></c:if>
                            <c:if test="${sessionScope.loginDetail==null}"><a href="Login.jsp" title="Log In" >Log In</a></c:if>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div >
            <img src="images/head.jpg" width="95%" height="100px" border="0" usemap="#Map"/>
        </div>
        <div id="container"  >
            <ul id="nav">
                <c:forEach var="topmenu" items="${query2.rows}">
                    <c:if test="${topmenu.Menu_G_Name_T=='หน้าหลัก' || topmenu.Menu_G_Name_E =='Home'}">
                        <li id="selected"><a href="${topmenu.Menu_G_Icon_Loc}">${topmenu.Menu_G_Name_T}</a></li>
                    </c:if>
                    <c:if test="${topmenu.Menu_G_Name_T!='หน้าหลัก' && topmenu.Menu_G_Name_E !='Home'}">
                        <li ><a href="${topmenu.Menu_G_Icon_Loc}">${topmenu.Menu_G_Name_T}</a></li>
                    </c:if>
                </c:forEach>

            </ul>
        </div>
        <script type="text/javascript" src="js/top_menu.js"></script>
        
        <script type="text/javascript">
            $('#nav').spasticNav();
        </script>
    </body>
</html>
