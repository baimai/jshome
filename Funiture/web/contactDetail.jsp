<%-- 
    Document   : contactDetail
    Created on : Feb 2, 2012, 2:05:38 PM
    Author     : Jik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html">

<html>
    <head>
         <title>jshome</title>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        
        
      
    </head>
    <body>
        <div class="wrapper">
                        <div class="page">
                        </div>
        <div class="main-container col2-right-layout">
            <div class="main">
                <div class="col-main">
                    <div id="messages_product_view"></div>
                    <div class="page-title">
                        <h1>ติดต่อบริษัท</h1>
                    </div>
                    <form action=""  method="post" id="newsletter-validate-detail-footer">
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
                                   </li>
                                   <li>
                                    <div class="field">
                                        <label for="email" class="required"><em>*</em>อีเมลล์</label>
                                        <div class="input-box">
                                            <input name="email" id="email" title="Email" value="" class="input-text validate-email required-entry " type="text" />
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
                                <li class="field">
                                    <%--<label for="pass" class="required">
                                        <input type="checkbox" name="" value="ON" />มีไฟล์แนบ</label>--%>
                                    <div class="customer-name">
                                         <%--<div class="field name-firstname">
                                            <br><br/>--%>
                                            <input type="file" name="upload" class="input-box" />
                                        </div>
                                    <%--</div>--%>
                                </li>
                                <br><br/>
                                <li class="field">
                                <div align="left" class="field">ป้อนข้อมูลเพื่อยืนยัน:<br/>
                                    <img src="captcha.jsp" align="left" alt="Enter the characters appearing in this image" border="1"/></div>
                                </li><li>
                                    <div align="left" class="input-box"><input type="text" name="inCaptchaChars"/></div>
                                </li>
                                <li class="field">
                                   <%-- <div align="left" class="input-box"><input type="text" name="inCaptchaChars"/></div>--%>
                                </li>
                            </ul>
                        </div>
                        <div class="buttons-set">
                            <p class="required">* กรุณาระบุข้อมูล</p>
                            <input type="text" name="hideit" id="hideit" value="" style="display:none !important;" />
                            <button type="submit" title="Submit" class="button"><span><span>ส่งอีเมล์</span></span></button>
                        </div>
                    </form>

                </div>  <jsp:include page="myCart.jsp" /> </div>  </div></div>
    </body>
</html>
