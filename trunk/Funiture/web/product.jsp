<%-- 
    Document   : product
    Created on : 10 พ.ย. 2554, 15:27:59
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <style type="text/css">
            <!--
            body {
                margin-left: 0px;
                /*margin-top: 40px;*/
                margin-right: 0px;
                margin-bottom: 0px;
            }
            -->
        </style>



        <!-- thumbnailScroller script -->
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
                    <table  cellspacing="0" cellpadding="0" width="940px">
                        <tr>
                            <td valign="top"><br>
                                
                                <jsp:include page="menuLeft.jsp" />
                            </td>
                            <td ><jsp:include page="productTab.jsp" /></td>
                        </tr>
                    </table>

                    <br/><br/>
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