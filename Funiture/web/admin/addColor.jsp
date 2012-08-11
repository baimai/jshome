<%--
    Document   : jshome_AddColor
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
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
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <script type="text/javascript" src="js/prototype/prototype.js"></script>
        <script type="text/javascript" src="js/lib/ccard.js"></script>
        <script type="text/javascript" src="js/prototype/validation.js"></script>
        <script type="text/javascript" src="js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="js/scriptaculous/dragdrop.js"></script>
        <script type="text/javascript" src="js/scriptaculous/controls.js"></script>
        <script type="text/javascript" src="js/scriptaculous/slider.js"></script>
        <script type="text/javascript" src="js/varien/js.js"></script>
        <script type="text/javascript" src="js/varien/form.js"></script>
        <script type="text/javascript" src="js/varien/menu.js"></script>
        <script type="text/javascript" src="js/mage/translate.js"></script>
        <script type="text/javascript" src="js/mage/cookies.js"></script>
        <script type="text/javascript" src="ajax/myAjaxFramework.js" ></script>
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
                                        <c:if test="${param.valid==1}"><div class="success-msg" style="background-color: lightgreen; ">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                        <c:if test="${param.error==1}"><div class="messager-error" style="background-color: #EB340A;">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
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
<jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>
</html>


