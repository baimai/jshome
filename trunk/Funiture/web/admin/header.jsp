<%-- 
    Document   : header
    Created on : 6 ธ.ค. 2554, 11:41:26
    Author     : Achilles
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
<p><img src="images/banner.png" width="900px" height="150px" /></p>
<style type="text/css">
* { margin:0;
    padding:0;
}
html { background:#ffff; }
body {
    margin:0px ;
    height:auto;
   /* background:#222;*/
   position: absolute;
    overflow:hidden;
}
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
     <li class="last"><a href="company.html"><span>ข้อมูลบริษัท</span></a></li>
        <li><a href="#" class="parent"><span>จัดการเมนู</span></a>
            <div><ul>
                <li><a href="#" class="parent"><span>Sub Item 1</span></a>
                    <div><ul>
                        <li><a href="#" class="parent"><span>Sub Item 1.1</span></a>
                            <div><ul>
                                <li><a href="#"><span>Sub Item 1.1.1</span></a></li>
                                <li><a href="#"><span>Sub Item 1.1.2</span></a></li>
                            </ul></div>
                        </li>
                        <li><a href="#"><span>Sub Item 1.2</span></a></li>
                        <li><a href="#"><span>Sub Item 1.3</span></a></li>
                        <li><a href="#"><span>Sub Item 1.4</span></a></li>
                        <li><a href="#"><span>Sub Item 1.5</span></a></li>
                        <li><a href="#"><span>Sub Item 1.6</span></a></li>
                        <li><a href="#" class="parent"><span>Sub Item 1.7</span></a>
                            <div><ul>
                                <li><a href="#"><span>Sub Item 1.7.1</span></a></li>
                                <li><a href="#"><span>Sub Item 1.7.2</span></a></li>
                            </ul></div>
                        </li>
                    </ul></div>
                </li>
                <li><a href="#"><span>Sub Item 2</span></a></li>
                <li><a href="#"><span>Sub Item 3</span></a></li>
            </ul></div>
        </li>
        <li><a href="#" class="parent"><span>จัดการสินค้า</span></a>
            <div><ul>
                <li><a href="#" class="parent"><span>Sub Item 1</span></a>
                    <div><ul>
                        <li><a href="#"><span>Sub Item 1.1</span></a></li>
                        <li><a href="#"><span>Sub Item 1.2</span></a></li>
                    </ul></div>
                </li>
                <li><a href="#" class="parent"><span>Sub Item 2</span></a>
                    <div><ul>
                        <li><a href="#"><span>Sub Item 2.1</span></a></li>
                        <li><a href="#"><span>Sub Item 2.2</span></a></li>
                    </ul></div>
                </li>
                <li><a href="#"><span>Sub Item 3</span></a></li>
                <li><a href="#"><span>Sub Item 4</span></a></li>
                <li><a href="#"><span>Sub Item 5</span></a></li>
                <li><a href="#"><span>Sub Item 6</span></a></li>
                <li><a href="#"><span>Sub Item 7</span></a></li>
            </ul></div>
        </li>
        <li><a href="#"class="parent"><span>จัดการลูกค้า</span></a>
        <div><ul>
                        <li><a href="#"><span>ข้อมูลลูกค้า</span></a></li>
                        <li><a href="#"><span>รายละเอียดลูกค้า</span></a></li>
                    </ul></div></li>
        <li class="last"><a href="#"><span>จัดการใบสั่งซื้อ</span></a></li>
        
    </ul>
</div>
</body>
</html>

