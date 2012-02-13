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
    <body>

        <form action="companyMasterController.do" >
            <input type="hidden" value="Add" name="action">
            <center>
                <table border="0" width="60%" cellspacing="10">
                    <tbody>
                        <tr>
                            <td align="right" width="30%">CompanyCode</td>
                            <td><input type="text" name="companyCode" value="" size="10"/></td>
                        </tr>
                        <tr>
                            <td align="right">ชื่อย่อ</td>
                            <td><input type="text" name="companyNameAbbr" value="" size="10"/></td>
                        </tr>
                        <tr>
                            <td align="right">ชื่อบริษัท</td>
                            <td><input type="text" name="companyNameT" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td align="right">CompanyName</td>
                            <td><input type="text" name="companyNameE" value="" size="30"/></td>
                        </tr>                       
                        <tr>
                            <td align="right">ที่อยู่</td>
                            <td><input type="text" name="companyAddrT" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">Address</td>
                            <td><input type="text" name="companyAddrE" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">แขวง/ตำบล</td>
                            <td><input type="text" name="companyDistrictT" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">District</td>
                            <td><input type="text" name="companyDistrictE" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">อำเภอ</td>
                            <td><input type="text" name="companyAmphurT" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">Amphur</td>
                            <td><input type="text" name="companyAmphurE" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">จังหวัด</td>
                            <td><input type="text" name="companyProvinceT" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">Province</td>
                            <td><input type="text" name="companyProvinceE" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">รหัสไปรษณีย์</td>
                            <td><input type="text" name="companyPostCode" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">โทรศัพท์ 1</td>
                            <td><input type="text" name="companyTel1" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">โทรศัพท์ 2</td>
                            <td><input type="text" name="companyTel2" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">โทรศัพท์ 3</td>
                            <td><input type="text" name="companyTel3" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">โทรสาร 1</td>
                            <td><input type="text" name="companyFax1" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">โทรสาร 2 </td>
                            <td><input type="text" name="companyFax2" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">โทรสาร 3</td>
                            <td><input type="text" name="companyFax3" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">มือถือ 1</td>
                            <td><input type="text" name="companyMobile1" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">มือถือ 2</td>
                            <td><input type="text" name="companyMobile2" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">มือถือ 3</td>
                            <td><input type="text" name="companyMobile3" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">อีเมลล์ 1</td>
                            <td><input type="text" name="companyEmail1" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">อีเมลล์ 2</td>
                            <td><input type="text" name="companyEmail2" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">อีเมลล์ 3</td>
                            <td><input type="text" name="companyEmail3" value="" /></td>
                        </tr>
                        <tr>
                            <td align="right">Language</td>
                            <td>
                                <select name="languageFlag">
                                    <option value="T">Thai</option>
                                    <option value="E">English</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><select name="picCode">
                                    <option></option>
                                    <option></option>
                                </select></td>
                        </tr>
                        <tr>
                            <th></th>
                            <th><input type="submit" value="บันทีก" /></th>
                        </tr>
                    </tbody>
                </table>
            </center>
        </form>
        <br/><br/><br/><br/>
    </body>
</html>
