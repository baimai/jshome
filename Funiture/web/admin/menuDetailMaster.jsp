
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
<c:if test="${param.menuCodeId!=null}">
    <sql:query var="query" dataSource="webdb">
        Select pgm.Company_Id,
        pgm.Menu_Group_Id,
        pgm.Menu_C_Name_T,
        pgm.Menu_C_Name_E,
        pgm.Pic_Code,
        pgm.Menu_Seq,
        pgm.Show_List_Sts,
        pgm.Menu_Code_Id,
        pgm.Menu_C_Remark_T,
        pgm.Menu_C_Remark_E,
        pgm.Menu_C_Icon_Loc,
        pgm.Create_Date,
        pgm.Update_Date,
        pgm.User_Id
        FROM menu_detail_master pgm
        where pgm.menu_Code_Id =  ${param.menuCodeId}
    </sql:query>
</c:if>
        <sql:query var="query1" dataSource="webdb">
    SELECT m.Menu_Group_Id,m.Menu_G_Name_T FROM menu_Group_Master m
        </sql:query>
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
                                            <h1>รายการเมนู</h1>
                                        </div>

                                        <form action="menuDetailMaster.do" method="post" id="form-validate"  enctype="multipart/form-data" >
                                            <%--<div class="warning_box">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.
                                            </div>--%>
                                            <c:if test="${param.valid==1}"><div class="valid_box">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                            <c:if test="${param.error==1}"><div class="error_box">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
                                            <c:if test="${param.menuCodeId==null}" >
                                                <input type="hidden" name="action" value="Add" />
                                                <button name="action" value="Add" class="button" ><span><span>บันทึก</span></span></button>
                                                <div class="fieldset">
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" class="required"><em>*</em>รหัสเมนูหลัก: </label>
                                                                    <select name="menuGroupId">
                                                                            <c:forEach  items="${query1.rows}" var="menu">
                                                                                <option value="${menu.Menu_Group_Id}">${menu.Menu_G_Name_T}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                      
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >ชื่อเมนูย่อย(ไทย) :</label>
                                                                    <input type="text" name="menuCNameT" value="" class="input-text" /></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >ชื่อเมนูย่อย(อังกฤษ) :</label>
                                                                    <input type="text" name="menuCNameE" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >รหัสชุดการแสดงสินค้า :</label>
                                                                    <input type="text" name="picCode" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>
                                                         <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >ลำดับที่:</label>
                                                                     <input type="text" name="menuSeq" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >แสดงเมนูย่อย :</label>
                                                                    <select name="showListSts" class="select">
                                                                        <option value="Y"> Show </option>
                                                                        <option value="N"> Hidden</option>
                                                                    </select></div>

                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >หมายเหตุ(ไทย) :</label>
                                                                    <textarea name="menuCRemarkT" rows="2" cols="20"
                                                                              class="input-text"></textarea></div>
                                                            </div>
                                                        </li>


                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >หมายเหตุ(อังกฤษ) :</label>
                                                                    <textarea name="menuCRemarkE" rows="2" cols="20"
                                                                              class="input-text"></textarea></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >Path เก็บรูป Icon :</label>
                                                                    <input type="file" name="upload" value="" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >วันที่สร้าง :</label>
                                                                    <td><input type="text" name="createDate" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>


                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >วันที่ปรับปรุง :</label>
                                                                    <input type="text" name="updateDate" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >รหัสผู้ใช้ :</label>
                                                                    <input type="text" name="userId" value="" readonly="readonly" class="input-text"/></div>
                                                            </div>
                                                        </li>

                                                        </ul>
                                                </div>


                                            </c:if>
                                            <c:if test="${param.menuCodeId!=null}" >
                                                <c:forEach var="menuDetailMaster" items="${query.rows}" >
                                                    <center></center>
                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="menuCodeId" value="${menuDetailMaster.Menu_Code_Id}"/>
                                                    <input type="hidden" name="menuGroupId" value="${menuDetailMaster.Menu_Group_Id}"/>
                                                    <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                    <div class="fieldset">
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required"> รหัสเมนูหลัก:<em>*</em></label>
                                                                       <select name="menuGroupId" class="select required-entry">
                                                                           <c:forEach items="${query1.rows}" var="menu">
                                                                            <c:if test="${param.menuGroupId == menuDetailMaster.Menu_Group_Id}">
                                                                                <option value="${menu.Menu_Group_Id}" >${menu.Menu_G_Name_T}</option>
                                                                            </c:if>
                                                                            <c:if test="${param.menuGroupId != menuDetailMaster.Menu_Group_Id}">
                                                                                <option value="${menu.Menu_Group_Id}" selected>${menu.Menu_G_Name_T}</option>
                                                                            </c:if>
                                                                           </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ชื่อเมนูย่อย(ไทย) :</label>
                                                                        <input type="text" name="menuCNameT" value="${menuDetailMaster.Menu_C_Name_T}" class="input-text" /></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ชื่อเมนูย่อย(อังกฤษ) :</label>
                                                                        <input type="text" name="menuCNameE" value="${menuDetailMaster.Menu_C_Name_E}" class="input-text"/></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >รหัสชุดการแสดงสินค้า :</label>
                                                                        <input type="text" name="picCode" value="${menuDetailMaster.Pic_Code}" class="input-text"/></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ลำดับที่ :</label>
                                                                        <input type="text" name="menuSeq" value="${menuDetailMaster.Menu_Seq}" class="input-text"/></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >แสดงเมนูย่อย:</label>
                                                                         <select name="showListStr">
                                                                                <option value="Y"<c:if test="${menuDetailMaster.Show_List_Str== 'Y'}"> selected</c:if>> Show</option>
                                                                                <option value="N"<c:if test="${menuDetailMaster.Show_List_Str== 'N'}"> selected</c:if>> Hidden</option>
                                                                            </select></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >หมายเหตุ(ไทย) :</label>
                                                                        <textarea name="menuCRemarkT" rows="4" cols="20">${menuDetailMaster.Menu_C_Remark_T}
                                                                        </textarea></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >หมายเหตุ(อังกฤษ) :</label>
                                                                        <textarea name="menuCRemarkE" rows="4" cols="20">${menuDetailMaster.Menu_C_Remark_E}
                                                                        </textarea></div>
                                                                </div>
                                                            </li>
                                                             <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" > Icon :</label>
                                                                        <img src="../${menuDetailMaster.Menu_C_Icon_Loc}" class="input-text" /></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >Path เก็บรูป Icon</label>
                                                                        <c:if test="${menuDetailMaster.menu_C_Icon_Loc!=null&&menuDetailMaster.Menu_C_Icon_Loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${menuDetailMaster.menu_C_Icon_Loc==null||menuDetailMaster.Menu_C_Icon_Loc==''}" >
                                                                            <label for="firstname" >Product Image</label>
                                                                        </c:if>
                                                                        <input type="file" name="upload" class="input-text"/></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >วันที่สร้าง :</label>
                                                                        <input type="text" name="createDate" value="${menuDetailMaster.Create_Date}" class="input-text" readonly="readonly" />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >วันที่ปรับปรุง :</label>
                                                                        <input type="text" name="updateDate" value="${menuDetailMaster.Update_Date}" class="input-text" readonly="readonly" />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >รหัสผู้ใช้ :</label>
                                                                        <input type="text" name="userId" value="${menuDetailMaster.User_Id}" class="input-text" readonly="readonly" /></div>
                                                                </div>
                                                            </li>
                                                        </ul>

                                                    </c:forEach>
                                                </c:if>
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
                </div>

            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>

    </body>
</html>

