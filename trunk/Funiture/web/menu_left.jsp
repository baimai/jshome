<%-- 
    Document   : menu_left
    Created on : 10 พ.ย. 2554, 16:44:56
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<!--menu accord-->
<style type="text/css" media="screen">
        <!--
        BODY { margin: 10px; padding: 0; font: 1em "Trebuchet MS", verdana, arial, sans-serif; font-size: 100%; }
        DIV.container { margin: auto; width: 90%; margin-bottom: 10px;}
        TEXTAREA { width: 80%;}
        FIELDSET { border: 1px solid #ccc; padding: 1em; margin: 0; }
        LEGEND { color: #ccc; font-size: 120%; }
        INPUT, TEXTAREA { font-family: Arial, verdana; font-size: 125%; padding: 7px; border: 1px solid #999; }
        LABEL { display: block; margin-top: 10px; } 
        IMG { margin: 5px; }

        h2 {
            margin: 0;
        }

        .drawers-wrapper {
	position: relative;
	width: 188px;
	margin:auto;            
        }

        .drawer {
            background:transparent url(http://images.apple.com/downloads/images/sideboxlight_bg20070611.gif) repeat-y scroll 0pt;
            color:#3177c5;
            font-size:11px;
            line-height:1.3em;
        }

        .boxcap {
            height:5px;
            left:0pt;
            position:absolute;
            width:100%;
            z-index:100;
            background:transparent url(http://images.apple.com/downloads/images/sidenav_capbottom.png) no-repeat scroll 0%;
            margin-top:-5px;
        }

        .captop {
            background-image:url(http://images.apple.com/downloads/images/box_188captop.png);
            bottom:auto;
            top:0pt;
            margin-top:0;
        }

        .drawers {
            margin-bottom:15px;
            color:#3177c5;
            font-size:11px;
            line-height: 18px;
        }

        .drawers A {
            color:#666666;
            text-decoration:none;
            font-family:"Lucida Grande",Geneva,Arial,Verdana,sans-serif;
            font-size-adjust:none;
            font-style:normal;
            font-variant:normal;
            font-weight:normal;
        }

        .drawer li {
            border-bottom:1px solid #E5E5E5;
            line-height:16px;
            padding:6px 0pt;
        }

        UL {
            list-style: none;
            padding: 0;
        }

        UL.drawers {
            margin: 0;
        }

        .drawer-handle {
            background:#939393 url(http://images.apple.com/downloads/images/slider_handlebg188.png) no-repeat scroll 0pt;
            color:#333333;
            cursor:default;
            font-size:12px;
            font-weight:normal;
            height:25px;
            line-height:25px;
            margin-bottom:0pt;
            text-indent:15px;
            width:100%;
        }

        .drawer-handle.open {
            background-color:#72839D;
            background-position:-188px 0pt;
            color:#FFFFFF;
        }

        .drawer UL {
            padding: 0 12px;
            padding-bottom:0pt;
        }

        .drawer-content UL {
            padding-top: 7px;
        }

        .drawer-content LI A {
            display:block;
            overflow:hidden;
        }

        .alldownloads li {
            border:0pt none;
            line-height:18px;
            padding:0pt;
        }
        -->
        </style>
    <!--page-->
    <link rel="stylesheet" href="jshome/css/main.css" type="text/css" />


</head>

<body>


  
    <table  border="0" align="left" bgcolor="#FFFFFF">
      <tr bgcolor="#FFFFFF">
        <td   height="255"bgcolor="#FFFFFF" ><p></p> 
    <div class="drawers-wrapper"  >
        <div class="boxcap captop"></div>
    <ul class="drawers">
        <li class="drawer">
            <h2 class="drawer-handle open">Product Navigation</h2>
            <ul class="alldownloads">
               
                <li id="sn-apple"></li>
            </ul>
        </li>
        <li class="drawer">
            <h2 class="drawer-handle">โต๊ะกลาง</h2>
            <ul>
                <li><a title="iTunes 7.5" href="http://www.apple.com/itunes/download/">โต๊กลางหิน 8 รุ่น</a></li>
                <li><a title="QuickTime 7.3.1" href="http://www.apple.com/quicktime/download/">โต๊ะกลางกระจก CP28</a></li>
                <li><a title="Safari 3 Public Beta" href="http://www.apple.com/safari/download/">โต๊ะกลางกระจก Temper glass</a></li>
                <li><a title="MacPool" href="/downloads/macosx/games/simulation_and_sports/macpool.html">โต๊ะกลางกระจกโทนิก,ดูม</a></li>
                <li><a title="Guitar Hero III: Legends of Rock" href="/downloads/macosx/games/demos_updates/guitarheroiiilegendsofrock.html">โต๊ะกลางกระจกใหม่</a></li>
                <li></li>
            </ul>
        </li>
        <li class="drawer last">
            <h2 class="drawer-handle">ชุดโซฟา</h2>
            <ul>
                <li><a title="iTunes 7.5" href="http://www.apple.com/itunes/download/">ชุดโซฟาไม้แมนจู</a></li>
                <li><a title="QuickTime 7.3.1" href="http://www.apple.com/quicktime/download/">ชุดโซฟาไม้กวนอู</a></li>
                <li><a title="Safari 3 Public Beta" href="http://www.apple.com/safari/download/">ชุดโซฟาไม้รวมฮิต-1</a></li>
                <li><a title="Mac OS X 10.5.1 Update" href="/downloads/macosx/apple/macosx_updates/macosx1051update.html">ชุดโซฟาไม้รวมฮิต-2</a></li>
                <li><a title="Java for Mac OS X 10.4 Release 5" href="/downloads/macosx/apple/macosx_updates/javaformacosx104release5.html">ชุดโซฟาหวายแบมบู</a></li>
                <li><a title="iPod Reset Utility 1.0.2 for Windows" href="/downloads/macosx/apple/ipod_itunes/ipodresetutility102forwindows.html">ชุดโซฟาหวายดิดิเย่ร์</a></li>
                <li><a title="iPhoto 7.1.1" href="/downloads/macosx/apple/application_updates/iphoto711.html">ชุดโซฟาหวายบาเลนเซีย</a></li>
                <li><a title="Bonjour for Windows" href="/downloads/macosx/apple/windows/bonjourforwindows.html">ชุดโซฟาหวายพาราไดร์,โมนิก้า</a></li>
               
            </ul>
        </li>
    </ul>
        <div class="boxcap"></div>
        </div> </td>
        
      </tr>
    </table>


</body>
</html>
