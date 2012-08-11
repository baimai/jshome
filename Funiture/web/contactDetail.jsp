<%--
    Document   : jshome_ContactDetail
    Created on : 8 ส.ค. 2555, 10:36
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
    </head>

    <div class="wrapper">
        <div class="page"></div>
    </div>
    <div class="main-container col2-right-layout">
        <div class="main">
            <div class="col-main">
                <div class="account-login">
                    <div class="page-title">
                        <h1>ติดต่อบริษัท</h1>
                    </div>
                    <form action="" method="" id="">
                        <div class="col2-set">
                            <div class="col-1 new-users">
                                <div class="content">
                                    <h2>รายละเอียดการติดต่อ</h2>
                                    <ul class="form-list">
                                        <li class="fields">
                                            <div class="field">
                                                <label for="name"class="required"><em>*</em>ชื่อ : </label>
                                                <div class="input-box">
                                                    <input name="name" id="name" title="Name" value="" class="input-text required-entry" type="text" />
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="field">
                                                <label for="email" class="required"><em>*</em>อีเมลล์ : </label>
                                                <div class="input-box">
                                                    <input name="email" id="email" title="Email" value="" class="input-text validate-email required-entry " type="text" />
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <label for="telephone">โทรศัพท์ : </label>
                                            <div class="input-box">
                                                <input name="telephone" id="telephone" title="Telephone" value="" class="input-text" type="text" />
                                            </div>
                                        </li>
                                        <li class="wide">
                                            <label for="comment" class="required"><em>*</em>รายละเอียด : </label>
                                            <div class="input-box">
                                                <textarea name="comment" id="comment" title="Comment" class="required-entry input-text" cols="5" rows="3"></textarea>
                                            </div>
                                        </li>
                                        <li class="field">
                                            <div class="input-box">
                                                <input type="file" name="upload" class="input-text" />
                                            </div><br>
                                            <label for="comment" class="required"><em>*</em>ป้อนข้อมูลเพื่อยืนยัน : </label><br>
                                        </li>
                                        <br><br/>
                                        <li class="field">
                                            <img src="captcha.jsp" align="left" alt="Enter the characters appearing in this image" border="1"/>
                                        </li>
                                        <li>
                                            <div align="left" class="input-box"><input type="text" class="input-text" name="inCaptchaChars"/></div>
                                        </li>
                                    </ul>
                                    <p class="required" style="text-align: left">* ข้อมูลที่จำเป็นต้องกรอก</p>
                                    <button type="submit" title="Submit" class="button"><span><span>ส่งอีเมล์</span></span></button>
                                </div>
                                <br><br>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <jsp:include page="myCart.jsp" />
        </div>
    </div>
    <jsp:include page="footer.jsp" />
    <br>
    <br>
</body>

</html>

