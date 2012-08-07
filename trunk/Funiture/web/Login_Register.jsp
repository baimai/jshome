<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <title>Customer Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <script type="text/javascript" src="jshome/js/varien/form.js"></script>
        <script type="text/javascript" src="jshome/js/varien/js.js"></script>
        <script type="text/javascript" src="jshome/js/prototype/validation.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/controls.js"></script>
        <script type="text/javascript">
            function popupwnd(url, toolbar, menubar, locationbar, resize, scrollbars, statusbar, left, top, width, height)
            {
                //var popupwindow = this.open(url, '', 'toolbar=' + toolbar + ',menubar=' + menubar + ',location=' + locationbar + ',scrollbars=' + scrollbars + ',resizable=' + resize + ',status=' + statusbar + ',left=' + left + ',top=' + top + ',width=' + width + ',height=' + height);
                window.showModalDialog(url,"name","dialogWidth:1200px;dialogHeight:500px");

            }
        </script>
    </head>
    <body class=" customer-account-login">
        <div class="wrapper">
            <div class="page">
            </div>
        </div>        <div class="main-container col1-layout">
            <div class="main">
                <div class="col-main">
                    <div class="account-login">
                        <div class="page-title">
                            <h1>เข้าสู่ระบบ และ การลงทะเบียน</h1>
                        </div>
                        <form action="login.do" method="post" id="login-form">
                            <div class="col2-set">
                                <div class="col-1 new-users">
                                    <div class="content">
                                        <%--<h2>New Customers</h2>
                                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                                        --%>
                                        <h2>ถ้าคุณยังไม่ได้เป็นสมาชิก กรุณาสมัครสมาชิก</h2>
                                        <p>สิทธิ์หลังจากเป็นสมาชิก</p>
                                        <p>เมื่อสมัครเป็นสมาชิกก็สามารถซื้อสินค้าได้</p>
                                        <p>หลังจากลงทะเบียนแล้ว คุณสามารถ</p>
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.บันทึกข้อมูลส่วนตัวของคุณ</p>
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.บันทึกรายการสินค้าที่ชื่นชอบ</p>
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.สมาชิกสามารถใช้รับคะแนน</p>
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.ได้รับสิทธิ์ข้อมูลข่าวสารก่อนใคร</p>

                                        <div class="col-1 new-users">
                                            <div class="">
                                                <%--<button type="button" title="Create an Account" class="button" onclick="javascript:popupwnd('member.jsp','no','no','no','yes','yes','no','300','70','800','440')"> <span><span>Create an Account</span></span></button>--%>
                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="button" title="สมัครสมาชิก" class="button" onclick="javascript:location.href='register.jsp'"> <span><span>สมัครสมาชิก</span></span></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-2 registered-users">
                                    <div class="content">
                                        <h2>ลงทะเบียนลูกค้า</h2>
                                        <%--<p>If you have an account with us, please log in.</p>--%>
                                        <p>ถ้าคุณมีบัญชีที่สมัครไว้กับทางเรา กรุณาเข้าสู่ระบบ</p>
                                        <ul class="form-list">
                                            <li>
                                                <c:if test="${requestScope.invalid !=null}" >
                                                    <div style="color: red">${requestScope.invalid}</div>
                                                </c:if>
                                            </li>
                                            <li>

                                                <label for="email" class="required"> <img src="images/icon/user-red.png" width="24" height="24" alt="user-red"/>สมาชิกเข้าสู่ระบบ</label>

                                            </li>
                                            <li>

                                                <label for="name" class="required" style="text-align: right" >รหัสผู้ใช้ :<em>*</em>&nbsp;<input type="text" name="memberLogin" value="${requestScope.memberLogin}" id="memberLogin" class="input-text required-entry validate-name" title="รหัสผู้ใช้"/>
                                                </label>

                                            </li>

                                            <li>
                                                <label for="pass" style="text-align: right" class="required">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;รหัส :<em>*</em>&nbsp;<input type="password" name="memberPassword" id="memberPassword" class="input-text required-entry validate-password" id="pass" title="รหัสผ่าน" />
                                                </label>

                                            </li>
                                            <li>
                                                <p class="required" style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;
                                                    * ข้อมูลที่จำเป็นต้องกรอก  </p>
                                                <label for="pass" class="required">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="checkbox" name="" value="ON" />&nbsp;จำรหัสผ่านของฉัน</label>

                                            </li>
                                            <li>
                                                <div class="input-box">
                                                    <label for="pass" class="required">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ภาษา :&nbsp;</label> <select name="lang" id="lang" style="width: 80px">
                                                        <option value="Th">ไทย</option>
                                                        <option value="En">อังกฤษ</option>
                                                    </select>
                                                </div>

                                            </li>
                                                <li>
                                                    <div class="col-1 new-users">
                                            <%--<div class="buttons-set">--%>
                                            <div class="">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="button" style="" title="Login" name="send" id="send2"><span><span>เข้าสู่ระบบ</span></span></button>
                                            </div>
                                        </div>

                                                </li>
                                        </ul>

                                            <br></br>
                                    </div>
                                </div>
                            </div>


                        </form>
                        <script type="text/javascript">
                            //<![CDATA[
                            var dataForm = new VarienForm('login-form', true);
                            //]]>
                        </script>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
