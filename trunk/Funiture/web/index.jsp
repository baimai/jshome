<%-- 
    Document   : index
    Created on : 8 พ.ย. 2554, 22:33:36
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

</head>


<body>

    <table width="1000" border="1" align="center" background="jshome/images/background.jpg" >
    <jsp:include page="header.jsp"/>
    
  
   <tr>
    <td></td>
  </tr>
   <jsp:include page="hotProduct.jsp"/>
   <jsp:include page="newProduct.jsp"/>
   <jsp:include page="promotionProduct.jsp"/>
   <jsp:include page="footer.jsp"/>
</table>

</body>
</html>

