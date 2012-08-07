
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script type="text/javascript" src="jshome/js/prototype/prototype.js"></script>
        <script type="text/javascript" src="jshome/js/prototype/validation.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/dragdrop.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/controls.js"></script>
        <script type="text/javascript" src="jshome/js/varien/form.js"></script>

    </head>
    <body >
        <div id="art-main">
            <div class="art-sheet">
                <div class="art-sheet-bl"></div>
                <div class="art-sheet-br"></div>
                <div class="art-sheet-bc"></div>
                <div class="art-sheet-cl"></div>
                <div class="art-sheet-cr"></div>
                <div class="art-sheet-cc"></div>
                <div class="art-sheet-body">
                    <jsp:include page="head.jsp"/>

                    <jsp:include page="slide.jsp"/><br><br>

                    <div class="wrapper">
                        <div class="page"></div>
                    </div>
                    <div class="main-container col1-layout">
                        <div class="main">
                            <div class="col-main">
                                <div class="account-login">
                                    <div class="page-title">
                                        <h1>ลืมรหัสผ่าน</h1>
                                    </div>
                                    <form action="" method="" id="">
                                        <div class="col2-set">
                                            <div class="col-1 new-users">
                                                <div class="content">

                                                    <h2>ขอรหัสผ่านใหม่</h2>

                                                    <br>
                                                    <ul class="form-list">
                                                        <li>
                                                            <label for="login" class="required" style="text-align: right" >ชื่อเข้าสู่ระบบ : &nbsp;<input type="text" name="memberLogin" value="" id="memberLogin" class="input-text required-entry" title="ชื่อที่ใช้เข้าสู่ระบบ "/>
                                                            </label><p class="required" style="text-align: left">&nbsp;*</p>
                                                        </li>
                                                    </ul>


                                                    <div class="field">
                                                        <ul class="form-list">
                                                            <li>
                                                                <label for="login" class="required" style="text-align: right" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อีเมลล์ : &nbsp;<input type="text" name="memberEmail1" value="" id="memberLogin" class="input-text required-entry validate-email" title=">อีเมลล์ "/>
                                                                </label><p class="required" style="text-align: left">&nbsp;*</p>

                                                            </li>
                                                            <li>
                                                                <p class="required" style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;
                                                                    * ข้อมูลที่จำเป็นต้องกรอก  </p>

                                                            </li>

                                                            <div>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <button name="action" value="sendEmail" class="button" ><span><span>ส่งไปยัง อีเมลล์</span></span></button>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br><br><br><br><br>

                                    </form>

                                </div>

                            </div>

                        </div>

                    </div>
                    <jsp:include page="footer.jsp" />
                    <br>
                    <br>
                </div>

            </div>
        </div>
    </body>
</html>
