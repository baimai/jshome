<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : defaultCompany
    Created on : 10 ม.ค. 2555, 10:46:37
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:query var="query" dataSource="webdb">
    SELECT * from Company_Master
</sql:query>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/><br/><br/>
        <form action="defaultCompany.do" >
            <c:forEach var="company" items="${query.rows}">
                <center><select name="CompanyId">
                        <c:if test="${applicationScope.Company_Id == 0}">
                            <option value="0" selected>--- NONE ---</option>
                        </c:if>
                        <c:if test="${applicationScope.Comapany_Id == company.Company_Id}">
                            <option value="${company.Company_Id}" selected>${company.Company_Code}</option>
                        </c:if>
                        <c:if test="${applicationScope.Comapany_Id != company.Company_Id}">
                            <option value="${company.Company_Id}" >${company.Company_Code}</option>
                        </c:if>
                    </select>
                </c:forEach>
                <br/><br/>
                <input type="submit" value="Set Default" name="action"/>
            </center>
        </form>
    </body>
</html>
