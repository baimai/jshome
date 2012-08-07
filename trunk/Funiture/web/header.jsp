<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : head
    Created on : 8 พ.ย. 2554, 22:59:07
    Author     : Achilles
--%>
<sql:query var="head" dataSource="webdb">
    SELECT * from header_master
</sql:query>
<sql:query var="query2" dataSource="webdb">
    select * from menu_group_master order by Menu_Group
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="jshome/css/style_3.css" type="text/css" media="screen" />
        <!--menu-->
<link rel="stylesheet" href="jshome/css/default/default.css" type="text/css" media="screen" />
   
    <link rel="stylesheet" href="jshome/css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="jshome/css/style.css" type="text/css" media="screen" />

   <script type="text/javascript" src="jshome/js/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="jshome/js/jquery.nivo.slider.pack.js"></script>
    
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
	 
    </script>
    <!-- thumbnail scroller stylesheet -->
<!--<link href="jshome/css/jquery.thumbnailScroller.css" rel="stylesheet" />
 --><!-- jquery -->
<script src="jshome/js/jquery-1.5.min.js"></script>
<!-- jquery ui custom build (for animation easing) -->
<script src="jshome/js/jquery-ui-1.8.13.custom.min.js"></script>
  <style type="text/css">  

body {
	/*margin-left: 0px;*/
	margin-top: 40px;
	/*margin-right: 0px;
	margin-bottom: 0px;*/
}

</style> 

    </head>
    <body >
        
    <c:forEach var="query" items="${head.rows}">
      <tr bordercolordark="#000000" >
              <td bgcolor="#000000" width="10px" align="left"> Login </td>
      </tr>
            <tr >
                <td ><div align="center"><img src="${query.Header_Logo}" width="100%" height="100" /></div></td>
            </tr>
            <tr>
                <td><div align="center"><img src="jshome/images/line.jpg" width="100%" height="4" /></div></td>
            </tr>
    </c:forEach>  
     <tr>
                <td height="41"><div id="container" style="">
                        <ul id="nav">
                            <c:forEach var="topmenu" items="${query2.rows}"> 
                                <c:if test="${topmenu.Menu_G_Name_T=='หน้าหลัก' || topmenu.Menu_G_Name_E =='Home'}">
                                    <li id="selected"><a href="#">${topmenu.Menu_G_Name_T}</a></li>
                                </c:if>
                                <c:if test="${topmenu.Menu_G_Name_T!='หน้าหลัก' && topmenu.Menu_G_Name_E !='Home'}">
                                    <li ><a href="#">${topmenu.Menu_G_Name_T}</a></li>
                                </c:if>                
                            </c:forEach>

                        </ul>
                    </div> 
                </td>
            </tr> 
            
            <tr background="" >
    <td height="418">
    <div id="wrapper">
    
        <a href="http://dev7studios.com" id="dev7link" title="Go to dev7studios">dev7studios</a>

        <div class="p-wrapper theme-default">
            <div class="ribbon"></div>
            <div id="slider" class="nivoSlider">
                <img src="jshome/images/slideshow/slide-05.jpg" alt="" title="This is an example of a caption" /> <img src="jshome/images/slideshow/slide-06.jpg" alt="" title="This is an example of a caption" /> <img src="jshome/images/slideshow/slide-07.jpg" alt="" title="This is an example of a caption" /> <img src="jshome/images/slideshow/slide-08.jpg" alt="" title="This is an example of a caption" />
          </div>
            <div id="htmlcaption" class="nivo-html-caption">
                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
            </div>
        </div>

    </div> 
    </td>
  </tr>
  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>	

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>

<script type="text/javascript" src="jshome/js/jquery.spasticNav.js"></script>	

<script type="text/javascript">
$('#nav').spasticNav();
</script>
        
    </body>
</html>
