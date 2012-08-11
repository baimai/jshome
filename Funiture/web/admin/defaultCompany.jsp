<%--
    Document   : jshome_DefaultCompany
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="query" dataSource="webdb">
    SELECT * from Company_Master
</sql:query>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
         <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>
    
</html>
