<%-- 
    Document   : header
    Created on : 6 ธ.ค. 2554, 11:41:26
    Author     : Baimai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" href="css/menu.css" rel="stylesheet" />
  
   <%-- <script type="text/javascript" src="js/menu.js"></script> --%>
 <style type="text/css">



div#menu {
    top:130px;
    left:0px;
    width:100%;

background:transparent url(images/header_bg.gif) repeat-x 0 0;
}

</style>
</head>

<body>
<div><img src="images/head.jpg" width="100%" height="100"/> </div>
   


<div id="menu">
    <ul class="menu">
     <li ><a href="Company.jsp"><span>ข้อมูลบริษัท</span></a></li>
       <li><a href="#" class="parent"><span>จัดการสินค้า</span></a>
            <div><ul>
                <li><a href="ProductGroup.jsp" class="parent"><span>ประเภทสินค้า</span></a>

                </li>
                <li><a href="manageProductDetailMaster.jsp" class="parent"><span>รายการสินค้า</span></a>

                </li>
                <li><a href="Stock.jsp" class="parent"><span>นำเข้าสินค้า</span></a>

                </li>
               <li><a href="color.jsp" class="parent"><span>สีของสินค้า</span></a>

              </li>
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
            </ul></div>
        </li>
      
        <li><a href="#"class="parent"><span>จัดการสมาชิก</span></a>
        <div><ul>
                        <li><a href="Member.jsp"><span>ข้อมูลสมาชิก</span></a></li>
                        <li><a href="MemberGrade.jsp"><span>ประเภทสมาชิก</span></a></li>
                    </ul></div></li>
        <li class="last"><a href="#"><span>จัดการใบสั่งซื้อ</span></a>
            <div>
                <ul>
                    <li><a href="orderHeader.jsp" class="parent"><span>รายการสั่งซื้อ</span></a></li>
                </ul>
            </div>

        </li>
        <li class="last"><a href="#"><span>จัดการแคตตาล็อก</span></a>
            <div>
                <ul>
                    <li><a href="catalogSetup.jsp" class="parent"><span>สร้างเอกสารแคตาล็อก</span></a></li>
                </ul>
            </div>

        </li>
        <li class="last"><a href="userSecurity.jsp"><span>จัดการผู้ใช้</span></a></li>
  </ul>
</div>
   
</body>
</html>

