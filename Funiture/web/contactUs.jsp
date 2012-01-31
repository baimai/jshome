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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>

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
                    <jsp:include page="head.jsp"/>
                    <jsp:include page="slide.jsp"/>
                    <center>
                        <c:forEach var="company" items="${query.rows}">
                            <h1 style="color:#1c94c4;font-family: Fantasy" >ติดต่อ ${company.company_name}</h1>

                            <h2 style="margin:10px;margin-left:0px;color:#1c94c4;">ที่อยู่</h2>
                            <font size="5">
                                <c:if test="${company.company_addr!=null&&company.company_addr!=''}">
                                    <div style="display: inline-block">${company.company_addr}</div>
                                </c:if>
                                <c:if test="${company.tumbon!=null&&company.tumbon!=''}">
                                    <div style="display: inline-block">${company.tumbon}</div>
                                </c:if>
                                <c:if test="${company.amphur!=null&&company.amphur!=''}">
                                    <div style="display: inline-block">${company.amphur}</div>
                                </c:if>
                                <c:if test="${company.province!=null&&company.province!=''}">
                                    <div style="display: inline-block">${company.province}</div>
                                </c:if>
                                <c:if test="${company.post_code!=null&&company.post_code!=''}">
                                    <div style="display: inline-block">${company.post_code}</div>
                                </c:if>
                                <div></div>
                                โทร.&nbsp;
                                <c:if test="${company.tel1!=null&&company.tel1!=''}">
                                    <div style="display: inline-block">${company.tel1}</div>
                                </c:if>
                                <c:if test="${company.tel2!=null&&company.tel2!=''}">
                                    <div style="display: inline-block">,${company.tel2}</div>
                                </c:if>
                                <c:if test="${company.tel3!=null&&company.tel3!=''}">
                                    <div style="display: inline-block">,${company.tel3}</div>
                                </c:if>
                                <div></div>
                                แฟกซ์.&nbsp;
                                <c:if test="${company.fax1!=null&&company.fax1!=''}">
                                    <div style="display: inline-block">${company.fax1}</div>
                                </c:if>
                                <c:if test="${company.fax2!=null&&company.fax2!=''}">
                                    <div style="display: inline-block">,${company.fax2}</div>
                                </c:if>
                                <c:if test="${company.fax3!=null&&company.fax3!=''}">
                                    <div style="display: inline-block">,${company.fax3}</div>
                                </c:if>
                                <div></div>
                                มือถือ.&nbsp;
                                <c:if test="${company.mobile1!=null&&company.mobile1!=''}">
                                    <div style="display: inline-block">${company.mobile1}</div>
                                </c:if>
                                <c:if test="${company.mobile2!=null&&company.mobile2!=''}">
                                    <div style="display: inline-block">,${company.mobile2}</div>
                                </c:if>
                                <c:if test="${company.mobile3!=null&&company.mobile3!=''}">
                                    <div style="display: inline-block">,${company.mobile3}</div>
                                </c:if>
                                <div></div>
                                อีเมลล์.&nbsp;
                                <c:if test="${company.email1!=null&&company.email1!=''}">
                                    <a href="mailto:${company.email1}"> <div style="display: inline-block">${company.email1}</div></a>
                                </c:if>
                                <c:if test="${company.email2!=null&&company.email2!=''}">
                                    <a href="mailto:${company.email2}"><div style="display: inline-block">${company.email2}</div></a>
                                </c:if>
                                <c:if test="${company.email3!=null&&company.email3!=''}">
                                    <a href="mailto:${company.email3}"><div style="display: inline-block">${company.email3}</div></a>
                                </c:if>
                            </font>


                        </c:forEach>
                        <br/><br/><br/><br/>
                    </center>

                    <jsp:include page="footer.jsp" />
                    <br/><br/>
                </div>


            </div>
            <div class="cleared"></div>
        </div>

        <div class="cleared"></div>
        <p class="art-page-footer"></p>

    </body>
</html>