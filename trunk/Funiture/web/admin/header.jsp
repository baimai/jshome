<%-- 
    Document   : header
    Created on : 6 ธ.ค. 2554, 11:41:26
    Author     : Baimai
--%>
<%@ include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link type="text/css" href="css/menu.css" rel="stylesheet" />
        <link rel="icon" href="images/js.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="images/js.ico" type="image/x-icon" />
         <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/print.css" media="print" />
        <%-- <script type="text/javascript" src="js/menu.js"></script> --%>
        <style type="text/css">



            div#menu {
                top:170px;
                left:5px;
                width:99.1%;

                background:transparent url(images/header_bg.gif) repeat-x 0 0;
            }

        </style>
    </head>

    <body>
        <div class="header-topbar">
            <div class="quick-access">
                <div class="welcome-msg">
                </div>
                <div class="shop-access">
                    <ul class="links">
                        <li class=" last" >
                            <c:if test="${sessionScope.loginDetail!=null}"><a href="../logout.do" title="Log Out" >Log Out</a></c:if>
                            <c:if test="${sessionScope.loginDetail==null}"><a href="../Login.jsp" title="Log In" >Log In</a></c:if>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div><img src="images/head.jpg" width="100%" height="100"/> </div>



        <div id="menu">
            <ul class="menu">
                <c:if test="${sessionScope.loginDetail.userAuthoritySts == 'A'}">
                    <li ><a href="#"><span>ข้อมูลบริษัท</span></a>
                        <div><ul>
                                <li><a href="Company.jsp" class="parent"><span>ข้อมูลบริษัท</span></a>

                                </li>
                            </ul></div>
                    </li>
                    <li><a href="#" class="parent"><span>จัดการสินค้า</span></a>
                        <div><ul>
                                <li><a href="ProductGroup.jsp" class="parent"><span>กลุ่มสินค้า</span></a>

                                </li>
                                <li><a href="color.jsp" class="parent"><span>สีของสินค้า</span></a> </li>
                                <li><a href="manageProductDetailMaster.jsp" class="parent"><span>รายการสินค้า</span></a>

                                </li>
                                <li><a href="Stock.jsp" class="parent"><span>นำเข้าสินค้า</span></a></li>
                                <li><a href="stockMaster.jsp" class="parent"><span>จำนวนสินค้า</span></a></li>


                               
                            </ul></div>
                    </li>
                    <li><a href="#" class="parent"><span>จัดการเมนู</span></a>
                        <div><ul>
                                <li><a href="MenuGroup.jsp" class="parent"><span>เมนูหลัก</span></a>

                                </li>
                                <li><a href="MenuDetail.jsp" class="parent"><span>รายการเมนู</span></a>

                                </li>

                                <li><a href="ProductSetupHeader.jsp" class="parent"><span>จัดการรูปแสดงสินค้า</span></a>

                                </li>
                                <li><a href="userSecurity.jsp" class="last"><span>ผู้ใช้</span></a></li>
                            </ul></div>
                    </li>

                    <li><a href="#"class="parent"><span>จัดการสมาชิก</span></a>
                        <div><ul>
                                <li><a href="Member.jsp"><span>ข้อมูลสมาชิก</span></a></li>
                                <li><a href="MemberGrade.jsp"><span>ประเภทสมาชิก</span></a></li>
                            </ul></div>
                    </li>
                </c:if>
                <li class="parent"><a href="#"><span>จัดการใบสั่งซื้อ</span></a>
                    <div>
                        <ul>
                            <li><a href="orderHeader.jsp" class="parent"><span>รายการสั่งซื้อ</span></a></li>
                        </ul>
                    </div>

                </li>
                <c:if test="${sessionScope.loginDetail.userAuthoritySts == 'A'}">
                    <li class="parent"><a href="#"><span>แค็ดตาล็อก</span></a>
                        <div>
                            <ul>
                                <li><a href="catalogSetup.jsp" class="parent"><span>สร้างเอกสารแค็ตาล็อก</span></a></li>
                            </ul>
                        </div>

                    </li>
                    <li class="last"><a href="#"><span>รายงาน</span></a>
                        <div>
                            <ul>
                                <li><a href="reportOrder.jsp" class="last"><span>รายงานสั่งซื้อ</span></a></li>

                            </ul>
                        </div>

                    </li>
                </c:if>
            </ul>
        </div>

    </body>
</html>

