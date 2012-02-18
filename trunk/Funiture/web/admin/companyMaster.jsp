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
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />

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
                                <div class="main-container col2-right-layout">
                                    <div class="fieldset">
                                        <ul class="form-list">
                                            <li class="fields">
                                                <div class="field name-firstname">
                                                    <label for="login">CompanyCode</label>
                                                    <div class="input-box">
                                                        <input type="text" name="companyCode" value="" size="10" class="input-text" />
                                                    </div>
                                                </div>

                                                <label align="right">ชื่อย่อ</label>
                                                <div class="input-box">
                                                    <input type="text" name="companyNameAbbr" value="" size="10"  class="input-text"/>
                                                </div>
                                            </li>
                                            <li class="fields">
                                                <label align="right">ชื่อบริษัท</label>
                                                <div class="input-box">
                                                    <input type="text" name="companyNameT" value="" size="30"  class="input-text" />
                                                </div>

                                                <label align="right">CompanyName</label>
                                                <div class="input-box">
                                                    <input type="text" name="companyNameE" value="" size="30"  class="input-text"/>
                                                </div>

                                            </li>
                                        </ul>
                                         <ul class="form-list">
                                        <label align="right">ที่อยู่</label>
                                        <div class="input-box">
                                            <input type="text" name="companyAddrT" value="" class="input-text"/>
                                        </div>

                                        <label align="right">Address</label>
                                        <div class="input-box">
                                            <input type="text" name="companyAddrE" value=""  class="input-text" />
                                        </div>

                                        <label align="right">แขวง/ตำบล</label>
                                        <div class="input-box">
                                            <input type="text" name="companyDistrictT" value=""  class="input-text"/>
                                        </div>

                                        <label align="right">District</label>
                                        <div class="input-box">
                                            <input type="text" name="companyDistrictE" value=""  class="input-text" />
                                        </div>

                                        <label align="right">อำเภอ</label>
                                        <div class="input-box">
                                            <input type="text" name="companyAmphurT" value=""  class="input-text" />
                                        </div>

                                        <label align="right">Amphur</label>
                                        <div class="input-box">
                                            <input type="text" name="companyAmphurE" value=""  class="input-text" />
                                        </div>

                                        <label align="right">จังหวัด</label>
                                        <div class="input-box">
                                            <input type="text" name="companyProvinceT" value=""  class="input-text" />
                                        </div>

                                        <label align="right">Province</label>
                                        <div class="input-box">
                                            <input type="text" name="companyProvinceE" value=""  class="input-text"/>
                                        </div>

                                        <label align="right">รหัสไปรษณีย์</label>
                                        <div class="input-box">
                                            <input type="text" name="companyPostCode" value=""  class="input-text" />
                                        </div>
                                        </ul>
                                        <label align="right">โทรศัพท์ 1</label>
                                        <div class="input-box">
                                            <input type="text" name="companyTel1" value=""  class="input-text"/>
                                        </div>

                                        <label align="right">โทรศัพท์ 2</label>                                                   <td><input type="text" name="companyTel2" value="" /></div>
                                    <div class="input-box">
                                        <input type="text" name="companyTel2" value=""   class="input-text"/>
                                    </div>
                                    <label align="right">โทรศัพท์ 3</label>
                                    <div class="input-box">
                                        <td><input type="text" name="companyTel3" value=""  class="input-text" />
                                    </div>

                                    <label align="right">โทรสาร 1</label>
                                    <div class="input-box">
                                        <td><input type="text" name="companyFax1" value=""  class="input-text" />
                                    </div>

                                    <label align="right">โทรสาร 2 </label>
                                    <div class="input-box">
                                        <td><input type="text" name="companyFax2" value=""  class="input-text" />
                                    </div>

                                    <label align="right">โทรสาร 3</label>
                                    <div class="input-box">
                                        <div class="input-box">
                                            <td><input type="text" name="companyFax3" value=""  class="input-text" />
                                        </div>

                                        <label align="right">มือถือ 1</label>
                                        <div class="input-box">
                                            <input type="text" name="companyMobile1" value=""  class="input-text" />
                                        </div>

                                        <label align="right">มือถือ 2</label>
                                        <div class="input-box">

                                            <input type="text" name="companyMobile2" value=""  class="input-text"/>
                                        </div>

                                        <label align="right">มือถือ 3</label>

                                        <div class="input-box">
                                            <input type="text" name="companyMobile3" value=""  class="input-text" />
                                        </div>

                                        <label align="right">อีเมลล์ 1</label>

                                        <div class="input-box">
                                            <input type="text" name="companyEmail1" value=""  class="input-text" />
                                        </div>

                                        <label align="right">อีเมลล์ 2</label>
                                        <div class="input-box">
                                            <input type="text" name="companyEmail2" value=""  class="input-text" />
                                        </div>

                                        <label align="right">อีเมลล์ 3</label>

                                        <div class="input-box">
                                            <input type="text" name="companyEmail3" value=""  class="input-text" />
                                        </div>

                                        <label align="right">Language</label>
                                        <div class="select option">
                                            <select name="languageFlag">
                                                <option value="T">Thai</option>
                                                <option value="E">English</option>
                                            </select>
                                        </div>
                                        <div class="select option">
                                            <select name="picCode">
                                                <option></option>
                                                <option></option>
                                            </select>
                                        </div>

                                        <tr>
                                            <th></th>
                                            <th><input type="submit" value="บันทีก" /></th>
                                        </tr>

                                    </div>
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
