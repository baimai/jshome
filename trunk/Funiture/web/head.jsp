<%-- 
    Document   : header_2
    Created on : 13 พ.ย. 2554, 19:55:55
    Author     : Achilles
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:query var="query2" dataSource="webdb">
   select * from menu_group_master mg
where mg.menu_permission='U'
order by mg.Menu_Group_Id
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <link rel="stylesheet" href="css/top_menu.css" type="text/css" media="screen" />
       <%-- <script type="text/javascript" src="jshome/js/jquery-1.4.1.min.js"></script> --%>
         <script type="text/javascript" src="jshome/js/jquery-1.7.2-ui.min.js"></script>
    </head>
    <body>
        <table border="0" bordercolor="black" cellpadding="0" cellspacing="0"width="940px" >
           
            <tr bgcolor="#A03700" >
                <td ><img src="images/head.jpg" width="940px" height="100px" border="0" usemap="#Map"/></td>
            </tr>
            <tr bgcolor="#4a4a4a">
                <td ><div id="container-menu" style="">
                        <ul id="nav">
                            <c:forEach var="topmenu" items="${query2.rows}"> 
                                <c:if test="${topmenu.Menu_G_Name_T=='หน้าหลัก' || topmenu.Menu_G_Name_E =='Home'}">
                                    <li id="selected"><a href="${topmenu.Menu_G_Pic_Loc}">${topmenu.Menu_G_Name_T}</a></li>
                                </c:if>
                                <c:if test="${topmenu.Menu_G_Name_T!='หน้าหลัก' && topmenu.Menu_G_Name_E !='Home'}">
                                    <li ><a href="${topmenu.Menu_G_Pic_Loc}">${topmenu.Menu_G_Name_T}</a></li>
                                </c:if>                
                            </c:forEach>

                        </ul>
                    </div></td>
            </tr>   
            
        </table>
       
        <script type="text/javascript" src="js/top_menu.js"></script>
<map name="Map">
  <area shape="rect" coords="893,7,937,24" href="Login.jsp" target="_self">
  </map>
    <script type="text/javascript">
            $('#nav').spasticNav();
        </script>
    </body>
</html>
