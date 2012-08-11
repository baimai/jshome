<%--
    Document   : jshome_MenuDetaiMaster
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.menuCodeId!=null}">
    <sql:query var="query" dataSource="webdb">
      Select pgm.Company_Id,
        pgm.Menu_Group_Id,
        pgm.Menu_C_Name_T,
        pgm.Menu_C_Name_E,
        pgm.Pic_Id,
        pgm.Menu_Seq,
        pgm.Show_List_Sts,
        pgm.Menu_Code_Id,
        pgm.Menu_C_Remark_T,
        pgm.Menu_C_Remark_E,
        pgm.Menu_C_Icon_Loc,
        pgm.Create_Date,
        pgm.Update_Date,
        pgm.User_Id,
        pps.Pic_Code
        FROM menu_detail_master pgm
        Left join pic_product_setup pps on pps.Pic_id=pgm.Pic_id
        where pgm.menu_Code_Id =  ${param.menuCodeId}
    </sql:query>

</c:if>
        <sql:query var="query1" dataSource="webdb">
    SELECT m.Menu_Group_Id,m.Menu_G_Name_T FROM menu_Group_Master m
        </sql:query>
          <sql:query var="query2" dataSource="webdb">
    SELECT m.Pic_id,m.Pic_Code FROM pic_product_setup m
        </sql:query>

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
                                            <h1>รายการเมนู</h1>
                                        </div>

                                        <form action="menuDetailMaster.do" method="post" id="form-validate"  enctype="multipart/form-data" >
                                            <%--<div class="warning_box">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.
                                            </div>--%>
                                           <c:if test="${param.valid==1}"><div class="success-msg" style="background-color: lightgreen; ">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                            <c:if test="${param.error==1}"><div class="messager-error" style="background-color: #EB340A;">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
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
                                                                        <select name="picId">
                                                                            <c:forEach  items="${query2.rows}" var="menu">
                                                                                <option value="${menu.Pic_id}">${menu.Pic_Code}</option>
                                                                            </c:forEach>
                                                                        </select></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >ลำดับที่: </label>
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
                                            </form>
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
                                                                    <div class="field name-firstname">
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
                                                                    <div  class="field name-firstname">
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
                                                                          <select name="picid" class="select required-entry">
                                                                           <c:forEach items="${query2.rows}" var="menu">
                                                                            <c:if test="${param.picId == menuDetailMaster.Pic_Id}">
                                                                                <option value="${menu.Pic_id}" >${menu.Pic_Code}</option>
                                                                            </c:if>
                                                                            <c:if test="${param.picId != menuDetailMaster.Pic_Id}">
                                                                                <option value="${menu.Pic_id}" selected>${menu.Pic_Code}</option>
                                                                            </c:if>
                                                                           </c:forEach>
                                                                        </select></div>
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
                                                                         <select name="showListSts">
                                                                                <option value="Y"<c:if test="${menuDetailMaster.Show_List_Sts== 'Y'}"> selected</c:if>> Show</option>
                                                                                <option value="N"<c:if test="${menuDetailMaster.Show_List_Sts== 'N'}"> selected</c:if>> Hidden</option>
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
                                                                        <c:if test="${menuDetailMaster.Menu_C_Icon_Loc!=null&&menuDetailMaster.Menu_C_Icon_Loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${menuDetailMaster.Menu_C_Icon_Loc==null||menuDetailMaster.Menu_C_Icon_Loc==''}" >
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

