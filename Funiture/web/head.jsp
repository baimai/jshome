<%--
    Document   : jshome_head
    Created on : 8 ส.ค. 2555, 13:36
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query2" dataSource="webdb">
    select * from menu_group_master mg
    where mg.menu_permission='C'
    order by mg.Menu_Group_Id
</sql:query>

<sql:query var="query3" dataSource="webdb">
    select * from company_master where company_id = ${applicationScope.Company_Id}
</sql:query>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>

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
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/validator.css" type="text/css" media="all" /> <!-- ไม่มี -->
        <link rel="stylesheet" href="css/top_menu.css" type="text/css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />

        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script src="js/jquery-1.4.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery-1.7.2-ui.min.js"></script>
        <script type="text/javascript" src="js/top_menu.js"></script>
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
                        <c:if test="${sessionScope.loginDetail!=null}">

                            <li class="first" ><a href="profile.jsp" title="My Account" >ข้อมูลส่วนตัว</a></li>
                            <li class="" ><a href="order.jsp" title="My Order" >รายการสั่งซื้อ</a></li></c:if>
                            <li ><a href="forgotPassword.jsp" title="My Cart" class="top-link-cart">ลืมรหัสผ่าน</a></li>

                            <li class=" last" >
                            <c:if test="${sessionScope.loginDetail!=null}"><a href="logout.do" title="Log Out" >ออกจากระบบ</a></c:if>
                            <c:if test="${sessionScope.loginDetail==null}"><a href="Login.jsp" title="Log In" >เข้าสู่ระบบ</a></c:if>
                            <c:if test="${sessionScope.loginDetail==null}"><a href="Login.jsp" title="Log In" >สมัครสมาชิก</a></c:if>
                        </li>
                    </ul>
                </div>
                <div class="box header-cart" id="header-cart">
                    <div class="shop-access">
                        <a href="cartDetail.jsp" title="My Cart" class="top-link-cart">สินค้าในตระกร้า (${itemNum} รายการ)</a>
                    </div>
                </div>
            </div>
        </div>
        <div >
            <c:forEach items="${query3.rows}" var="company"> <img src="${company.company_header_loc}" width="95%" height="100px" border="0" /> </c:forEach>
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
        <script type="text/javascript">
            $('#nav').spasticNav();
        </script>
    </body>
</html>
