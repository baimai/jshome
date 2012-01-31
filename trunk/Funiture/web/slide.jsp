
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>slide</title>
<link rel="stylesheet" href="jshome/css/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="jshome/css/pascal/pascal.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="jshome/css/orman/orman.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="jshome/css/nivo-slider.css" type="text/css" media="screen" />
  

   <script type="text/javascript" src="jshome/js/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="jshome/js/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>

</head>


<body>

<table width="940" border="0" bordercolor="black" cellpadding="0" cellspacing="0" >
 
  
  <tr background="" >
    <td height="418">
     <div id="wrapper">       
        <div class="slider-wrapper theme-default">
            <div class="ribbon"></div>
            <div id="slider" class="nivoSlider">
                <img  src="jshome/images/slideshow/slide-05.jpg" alt="" title="This is an example of a caption" /> <img src="jshome/images/slideshow/slide-06.jpg" alt="" title="This is an example of a caption" /> <img src="jshome/images/slideshow/slide-07.jpg" alt="" title="This is an example of a caption" /> <img src="jshome/images/slideshow/slide-08.jpg" alt="" title="This is an example of a caption" />
          </div>
            <div id="htmlcaption" class="nivo-html-caption">
                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
            </div>
        </div>

    </div>
    </td>
  </tr>
   

  
 
</table>

</body>
</html>
