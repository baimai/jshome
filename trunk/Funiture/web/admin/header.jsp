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
  
    <%--<script type="text/javascript" src="js/menu.js"></script>--%>
</head>

<body>
<p><img src="images/head.jpg"  /></p>
<style type="text/css">



div#menu {
    top:0px;
    left:0px;
    width:100%;
		background:transparent url(images/header_bg.gif) repeat-x 0 0;  
}
div#copyright { display: none; }
</style>

<div id="menu">
    <ul class="menu">
     <li class="last"><a href="Company.jsp"><span>ข้อมูลบริษัท</span></a></li>
        <li><a href="#" class="parent"><span>จัดการเมนู</span></a>
             <div><ul>
                <li><a href="MenuGroup.jsp" class="parent"><span>ประเภทเมนู</span></a>

                </li>
                <li><a href="menageMenuDetail.jsp" class="parent"><span>รายการเมนู</span></a>

                </li>
                <li><a href="ProductSetup.jsp" class="parent"><span>จัดการรายการเมนู</span></a>

                </li>
            </ul></div>
        </li>
        <li><a href="addProductSetup.jsp" class="parent"><span>จัดการสินค้า</span></a>
            <div><ul>
                <li><a href="ProductGroup.jsp" class="parent"><span>ประเภทสินค้า</span></a>
                    
                </li>
                <li><a href="manageProductDetail.jsp" class="parent"><span>รายการสินค้า</span></a>
                   
                </li>
               <li><a href="color.jsp" class="parent"><span>สีของสินค้า</span></a>

                </li>
            </ul></div>
        </li>
        <li><a href="#"class="parent"><span>จัดการสมาชิก</span></a>
        <div><ul>
                        <li><a href="memberMaster.jsp"><span>ข้อมูลสมาชิก</span></a></li>
                        <li><a href="#"><span>รายละเอียดสมาชิก</span></a></li>
                    </ul></div></li>
        <li class="last"><a href="#"><span>จัดการใบสั่งซื้อ</span></a></li>
        <li class="last"><a href="#"><span>จัดการผู้ใช้</span></a></li>
    </ul>
</div>
</body>
</html>

