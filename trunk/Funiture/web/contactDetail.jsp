<%-- 
    Document   : contactDetail
    Created on : Feb 2, 2012, 2:05:38 PM
    Author     : Jik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
       
        <script type="text/javascript">
            //<![CDATA[
            var contactForm = new VarienForm('contactForm', true);
            //]]>
        </script>
    </head>
    <body>
        <div class="main-container col2-right-layout">
            <div class="main">
                <div class="col-main">
                    <div id="messages_product_view"></div>
                    <div class="page-title">
                        <h1>ติดต่อบริษัท</h1>
                    </div>
                    <form action="http://freedemo.templates-master.com/f002/contacts/index/post/" id="contactForm" method="post">
                        <div class="fieldset">
                            <h2 class="legend">รายละเอียดการติดต่อ</h2>
                            <ul class="form-list">
                                <li class="fields">
                                    <div class="field">
                                        <label for="name" class="required"><em>*</em>ชื่อ</label>
                                        <div class="input-box">
                                            <input name="name" id="name" title="Name" value="" class="input-text required-entry" type="text" />
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label for="email" class="required"><em>*</em>อีเมลล์</label>
                                        <div class="input-box">
                                            <input name="email" id="email" title="Email" value="" class="input-text required-entry validate-email" type="text" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <label for="telephone">โทรศัพท์</label>
                                    <div class="input-box">
                                        <input name="telephone" id="telephone" title="Telephone" value="" class="input-text" type="text" />
                                    </div>
                                </li>
                                <li class="wide">
                                    <label for="comment" class="required"><em>*</em>รายละเอียด</label>
                                    <div class="input-box">
                                        <textarea name="comment" id="comment" title="Comment" class="required-entry input-text" cols="5" rows="3"></textarea>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="buttons-set">
                            <p class="required">* กรุณาระบุข้อมูล</p>
                            <input type="text" name="hideit" id="hideit" value="" style="display:none !important;" />
                            <button type="submit" title="Submit" class="button"><span><span>Submit</span></span></button>
                        </div>
                    </form>

                </div>  <jsp:include page="myCart.jsp" /> </div>  </div>
    </body>
</html>
