<%--
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${param.UserId!=null}">
    <sql:query var="query" dataSource="webdb">
        SELECT  *
        FROM user_security uss
        where uss.User_Id ="${param.UserId}"
    </sql:query>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <script type="text/javascript" src="../jshome/js/prototype/prototype.js"></script>
        <script type="text/javascript" src="../jshome/js/lib/ccard.js"></script>
        <script type="text/javascript" src="../jshome/js/prototype/validation.js"></script>
        <script type="text/javascript" src="../jshome/js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="../jshome/js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="../jshome/js/scriptaculous/dragdrop.js"></script>
        <script type="text/javascript" src="../jshome/js/scriptaculous/controls.js"></script>
        <script type="text/javascript" src="../jshome/js/scriptaculous/slider.js"></script>
        <script type="text/javascript" src="../jshome/js/varien/js.js"></script>
        <script type="text/javascript" src="../jshome/js/varien/form.js"></script>
        <script type="text/javascript" src="../jshome/js/varien/menu.js"></script>
        <script type="text/javascript" src="../jshome/js/mage/translate.js"></script>
        <script type="text/javascript" src="../jshome/js/mage/cookies.js"></script>
        <script type="text/javascript" src="../ajax/myAjaxFramework.js" ></script>


        <title>JSP Page</title>


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
                    <jsp:include page="header.jsp"/>
                    <br><br>
                    <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <!---<h1>ข้อมูลบริษัท</h1>-->
                                        </div>


                                        <%--<div class="warning_box">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.
                                        </div>--%>
                                        <form action="userSecurity.do" method="post" id="form-validate"  >
                                        <c:if test="${param.valid==1}"><div class="valid_box">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                        <c:if test="${param.error==1}"><div class="error_box">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
                                        <c:if test="${param.UserId==null}" >
                                           
                                                <input type="hidden" name="action" value="Add" />
                                                <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                <div class="fieldset">
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>ชื่อเข้าใช้: </label>
                                                                    <input type="text" name="userId" value=""class="input-text " />
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสผ่าน:</label>
                                                                    <input type="text" name="userPassword" value="" class="input-text" /></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em >ชื่อภาษาไทย  :</label>
                                                                    <input type="text" name="userNameT" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em> ชื่อภาษาอังกฤษ:</label>
                                                                    <input name="userNameE" value="" class="input-text " /></div>
                                                            </div>
                                                        </li>

                                                        <!--- <li class="fields">
                                                             <div   class="customer-name">
                                                                 <div  class="field name-firstname">
                                                                     <label for="firstname" >สถานะกลุ่มสินค้า :</label>
                                                                     <select name="productGDisplayFlag" class="select">
                                                                         <option value="Y"> แสดงกลุ่มสินค้า</option>
                                                                         <option value="N"> ไม่แสดงกลุ่มสินค้า</option>
                                                                         <option value="A">กลุ่มสินค้าโฆษณา </option>
                                                                     </select></div>

                                                             </div>
                                                         </li>-->

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em >ระดับ:</label>
                                                                    <select name="userAuthoritySts" class="select">
                                                                        <option value="A">Admin </option>
                                                                        <option value="U">User </option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>


                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em >สถานะ:</label>
                                                                    <select name="userAliveSts" class="select">
                                                                        <option value="A">Active </option>
                                                                        <option value="I">Inactive </option>
                                                                        <option value="N">New </option>
                                                                    </select></div>
                                                            </div>
                                                        </li>

                                                        <!---    <li class="fields">
                                                                <div   class="customer-name">
                                                                    <div  class="field name-firstname">
                                                                        <label for="firstname" >memberGradeId:</label>
                                                                        <td><input type="text" name="memberGradeId" value="" readonly="readonly" class="input-text"/></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div   class="customer-name">
                                                                    <div  class="field name-firstname">
                                                                        <label for="firstname" >แก้ไข:</label>
                                                                        <input type="text" name="Edit" value="" readonly="readonly" class="input-text"/></div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div   class="customer-name">
                                                                    <div  class="field name-firstname">
                                                                        <label for="firstname" >ลบ :</label>
                                                                        <input type="text" name="Del" value="" readonly="readonly" class="input-text"/></div>
                                                                </div>
                                                            </li>-->

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em >วันที่อนุมัติ:</label>
                                                                    <td><input type="text" name="approvedDate" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>


                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >วันที่หยุดใช้งาน :</label>
                                                                    <input type="text" name="holdDate" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <!---<li class="fields">
                                                             <div   class="customer-name">
                                                                 <div  class="field name-firstname">
                                                                     <label for="firstname" >รหัสผู้ใช้ :</label>
                                                                     <input type="text" name="userId" value="" readonly="readonly" class="input-text"/></div>
                                                             </div>
                                                         </li>-->
                                                    </ul>
                                                </div>
                                           
                                        </c:if>
 </form>

                                        <c:if test="${param.UserId!=null}" >
                                            <form action="userSecurity.do" method="post" id="form-validate"  >
                                                <c:forEach var="userSecurity" items="${query.rows}" >
                                                    <center></center>
                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="UserId" value="${userSecurity.User_Id}"/>
                                                    <div class="buttons-set">
                                                        <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                    </div>
                                                    <div class="fieldset">
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em>ชื่อเข้าใช้ :</label>
                                                                        <input type="text" name="userId" value="${userSecurity.User_Id}"  class="input-text required-entry " readonly/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em>รหัสผ่าน:</label>
                                                                        <input type="text" name="userPassword" value="${userSecurity.User_Password}" class="input-text" /></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ชื่อภาษาไทย:</label>
                                                                        <input type="text" name="userNameT" value="${userSecurity.User_Name_T}" class="input-text"/></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >ชื่อภาษาอังกฤษ</label>
                                                                        <input name="userNameE" value="${userSecurity.User_Name_E}" class="input-text required-entry validate-number" />
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >ระดับ :</label>
                                                                        
                                                                        <select name="userAuthoritySts" class="select">
                                                                            <option value="A">Admin </option>
                                                                            <option value="U">User </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >สถานะ:</label>
                                                                        <select name="userAliveSts" class="select">
                                                                        <option value="A">Active </option>
                                                                        <option value="I">Inactive </option>
                                                                        <option value="N">New </option>
                                                                    </select>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em >วันที่อนุมัติ:</label>
                                                                    <td><input type="text" name="approvedDate" value="${userSecurity.Approved_Date}" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>


                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >วันที่หยุดใช้งาน :</label>
                                                                    <input type="text" name="holdDate" value="${userSecurity.Hold_Date}" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </form>
                                        </c:if>



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
                </div>

            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>

    </body>
</html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <!---<body>
        <h1>Hello World!</h1>
    </body>-->
</html>
