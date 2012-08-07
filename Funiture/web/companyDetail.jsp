<%-- 
    Document   : companyDetail
    Created on : Feb 2, 2012, 2:02:57 PM
    Author     : Jik
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="query" dataSource="webdb">
    SELECT concat(company_name_t) as company_name ,
    concat(company_logo_loc) as logo,
    concat(company_addr_t) as company_addr,
    concat('ตำบล',company_district_t) as tumbon,
    concat('อำเภอ',company_amphur_T) as amphur,
    concat('จังหวัด',company_province_T) as province,
    concat(company_postcode) as post_code,
    concat(company_tel1) as tel1,
    concat(company_tel2) as tel2,
    concat(company_tel3) as tel3,
    concat(company_fax1) as fax1,
    concat(company_fax2) as fax2,
    concat(company_fax3) as fax3,
    concat(company_mobile1) as mobile1,
    concat(company_mobile2) as mobile2,
    concat(company_mobile3) as mobile3,
    concat(company_email1) as email1,
    concat(company_email2) as email2,
    concat(company_email3) as email3
    FROM company_master
    where Company_Id = ${applicationScope.Company_Id}
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
    </head>
    <body >
        <div class="wrapper">
            <div class="page"></div>
        </div>
        <div class="main-container col1-layout">
            <div class="main">
                <div class="col-main">
                    <div class="account-login">
                        <div class="page-title">
                            <h1>รู้จักบริษัท</h1>
                        </div>
                        <form action="" method="" id="">
                            <div class="col2-set">
                                <div class="col-1 new-users">
                                    <div class="content">                                      
                                        <h2>ข้อมูลติดต่อ</h2>                                 
                                        
                                                        <div class="" >
                                                            <c:forEach var="company" items="${query.rows}">
                                                                <div align="left" ><img src="${company.logo}" width="90" height="60" alt="Logo">
                                                                </div>
                                                                <div class="subtitle" style="font-size:20px" > ${company.company_name}
                                                                </div>
                                                                <c:if test="${company.company_addr!=null&&company.company_addr!=''}">
                                                                    <div align="left" >${company.company_addr}
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${company.tumbon!=null&&company.tumbon!=''}">
                                                                    <div align="left">${company.tumbon}</div>
                                                                </c:if>
                                                                <c:if test="${company.amphur!=null&&company.amphur!=''}">
                                                                    ${company.amphur}
                                                                </c:if>
                                                                <c:if test="${company.province!=null&&company.province!=''}">
                                                                    ${company.province}
                                                                </c:if>
                                                                <c:if test="${company.post_code!=null&&company.post_code!=''}">
                                                                    ${company.post_code}
                                                                </c:if>
                                                                <div align="left"><img src="images/icon/telephone.png" width="36" height="36" alt="phone1">
                                                                    <br>
                                                                    <c:if test="${company.tel1!=null&&company.tel1!=''}">
                                                                        ${company.tel1}
                                                                    </c:if>
                                                                    <c:if test="${company.tel2!=null&&company.tel2!=''}">
                                                                        ,${company.tel2}
                                                                    </c:if>
                                                                    <c:if test="${company.tel3!=null&&company.tel3!=''}">
                                                                        ,${company.tel3}
                                                                    </c:if>
                                                                </div>
                                                                <div align="left"><img src="images/icon/fax.png" width="36" height="36" alt="fax">
                                                                    <br>
                                                                    <c:if test="${company.fax1!=null&&company.fax1!=''}">
                                                                        ${company.fax1}
                                                                    </c:if>
                                                                    <c:if test="${company.fax2!=null&&company.fax2!=''}">
                                                                        ,${company.fax2}
                                                                    </c:if>
                                                                    <c:if test="${company.fax3!=null&&company.fax3!=''}">
                                                                        ,${company.fax3}
                                                                    </c:if>
                                                                </div>
                                                                <div align="left"> <img src="images/icon/email.png" width="36" height="36" alt="email">
                                                                    <br>
                                                                    <c:if test="${company.email1!=null&&company.email1!=''}">
                                                                        <a href="mailto:${company.email1}"> ${company.email1}</a>
                                                                    </c:if>
                                                                    <br>
                                                                    <c:if test="${company.email2!=null&&company.email2!=''}">
                                                                        <a href="mailto:${company.email2}">${company.email2}</a>
                                                                    </c:if>
                                                                </div>
                                                                <div align="left"><img src="images/icon/map.png" width="36" height="36" alt="mobile1"/>
                                                                    <br>
                                                                    <c:if test="${company.email3!=null&&company.email3!=''}">
                                                                        <a href="http://farm3.static.flickr.com/2318/2102851946_f58aa80935_o.jpg">${company.email3}</a>
                                                                    </c:if>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                  
                                    </div>
                                </div>
                                <div class="col-2 registered-users">
                                    <div class="content">
                                        <h2>รายละเอียดบริษัท</h2>
                                        <table border="0">
                                            <tbody >
                                                <tr >
                                                    <td align="right" style="color: #F39814">
                                                        <b>บริษัท เจ เอส โฮม จำกัด</b>
                                                        <br>
                                                        เป็นบริษัทนำเข้าเฟอร์นิเจอร์ต่างประเทศ<br>
                                                        คุณภาพเยี่ยมจำหน่ายทั่วประเทศ ราคายอมเยาว์
                                                        <br><br>
                                                        <table border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td> <div align="left"><img src="upload/picture/BR096012-DAVINCI-62.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                    <td> <div align="left"><img src="upload/picture/DS101-6P-GLOBAL-23213.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                    <td> <div align="left"><img src="upload/picture/TS1201-SHADOW-356.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                </tr>
                                                                <tr>
                                                                    <td> <div align="left"><img src="upload/picture/MN0011-901-H18005_O.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                    <td> <div align="left"><img src="upload/picture/GS2601-ITALIA-209.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                    <td> <div align="left"><img src="upload/picture/CT2603-JSS1-208S.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                </tr>
                                                                <tr>
                                                                    <td> <div align="left"><img src="upload/picture/CS0061-2P-ZHEZA-01208.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                    <td> <div align="left"><img src="upload/picture/SF202-PARADISE-105.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                    <td> <div align="left"><img src="upload/picture/CT2502-GREEK-MS1.jpg" width="110" height="90" alt="Logo"/></div></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td></tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <script type="text/javascript">
                            //<![CDATA[
                            var dataForm = new VarienForm('login-form', true);
                            //]]>
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>






















