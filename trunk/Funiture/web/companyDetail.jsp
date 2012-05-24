<%-- 
    Document   : companyDetail
    Created on : Feb 2, 2012, 2:02:57 PM
    Author     : Jik
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="query" dataSource="webdb">
    SELECT concat(company_name_t) as company_name ,
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
    <body >  <div class="wrapper">
                        <div class="page">
                        </div>
        <div class="main-container col2-right-layout">
            <div class="main">
                <div class="col-main">
                    <div id="messages_product_view"></div>
                    <div class="page-title">
                        <h1>รู้จักบริษัท</h1>
                    </div>
                    <div class="fieldset">
                        <c:forEach var="company" items="${query.rows}"> </div>
                            <div class="subtitle" style="font-size:24px" > ${company.company_name}</div>
                            <c:if test="${company.company_addr!=null&&company.company_addr!=''}">
                                <div align="left" >${company.company_addr}</div>
                            </c:if>
                            <c:if test="${company.tumbon!=null&&company.tumbon!=''}">
                                <div align="left">${company.tumbon}
                            </c:if>
                            <c:if test="${company.amphur!=null&&company.amphur!=''}">
                               ${company.amphur}
                            </c:if>
                            <c:if test="${company.province!=null&&company.province!=''}">
                                ${company.province}
                            </c:if>
                            <c:if test="${company.post_code!=null&&company.post_code!=''}">
                                ${company.post_code}
                            </c:if></div>
                                
                                
                                <div align="left"><img src="images/icon/phone1.jpg" width="36" height="36" alt="phone1"/>  

                                <c:if test="${company.tel1!=null&&company.tel1!=''}">
                                    ${company.tel1}
                                </c:if>
                                <c:if test="${company.tel2!=null&&company.tel2!=''}">
                                    ,${company.tel2}
                                </c:if>
                                <c:if test="${company.tel3!=null&&company.tel3!=''}">
                                    ,${company.tel3}
                                </c:if></div>

                                <div align="left"><img src="images/icon/fax.jpg" width="36" height="36" alt="fax"/> 

                                <c:if test="${company.fax1!=null&&company.fax1!=''}">
                                    ${company.fax1}
                                </c:if>
                                <c:if test="${company.fax2!=null&&company.fax2!=''}">
                                    ,${company.fax2}
                                </c:if>
                                <c:if test="${company.fax3!=null&&company.fax3!=''}">
                                    ,${company.fax3}
                                </c:if></div>

                                <div align="left"><img src="images/icon/mobile1.jpg" width="36" height="36" alt="mobile1"/> 

                                <c:if test="${company.mobile1!=null&&company.mobile1!=''}">
                                    ${company.mobile1}
                                </c:if>
                                <c:if test="${company.mobile2!=null&&company.mobile2!=''}">
                                    ,${company.mobile2}
                                </c:if>
                                <c:if test="${company.mobile3!=null&&company.mobile3!=''}">
                                    ,${company.mobile3}
                                </c:if></div>

                                <div align="left"> <img src="images/icon/email.jpg" width="36" height="36" alt="email"/>

                                <c:if test="${company.email1!=null&&company.email1!=''}">
                                    <a href="mailto:${company.email1}"> ${company.email1}</a>
                                </c:if>
                                <c:if test="${company.email2!=null&&company.email2!=''}">
                                    <a href="mailto:${company.email2}">${company.email2}</a>
                                </c:if>
                                <c:if test="${company.email3!=null&&company.email3!=''}">
                                    <a href="mailto:${company.email3}">${company.email3}</a>
                                </c:if>
                        </c:forEach></div>
                   
                </div>
                <jsp:include page="myCart.jsp" /> </div></div>
        </div>
    </body>
</html>
