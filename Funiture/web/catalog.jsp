
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%--
    Document   : test
    Created on : 11 พ.ย. 2554, 12:52:39
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="query1" dataSource="webdb">
    SELECT * FROM catalog_master where company_id = 1
</sql:query>
<html>
    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="content-language" content="th" />
        <meta name="robots" content="index, company,category,contactUs" />
        <meta name="description" content="jshome " />
        <meta name="revisit-after" content="*"/>
        <meta name="keywords" content="ชุดโซฟาไม้,ชุดโซฟาผ้า,ชุดโต๊ะกลางหิน,ชุดมินิบาร์,ชุดหวายแท้,ชุดหวายซันทาน่า,เอเลียส,ชุดอลูอัล
              ,เตียงชายหาด,ชุดอาหารกระจก,ชุดอาหารไม้,ชุดอาหารหินกลม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 6 ที่นั่ง,ชุดอาหารหินเหลี่ยม 4 ที่นั่ง,โต๊ะกลางกระจก,
              โต๊ะกลาง,ชุดกาแฟ,เตียง,เก้าอี้,เก้าอี้ชิงช้า,ชั้นวางโทรศัพท์,ชั้นวางหนังสือ,ราวไม้ ,ฉากกั้น,กระเช้า, โต๊ะคาเฟ่" />
        <link rel="icon" href="images/js.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="images/js.ico" type="image/x-icon" />
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript">
            function checkMember(catalog){
                if(${sessionScope.loginDetail == null} ){
                    alert('กรุณาสมัครสมาชิก');
                }else{
                    window.location.href=catalog;
                }
            }

        </script>

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
                    <br><br>

                    <div class="main-container col2-right-layout">
                <div class="main">

                    <div class="wrapper">
                        <div class="page"></div>
                        
                     <div class="col-main">
                        <div class="account-login">
                            <div class="page-title">
                                <h1>แค็ตตาล็อก</h1>
                            </div>
                            <form action="" method="" id="">
                                <div class="col2-set">
                                    <div class="col-1 new-users">
                                        <div class="content">

                                            <h2>รายการแค็ตตาล็อก</h2>

                                            <table align="left"  wifth="100%" border="0">

                                                <tbody>

                                                    <c:forEach var="catalog" items="${query1.rows}">
                                                        <tr >

                                                            <td class="a-right" >

                                                                <img src="images/pdf.png"  alt="filetype_pdf" /></td>

                                                            <td class="a-left" >
                                                                <a href="#" onclick="checkMember('${catalog.catalog_pic_loc}');">${catalog.catalog_name}</a></td>
                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                            </table>

                                              <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 </div>
</div>
                                    </div>
                            </form>
                        </div>
                                   </div>

        <jsp:include page="myCart.jsp" />
   
 </div>
                     
                    </div>
                    </div>

                     <jsp:include page="footer.jsp" />
                     <br/><br/>
 </div>
                      </div>
                      </div>
    </body>



