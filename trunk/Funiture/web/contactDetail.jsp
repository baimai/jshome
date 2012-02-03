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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <title>JSP Page</title>

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
