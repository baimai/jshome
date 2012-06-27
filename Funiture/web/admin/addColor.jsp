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
<c:if test="${param.colorId!=null}">
    <sql:query var="query" dataSource="webdb">
        SELECT *
        FROM color_Code_Master cm
        where cm.Color_Id ="${param.colorId}"
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
<link rel="stylesheet" type="text/css" href="css/jquery.noty.css"/>
  <link rel="stylesheet" type="text/css" href="css/noty_theme_default.css"/>
<script src="jquery-1.7.2.min.js"></script>
  <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="jquery-1.7.2.min.js"><\/script>')</script>-->
  <script type="text/javascript" src="js/jquery.noty.js"></script>
  <script type="text/javascript" src="stylesViewer.js"></script>
        <title>JSP Page</title>
        <script type="text/javascript">
            $('.ex1.alert').click(function() {
  var noty_id = noty({text: 'noty - a jquery notification library!'});
});
            </script>

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
                                       
                                            <c:if test="${param.valid==1}"><div class="valid_box">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                            <c:if test="${param.error==1}"><div class="error_box">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
                                            <c:if test="${param.colorId==null}" >
                                            <form action="colorMaster.do" method="post" id="form-validate"  >
                                                <input type="hidden" name="action" value="Add" />
                                                <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                <div class="fieldset">
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสสี: </label>
                                                                    <input type="text" name="colorCode" value=""class="input-text "  />
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>คำอธิบาย(ไทย):</label>
                                                                    <input type="text" name="colorNameT" value="" class="input-text" /></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >คำอธิบาย(อังกฤษ):</label>
                                                                    <input type="text" name="colorNameE" value="" class="input-text" /></div>
                                                            </div>
                                                        </li>

                                                      <!---  <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em >วันที่สร้าง :</label>
                                                                    <input type="text" name="createDate" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>วันที่ปรับปรุง:</label>
                                                                    <input name="updateDate" value="" class="input-text " /></div>
                                                            </div>
                                                        </li>-->

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
                                                         </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em >Color Id:</label>
                                                                    <select name="colorId" class="select"> </select>
                                                                </div>
                                                            </div>
                                                        </li>-->


                                                        <!---  <li class="fields">
                                                              <div   class="customer-name">
                                                                  <div  class="field name-firstname">
                                                                      <label for="firstname" class="required"><em>*</em >สถานะ:</label>
                                                                      <select name="userAliveSts" class="select">
                                                                          <option value="A">Active </option>
                                                                          <option value="I">Inactive </option>
                                                                          <option value="N">New </option>
                                                                      </select></div>
                                                              </div>
                                                          </li>-->

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

                                                        <!---  <li class="fields">
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
                                                          </li>-->

                                                        <!---<li class="fields">
                                                             <div   class="customer-name">
                                                                 <div  class="field name-firstname">
                                                                     <label for="firstname" >รหัสผู้ใช้ :</label>
                                                                     <input type="text" name="userId" value="" readonly="readonly" class="input-text"/></div>
                                                             </div>
                                                         </li>-->
                                                    </ul>
                                                </div>
 </form>
                                            </c:if>
                                       

                                        <c:if test="${param.colorId!=null}" >
                                            <form action="colorMaster.do" method="post" id="form-validate"  >
                                                <c:forEach var="colorCodeMaster" items="${query.rows}" >
                                                    <center></center>
                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="colorId" value="${colorCodeMaster.Color_Id}"/>
                                                    <div class="buttons-set">
                                                        <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                    </div>
                                                    <div class="fieldset">
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em>รหัสสี:</label>
                                                                        <input type="text" name="colorCode" value="${colorCodeMaster.Color_Code}"  class="input-text required-entry " readonly/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em>คำอธิบาย(ไทย):</label>
                                                                        <input type="text" name="colorNameT" value="${colorCodeMaster.Color_Name_T}" class="input-text" /></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname">คำอธิบาย(อังกฤษ):</label>
                                                                        <input type="text" name="colorNameE" value="${colorCodeMaster.Color_Name_E}" class="input-text" /></div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em>วันที่สร้าง:</label>
                                                                        <input type="text" name="createDate" value="${colorCodeMaster.Create_Date}" class="input-text" readonly/></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >วันที่ปรับปรุง</label>
                                                                        <input name="updateDate" value="${colorCodeMaster.Update_Date}" class="input-text " readonly/>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >รหัสผู้ใช้:</label>
                                                                         <input name="userId" value="${colorCodeMaster.User_Id}" class="input-text " readonly/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                           <!--- <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >Color Id:</label>
                                                                          <input name="colorId" value="${colorCodeMaster.Color_Id}" class="input-text " />
                                                                    </div>
                                                                </div>
                                                            </li>-->
                                                           <!--- <li class="fields">
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
                                                            </li>-->
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