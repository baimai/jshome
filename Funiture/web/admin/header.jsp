<%--
    Document   : jshome_Header
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link type="text/css" href="css/menu.css" rel="stylesheet" />
        <link rel="icon" href="images/js.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="images/js.ico" type="image/x-icon" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" /> 
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
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
        <div class="header-topbar" >
            <div class="quick-access">
                <div class="welcome-msg">
                    <c:if test="${sessionScope.loginDetail!=null}">ผู้ใช้:  ${sessionScope.loginDetail.userNameT} &nbsp ${sessionScope.loginDetail.companyMasterEntity.companyNameT}</c:if>
                    <c:if test="${sessionScope.loginDetail==null}">ผู้ใช้ </c:if>
                </div>
                <div class="shop-access">
                    <ul class="links" >
                        <li class=" last" >
                            <c:if test="${sessionScope.loginDetail!=null}"><a href="../logout.do" title="Log Out" >ออกจากระบบ</a></c:if>
                            <c:if test="${sessionScope.loginDetail==null}"><a href="../Login.jsp" title="Log In" >เข้าสู่ระบบ</a></c:if>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div>
            <img src="images/head.jpg" width="100%" height="100"/>
        </div>

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
                                <li><a href="color.jsp" class="parent"><span>ข้อมูลสี</span></a> </li>
                                <li><a href="ProductGroup.jsp" class="parent"><span>กลุ่มสินค้า</span></a>

                                </li>

                                <li><a href="manageProductDetailMaster.jsp" class="parent"><span>รายการสินค้า</span></a>

                                </li>
                                <li><a href="stockMaster.jsp" class="parent"><span>รับสินค้าเข้าคลัง</span></a></li>

                            </ul></div>
                    </li>
                    <li><a href="#" class="parent"><span>จัดการเมนู</span></a>
                        <div><ul>
                                <li><a href="MenuGroup.jsp" class="parent"><span>เมนูหลัก</span></a>

                                </li>
                                <li><a href="MenuDetail.jsp" class="parent"><span>เมนูย่อย</span></a>

                                </li>

                                <li><a href="ProductSetupHeader.jsp" class="parent"><span>กำหนดชุดการแสดงสินค้า</span></a>

                                </li>
                                <li><a href="ProductSetup.jsp" class="parent"><span>กำหนดรายการแสดงสินค้า</span></a>

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

