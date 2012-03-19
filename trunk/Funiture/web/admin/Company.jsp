<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@ include file="checkRole.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${applicationScope.Company_Id!=null}">
    <sql:query var="company1" dataSource="webdb">
        SELECT * from company_master cpm
        where cpm.Company_Id =  ${applicationScope.Company_Id}
    </sql:query>
</c:if>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <title>JSP Page</title>
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
                                        <form action="companyMasterController.do" method="post" enctype="multipart/form-data" >
                                            <c:if test="${applicationScope.Company_Id==null}" >

                                                <div class="buttons-set">
                                                    <p class="required">* ข้อมูลที่จำเปนต้องหรอก</p>

                                                    <button name="action" value="Add" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                                    <button name="action" value="Edit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">ตั้งค่า</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" >รหัสบริษัท</label>
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
                                                        <li class="fields">
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label align="right">Language</label>
                                                                    <div class="select option">
                                                                        <select name="languageFlag">
                                                                            <option value="T">Thai</option>
                                                                            <option value="E">English</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </li>

                                                    </ul>


                                                </div>
                                            </c:if>
                                            <c:if test="${applicationScope.Company_Id!=null}" >
                                                <div class="buttons-set">
                                                    <p class="required">* ข้อมูลที่จำเปนต้องหรอก</p>


                                                    <button name="action" value="Edit" class="button" ><span><span>แก้ไข</span></span></button>
                                                </div>
                                                <c:forEach var="company" items="${company1.rows}" >
                                                    <input type="hidden" name="companyId" value="${company.company_id}"/>
                                                    <div class="fieldset">
                                                        <h2 class="legend">ตั้งค่า</h2>
                                                        <ul class="form-list">
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label for="firstname" >รหัสบริษัท</label>
                                                                        <div class="input-box">
                                                                            <input type="text" id="firstname" name="companyCode" value="${company.Company_Code}" title="First Name"class="input-text"   />
                                                                        </div>
                                                                    </div>
                                                                    <div class="field name-lastname">
                                                                        <label for="lastname" >ชื่อย่อบริษัท</label>
                                                                        <div class="input-box">
                                                                            <input type="text" id="lastname" name="companyNameAbbr" value="${company.Company_Name_Abbr}" title="Last Name" class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label >Header Website</label>
                                                                        <div class="input-box">                                                                            
                                                                            <input type="text" name="uploadheadtmp" value="${company.Company_Header_Loc}"  class="input-text" readonly/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Header Website</label>
                                                                        <c:if test="${company.Company_Header_Loc!=null&&company.Company_Header_Loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${company.Company_Header_Loc==null||company.Company_Header_Loc==''}" >
                                                                            <label for="firstname" >Header Website</label>
                                                                        </c:if>
                                                                        <input type="file" name="uploadhead" class="input-text"/>

                                                                    </div>
                                                                </div>
                                                            </li>
                                                             <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Company Logo</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="uploadlogoLogtmp" value="${company.Company_Logo_Loc}"  class="input-text" readonly/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Company Logo</label>
                                                                        <c:if test="${company.Company_Logo_Loc!=null&&company.Company_Logo_Loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${company.Company_Logo_Loc==null||company.Company_Logo_Loc==''}" >
                                                                            <label for="firstname" >Company Logo</label>
                                                                        </c:if>
                                                                        <input type="file" name="uploadlogoLog" class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Cataloge</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="uploadcatalogetmp" value="${company.Company_Catalog_Loc}"  class="input-text" readonly/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Cataloge</label>
                                                                        <c:if test="${company.Company_Catalog_Loc!=null&&company.Company_Catalog_Loc!=''}" >
                                                                        </c:if>
                                                                        <c:if test="${company.Company_Catalog_Loc==null||company.Company_Catalog_Loc==''}" >
                                                                            <label for="firstname" >Cataloge</label>
                                                                        </c:if>
                                                                        <input type="file" name="uploadcataloge" class="input-text"/>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">จำนวนสินค้า</label>
                                                                        <div class="select">
                                                                            <select name="showStockBalanceFlag">
                                                                                <option value="N" <c:if test="${company.Show_Stock_Balance_Flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                                <option value="Y" <c:if test="${company.Show_Stock_Balance_Flag == 'Y'}"> selected</c:if>>Show    </option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">ราคาสินค้า</label>
                                                                        <div class="select">
                                                                            <select name="showPriceListFlag">
                                                                                <option value="N" <c:if test="${company.Show_Price_List_Flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                                <option value="W" <c:if test="${company.Show_Price_List_Flag == 'W'}"> selected</c:if>>ราคาขายส่ง</option>
                                                                                <option value="R" <c:if test="${company.Show_Price_List_Flag == 'R'}"> selected</c:if>>ราคาขายปลีก</option>
                                                                                <option value="A" <c:if test="${company.Show_Price_List_Flag == 'A'}"> selected</c:if>>ราคาขาย</option>
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
                                                                                <option value="N" <c:if test="${company.Show_Order_Flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                                <option value="Y" <c:if test="${company.Show_Order_Flag == 'Y'}"> selected</c:if>>Show    </option>
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
                                                                            <input type="text" name="companyNameT" value="${company.Company_Name_T}" size="30"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">CompanyName</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyNameE" value="${company.Company_Name_E}" size="30"  class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </li>


                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">ที่อยู่</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyAddrT" value="${company.Company_Addr_T}" class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Address</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyAddrE" value="${company.Company_Addr_E}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">แขวง/ตำบล</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyDistrictT" value="${company.Company_District_T}"  class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">

                                                                        <label align="right">District</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyDistrictE" value="${company.Company_District_E}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">อำเภอ</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyAmphurT" value="${company.Company_Amphur_T}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Amphur</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyAmphurE" value="${company.Company_Amphur_E}"  class="input-text" />
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">จังหวัด</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyProvinceT" value="${company.Company_Province_T}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Province</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyProvinceE" value="${company.Company_Province_E}"  class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">รหัสไปรษณีย์</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyPostCode" value="${company.Company_PostCode}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">โทรศัพท์ 1</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyTel1" value="${company.Company_Tel1}"  class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">โทรศัพท์ 2</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyTel2" value="${company.Company_Tel2}"   class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">โทรศัพท์ 3</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyTel3" value="${company.Company_Tel3}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">โทรสาร 1</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyFax1" value="${company.Company_Fax1}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">โทรสาร 2 </label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyFax2" value="${company.Company_Fax2}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">โทรสาร 3</label>

                                                                        <div class="input-box">
                                                                            <input type="text" name="companyFax3" value="${company.Company_Fax3}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">มือถือ 1</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyMobile1" value="${company.Company_Mobile_1}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">มือถือ 2</label>
                                                                        <div class="input-box">

                                                                            <input type="text" name="companyMobile2" value="${company.Company_Mobile_2}"  class="input-text"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">มือถือ 3</label>

                                                                        <div class="input-box">
                                                                            <input type="text" name="companyMobile3" value="${company.Company_Mobile_3}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">อีเมลล์ 1</label>

                                                                        <div class="input-box">
                                                                            <input type="text" name="companyEmail1" value="${company.Company_Email_1}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">อีเมลล์ 2</label>
                                                                        <div class="input-box">
                                                                            <input type="text" name="companyEmail2" value="${company.Company_Email_2}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">อีเมลล์ 3</label>

                                                                        <div class="input-box">
                                                                            <input type="text" name="companyEmail3" value="${company.Company_Email_3}"  class="input-text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label align="right">Language</label>
                                                                        <div class="select option">
                                                                            <select name="languageFlag">
                                                                                <option <c:if test="${company.Language_Flag == 'T'}"> selected</c:if> value="T" >Thai</option>
                                                                                <option <c:if test="${company.Language_Flag == 'E'}"> selected</c:if> value="E">English</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </li>

                                                        </ul>


                                                    </div>
                                                </c:forEach>
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

    </body>
</html>
