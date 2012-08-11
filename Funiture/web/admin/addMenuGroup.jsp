<%--
    Document   : jshome_AddMenuGroup
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${param.menuGroupId!=null}">
    <sql:query var="query" dataSource="webdb">
         SELECT *
        FROM menu_group_master mgm
        where mgm.Menu_Group_Id ="${param.menuGroupId}"
                
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
                                            <h1>เมนูหลัก</h1>
                                        </div>


                                        <%--<div class="warning_box">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.
                                        </div>--%>
                                        <c:if test="${param.valid==1}"><div class="success-msg" style="background-color: lightgreen; ">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                        <c:if test="${param.error==1}"><div class="messager-error" style="background-color: #EB340A;">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
                                       <c:if test="${param.menuGroupId==null}" >
                                            <form action="menuGroupMaster.do" method="post" id="form-validate"  >
                                                <input type="hidden" name="action" value="Add" />
                                                <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                <div class="fieldset">
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div   class="field name-firstname">
                                                                    <label for="firstname" >ชื่อเมนู(ไทย): </label>
                                                                    <input type="text" name="menuGNameT" value=""class="input-text  " />
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >ชื่อเมนู(อังกฤษ) :</label>
                                                                    <input type="text" name="menuGNameE" value="" class="input-text" /></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" >สิทธิของผู้ใช้ :</label>
                                                                     <select name="menuPermission" class="select">
                                                                        <option value="N"> Inactive </option>
                                                                        <option value="C"> Active </option>
                                                                    </select></div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname" > แสดงเมนูย่อย :</label>
                                                                     <select name="showListMenu" class="select">
                                                                        <option value="F"> Show List And Relate  </option>
                                                                        <option value="Y"> Show List </option>
                                                                        <option value="N"> Not Show List </option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="fields">
                                                             <div   class="customer-name">
                                                                 <div  class="field name-firstname">
                                                                     <label for="firstname" >ต้อง login ก่อนเข้าใช้:</label>
                                                                       <select name="chkLoginSts" class="select">
                                                                        <option value="Y"> Log in </option>
                                                                        <option value="N"> Unlog in  </option>
                                                                    </select></div>
                                                                     </div>
                                                         </li>
                                                         <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname">หมายเหตุ(ไทย) :</label>
                                                                    <textarea name="menuGRemarkT" rows="2" cols="20"
                                                                              class="input-text" ></textarea></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname"> หมายเหตุ(อังกฤษ) :</label>
                                                                    <textarea name="menuGRemarkE" rows="2" cols="20"
                                                                              class="input-text" ></textarea></div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div   class="customer-name">
                                                                <div  class="field name-firstname">
                                                                    <label for="firstname"> call Program :</label>
                                                                    <input type="text" name="menuGIconLoc" value="" class="input-text" /></div>
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


                                        <c:if test="${param.menuGroupId!=null}" >
                                            <form action="menuGroupMaster.do" method="post" id="form-validate"  >
                                                <c:forEach var="menuGroupMaster" items="${query.rows}" >
                                                    <center></center>
                                                    <input type="hidden" name="action" value="Edit" />
                                                    <input type="hidden" name="menuGroupId" value="${menuGroupMaster.Menu_Group_Id}"/>
                                                    <div class="buttons-set">
                                                        <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                    </div>
                                                    <div class="fieldset">
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" >ชื่อเมนู(ไทย):</label>
                                                                        <input type="text" name="menuGNameT" value="${menuGroupMaster.Menu_G_Name_T}"   class="input-text" /></div>
                                                                    </div>    
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname"> ชื่อเมนู(อังกฤษ):</label>
                                                                        <input type="text" name="menuGNameE" value="${menuGroupMaster.Menu_G_Name_E}" class="input-text" /></div>
                                                                </div>
                                                            </li>

                                                           <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                       <label for="firstname" >สิทธิของผู้ใช้ :</label>
                                                                        <select name="menuPermission" class="select">
                                                                            <option value="N" <c:if test="${menuGroupMaster.Menu_Permission== 'N'}"> Selected</c:if>>Inactive </option>
                                                                            <option value="C" <c:if test="${menuGroupMaster.Menu_Permission== 'C'}"> Selected</c:if>>Active  </option>
                                                                        
                                                                        </select></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                       <label for="firstname" > แสดงเมนูย่อย :</label>
                                                                       <select name="showListMenu" class="select">
                                                                        <option value="F" <c:if test="${menuGroupMaster.Show_List_Menu== 'F'}"> Selected</c:if>>Show List And Relate </option>
                                                                        <option value="Y" <c:if test="${menuGroupMaster.Show_List_Menu== 'Y'}"> Selected</c:if>>Show List  </option>
                                                                       <option value="N" <c:if test="${menuGroupMaster.Show_List_Menu== 'N'}"> Selected</c:if>>Not Show List </option>
                                                                    </select>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                           
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                       <label for="firstname" >ต้อง login ก่อนเข้าใช้:</label>
                                                                       <select name="chkLoginSts" class="select">
                                                                        <option value="Y" <c:if test="${menuGroupMaster.Chk_Login_Sts== 'Y'}"> Selected</c:if>>Log in </option>
                                                                        <option value="N" <c:if test="${menuGroupMaster.Chk_Login_Sts== 'N'}"> Selected</c:if>>Unlog in </option>
                                                                    </select></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname"> หมายเหตุ(ไทย):</label>
                                                                        <textarea name="menuGRemarkT" rows="4" cols="20" >${menuGroupMaster.Menu_G_Remark_T}</textarea></div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname"> หมายเหตุ(อังกฤษ):</label>
                                                                        <textarea name="menuGRemarkE" rows="4" cols="20" >${menuGroupMaster.Menu_G_Remark_E}</textarea></div>
                                                                </div>
                                                            </li>
                                                             <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" > call Program :</label>
                                                                     <input type="text" name="menuGIconLoc" value="${menuGroupMaster.Menu_G_Icon_Loc}"   class="input-text" /></div>
                                                                </div>
                                                            </li>
                                                           <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em>วันที่สร้าง:</label>
                                                                        <input type="text" name="createDate" value="${menuGroupMaster.Create_Date}" class="input-text" readonly/></div>
                                                                </div>
                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >วันที่ปรับปรุง</label>
                                                                        <input name="updateDate" value="${menuGroupMaster.Update_Date}" class="input-text " readonly/>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div   class="field name-firstname">
                                                                        <label for="firstname" class="required" <em>*</em >รหัสผู้ใช้:</label>
                                                                         <input name="userId" value="${menuGroupMaster.User_Id}" class="input-text " readonly/>
                                                                    </div>
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

        <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>
</html>
