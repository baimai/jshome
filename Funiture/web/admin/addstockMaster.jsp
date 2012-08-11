<%--
    Document   : jshome_AddStockMaster
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
    </head>

    <body>
      <sql:query var="query1" dataSource="webdb">
       SELECT * FROM product_group_master
     </sql:query>

<html>
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
    </head>

    <body>
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
                                            <h1>ข้อมูลบริษัท</h1>
                                        </div>
                                                   <c:if test="${param.valid==1}"><div class="success-msg" style="background-color: lightgreen; ">บันทึกข้อมูลเสร็จสิ้น</div></c:if>
                                        <c:if test="${param.error==1}"><div class="messager-error" style="background-color: #EB340A;">ไม่สามารถบันทึกข้อมูลได้</div></c:if>
                             
                                       <form action="companyMasterController.do" method="post" enctype="multipart/form-data" >
                                            <c:if test="${param.companyId==null}" >
                                                <input type="hidden" value="Add" name="action">

                                                <div class="buttons" align="right">
                                                    <p class="required">* ข้อมูลที่จำเปนต้องหรอก</p>

                                                  <form action="addstockMaster.jsp" >
                                                            <button name="action" value="Add" class="button"><span><span>เพิ่ม</span></span></button>
                                                        </form>

                                            <form action="stockMaster.jsp" >
                                                            <input type="hidden" name="productGroupId" value="${param.productGroupId}" />
                                                             <button name="action" value="Add" class="button"><span><span>ค้นหา</span></span></button>
                                                        </form>
                                            <form action="stockMaster.jsp" >
                                                            <input type="hidden" name="productGroupId" value="${param.productGroupId}" />
                                                             <button name="action" value="edit" class="button"><span><span>แก้ไข</span></span></button>
                                                        </form>
                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">ตั้งค่า</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" >รหัส</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="firstname" name="companyCode" value="" title="First Name"class="input-text"   />
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="lastname" >CompanyCode</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="lastname" name="companyNameAbbr" value="" title="Last Name" class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">Header Website</label>
                                                                    <div class="input-box">
                                                                        <input type="file" name="uploadhead" value=""  class="input-text" />


                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">Cataloge</label>
                                                                    <div class="input-box">
                                                                        <input type="file" name="uploadcataloge" value=""  class="input-text" />


                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">จำนวนสินค้า</label>
                                                                    <div class="select">
                                                                        <select name="showStockBalanceFlag">
                                                                            <option value="N">Not Show</option>
                                                                            <option value="Y">Show    </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">ราคาสินค้า</label>
                                                                    <div class="select">
                                                                        <select name="showPriceListFlag">
                                                                            <option value="N">Not Show</option>
                                                                            <option value="W">ราคาขายส่ง</option>
                                                                            <option value="R">ราคาขายปลีก</option>
                                                                            <option value="A">ราคาขาย</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">ปุ่มการสั่งซื้อ</label>
                                                                    <div class="select">
                                                                        <select name="showOrderFlag">
                                                                            <option value="N">Not Show</option>
                                                                            <option value="Y">Show    </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">รายละเอียดบริษัท</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">ชื่อบริษัท</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyNameT" value="" size="30"  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">CompanyName</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyNameE" value="" size="30"  class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </li>


                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">ที่อยู่</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyAddrT" value="" class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">Address</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyAddrE" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">แขวง/ตำบล</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyDistrictT" value=""  class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">

                                                                    <label align="right">District</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyDistrictE" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">อำเภอ</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyAmphurT" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">Amphur</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyAmphurE" value=""  class="input-text" />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">จังหวัด</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyProvinceT" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">Province</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyProvinceE" value=""  class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">รหัสไปรษณีย์</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyPostCode" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">โทรศัพท์ 1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyTel1" value=""  class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">โทรศัพท์ 2</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyTel2" value=""   class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">โทรศัพท์ 3</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyTel3" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">โทรสาร 1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyFax1" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">โทรสาร 2 </label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyFax2" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">โทรสาร 3</label>

                                                                    <div class="input-box">
                                                                        <input type="text" name="companyFax3" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">มือถือ 1</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyMobile1" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">มือถือ 2</label>
                                                                    <div class="input-box">

                                                                        <input type="text" name="companyMobile2" value=""  class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">มือถือ 3</label>

                                                                    <div class="input-box">
                                                                        <input type="text" name="companyMobile3" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">อีเมลล์ 1</label>

                                                                    <div class="input-box">
                                                                        <input type="text" name="companyEmail1" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">อีเมลล์ 2</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="companyEmail2" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">อีเมลล์ 3</label>

                                                                    <div class="input-box">
                                                                        <input type="text" name="companyEmail3" value=""  class="input-text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>                                                      
                                                    </ul>
                                                </div>
                                            </c:if>                                         
                                        </form>
                                        <br/><br/><br/><br/>
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

