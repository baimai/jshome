<%-- 
    Document   : companyMaster
    Created on : Dec 28, 2011, 11:28:40 AM
    Author     : Baimai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        

        <title>JSP Page</title>
    </head>
    <body >

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
                            <form action="companyMasterController.do" >
                                <input type="hidden" value="Add" name="action">
                                <div class="buttons-set">
                                    <p class="required">* ข้อมูลที่จำเปนต้องหรอก</p>
                                    
                                    <button name="action" value="Submit" class="button" onclick="return checkBeforeSubmit()"><span><span>บันทึก</span></span></button>
                                    <button name="action" value="Submit" class="button" onclick="return checkBeforeSubmit()"><span><span>แก้ไข</span></span></button>
                                </div>
                                <div class="fieldset">
                                    <h2 class="legend">รหัสบริษัท</h2>
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

                            </form>


                            <br/><br/><br/><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
