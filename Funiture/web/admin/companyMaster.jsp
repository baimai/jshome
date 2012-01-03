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
    <body><form action="companyMasterController.do" >
            <input type="hidden" value="Add" name="action">
      <table border="1">

            <thead>
                <tr>
                    <th></th>
                    <th><input type="submit" value="บันทีก" /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>CompanyCode</td>
                    <td><input type="text" name="companyCode" value="" /></td>
                </tr>
                <tr>
                    <td>ชื่อบริษัท</td>
                    <td><input type="text" name="companyNameT" value="" /></td>
                </tr>
                <tr>
                    <td>CompanyName</td>
                    <td><input type="text" name="companyNameE" value="" /></td>
                </tr>
                <tr>
                    <td>ชื่อย่อ</td>
                    <td><input type="text" name="companyNameAbbr" value="" /></td>
                </tr>
                <tr>
                    <td>ที่อยู่</td>
                    <td><input type="text" name="companyAddrT" value="" /></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="companyAddrE" value="" /></td>
                </tr>
                <tr>
                    <td>แขวง/ตำบล</td>
                    <td><input type="text" name="companyDistrictT" value="" /></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><input type="text" name="companyDistrictE" value="" /></td>
                </tr>
                <tr>
                    <td>อำเภอ</td>
                    <td><input type="text" name="companyAmphurT" value="" /></td>
                </tr>
                <tr>
                    <td>Amphur</td>
                    <td><input type="text" name="companyAmphurE" value="" /></td>
                </tr>
                <tr>
                    <td>จังหวัด</td>
                    <td><input type="text" name="companyProvinceT" value="" /></td>
                </tr>
                <tr>
                    <td>Province</td>
                    <td><input type="text" name="companyProvinceE" value="" /></td>
                </tr>
                <tr>
                    <td>รหัสไปรษณีย์</td>
                    <td><input type="text" name="companyPostCode" value="" /></td>
                </tr>
                <tr>
                    <td>โทรศัพท์ 1</td>
                    <td><input type="text" name="companyTel1" value="" /></td>
                </tr>
                <tr>
                    <td>โทรศัพท์ 2</td>
                    <td><input type="text" name="companyTel2" value="" /></td>
                </tr>
                <tr>
                    <td>โทรศัพท์ 3</td>
                    <td><input type="text" name="companyTel3" value="" /></td>
                </tr>
                <tr>
                    <td>โทรสาร 1</td>
                    <td><input type="text" name="companyFax1" value="" /></td>
                </tr>
                <tr>
                    <td>โทรสาร 2 </td>
                    <td><input type="text" name="companyFax2" value="" /></td>
                </tr>
                <tr>
                    <td>โทรสาร 3</td>
                    <td><input type="text" name="companyFax3" value="" /></td>
                </tr>
                <tr>
                    <td>มือถือ 1</td>
                    <td><input type="text" name="companyMobile1" value="" /></td>
                </tr>
                <tr>
                    <td>มือถือ 2</td>
                    <td><input type="text" name="companyMobile2" value="" /></td>
                </tr>
                <tr>
                    <td>มือถือ 3</td>
                    <td><input type="text" name="companyMobile3" value="" /></td>
                </tr>
                <tr>
                    <td>อีเมลล์ 1</td>
                    <td><input type="text" name="companyEmail1" value="" /></td>
                </tr>
                <tr>
                    <td>อีเมลล์ 2</td>
                    <td><input type="text" name="companyEmail2" value="" /></td>
                </tr>
                <tr>
                    <td>อีเมลล์ 3</td>
                    <td><input type="text" name="companyEmail3" value="" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <select name="languageFlag">
                            <option>TH</option>
                            <option>EN</option>
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
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
</form>
    </body>
</html>
