<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
                                            <div class="customer-name">
                                                <div class="field name-firstname">
                                                    <label align="right">pic_code</label>
                                                    <div class="select option">
                                                        <select name="picCode">

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                         <li class="fields">
                                            <div class="customer-name">
                                                <div class="field name-firstname">
                                                    <label align="right">Header</label>
                                                    <div class="">
                                                        <select name="languageFlag">

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

                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>

    </body>
</html>
