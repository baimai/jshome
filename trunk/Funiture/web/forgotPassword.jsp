
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="jshome/js/prototype/prototype.js"></script>
        <script type="text/javascript" src="jshome/js/lib/ccard.js"></script>
        <script type="text/javascript" src="jshome/js/prototype/validation.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/dragdrop.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/controls.js"></script>
        <script type="text/javascript" src="jshome/js/scriptaculous/slider.js"></script>
        <script type="text/javascript" src="jshome/js/varien/js.js"></script>
        <script type="text/javascript" src="jshome/js/varien/form.js"></script>
        <script type="text/javascript" src="jshome/js/varien/menu.js"></script>
        <script type="text/javascript" src="jshome/js/mage/translate.js"></script>
        <script type="text/javascript" src="jshome/js/mage/cookies.js"></script>

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
                    <br><br><br><br><br><br><br>
                    <jsp:include page="slide.jsp"/><br><br>

                    <div class="wrapper">
                        <div class="page">
                        </div>      <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>ลืมรหัสผ่าน</h1>
                                        </div>
                                        <form action="" id="form-validate">
                                             <div class="fieldset">
                                            <ul class="form-list">
                                                <li><div class="field">
                                                        <label for="login" class="required"><em>*</em>ชื่อที่ใช้เข้าสู่ระบบ &nbsp; </label>
                                                        <div class="input-box">
                                                            <input type="text" value="" name="memberLogin" class="input-text required-entry " />
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="field">
                                                <ul class="form-list">
                                                    <li><div class="field">
                                                            <label for="login" class="required"><em>*</em>อีเมลล์ &nbsp; </label>
                                                            <div class="input-box">
                                                                <input type="text" value="" name="memberEmail1" class="input-text required-entry validate-email"/>

                                                            </div>

                                                        </div>

                                                    </li>
                                                </ul>
                                                <div>
                                                    <button name="action" value="sendEmail" class="button" ><span><span>ส่งไปยัง อีเมลล์</span></span></button>
                                                </div>
                                            </div>
                                                  </div>
                                        </form>
                                         <script type="text/javascript">
                                //<![CDATA[
                                var dataForm = new VarienForm('form-validate', true);
                                //]]>
                            </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>





                    <jsp:include page="footer.jsp" />
                    <br/><br/>
                </div>
            </div>

            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>

    </body>
</html>
