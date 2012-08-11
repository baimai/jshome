<%--
    Document   : jshome_Login_Register
    Created on : 7 ส.ค. 2555, 12:36
    Author     : Sarawut
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <script type="text/javascript" src="js/varien/form.js"></script>
        <script type="text/javascript" src="js/varien/js.js"></script>
        <script type="text/javascript" src="js/prototype/validation.js"></script>
        <script type="text/javascript" src="js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="js/scriptaculous/controls.js"></script>


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
        </div>
        <div class="main-container col1-layout">
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
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="button" title="สมัครสมาชิก" class="button" onclick="javascript:location.href='register.jsp'"> <span><span>สมัครสมาชิก</span></span></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-2 registered-users">
                                    <div class="content">
                                        <h2>ลงทะเบียนลูกค้า</h2>
                                        <p>ถ้าคุณมีบัญชีที่สมัครไว้กับทางเรา กรุณาเข้าสู่ระบบ</p>
                                        <ul class="form-list">
                                            <li>
                                                <c:if test="${requestScope.invalid !=null}" >
                                                    <div style="color: red">${requestScope.invalid}</div>
                                                </c:if>
                                            </li>

                                            <label for="email" class="required"> <img src="images/icon/user-red.png" width="24" height="24" alt="user-red"/>สมาชิกเข้าสู่ระบบ</label>

                                            <table class="tableContent1" border="0" cellspacing="2"
                                                   cellpadding="0" align="" width="100%">
                                                <br>
                                                <tr>
                                                    <td width="auto" style="float: right">
                                                        <label for="name" class="required" ><em>*</em>รหัสผู้ใช้ :</label>&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td >
                                                        <input type="text" name="memberLogin" value="${requestScope.memberLogin}" id="memberLogin" class="input-text required-entry validate-name" title="รหัสผู้ใช้"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="float: right">
                                                        <label for="pass" class="required" ><em>*</em>รหัส :</label>&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td >
                                                        <input width="" type="password" name="memberPassword" id="memberPassword" class="input-text required-entry validate-password" id="pass" title="รหัสผ่าน" />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="float: right">

                                                    </td>
                                                    <td >
                                                        <label for="pass" class="required">
                                                            <input type="checkbox" name="" value="ON" />&nbsp;จำรหัสผ่านของฉัน
                                                        </label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="float: right">
                                                        <label for="pass" class="required">ภาษา :</label>&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td >
                                                        <div class="field">
                                                            <select name="lang" id="lang" style="width: 135px">
                                                                <option value="Th">ไทย</option>
                                                                <option value="En">อังกฤษ</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="float: right">

                                                    </td>
                                                    <td >
                                                        <p class="required" style="text-align: left">* ข้อมูลที่จำเป็นต้องกรอก</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="float: right">

                                                    </td>
                                                    <td >
                                                        <div class="col-1 new-users">
                                                            <div class="">
                                                                <button type="submit" class="button" style="" title="Login" name="send" id="send2"><span><span>เข้าสู่ระบบ</span></span></button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>

                                            </table>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                                                    <br><br><br>
                        </form>

                        <script type="text/javascript">
                            var dataForm = new VarienForm('login-form', true);
                        </script>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
