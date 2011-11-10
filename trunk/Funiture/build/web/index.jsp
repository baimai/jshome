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
<!--menu-->
<link href="jshome/css/black-style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="jshome/css/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="jshome/css/pascal/pascal.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="jshome/css/orman/orman.css" type="text/css" media="screen" />
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
<link href="jshome/css/jquery.thumbnailScroller.css" rel="stylesheet" />
<!-- jquery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<!-- jquery ui custom build (for animation easing) -->
<script src="jshome/js/jquery-ui-1.8.13.custom.min.js"></script>
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
<script>
/* jQuery.noConflict() for using the plugin along with other libraries. 
   You can remove it if you won't use other libraries (e.g. prototype, scriptaculous etc.) or 
   if you include jQuery before other libraries in yourdocument's head tag. 
   [more info: http://docs.jquery.com/Using_jQuery_with_Other_Libraries] */
jQuery.noConflict(); 
/* calling thumbnailScroller function with options as parameters */
(function($){
window.onload=function(){ 
	$("#tS2").thumbnailScroller({ 
		scrollerType:"hoverPrecise", 
		scrollerOrientation:"horizontal", 
		scrollSpeed:2, 
		scrollEasing:"easeOutCirc", 
		scrollEasingAmount:600, 
		acceleration:4, 
		scrollSpeed:800, 
		noScrollCenterSpace:10, 
		autoScrolling:0, 
		autoScrollingSpeed:2000, 
		autoScrollingEasing:"easeInOutQuad", 
		autoScrollingDelay:500 
	});
	$("#tS3").thumbnailScroller({ 
		scrollerType:"hoverPrecise", 
		scrollerOrientation:"horizontal", 
		scrollSpeed:2, 
		scrollEasing:"easeOutCirc", 
		scrollEasingAmount:600, 
		acceleration:4, 
		scrollSpeed:800, 
		noScrollCenterSpace:10, 
		autoScrolling:0, 
		autoScrollingSpeed:2000, 
		autoScrollingEasing:"easeInOutQuad", 
		autoScrollingDelay:500 
	});
	$("#tS4").thumbnailScroller({ 
		scrollerType:"hoverPrecise", 
		scrollerOrientation:"horizontal", 
		scrollSpeed:2, 
		scrollEasing:"easeOutCirc", 
		scrollEasingAmount:600, 
		acceleration:4, 
		scrollSpeed:800, 
		noScrollCenterSpace:10, 
		autoScrolling:0, 
		autoScrollingSpeed:2000, 
		autoScrollingEasing:"easeInOutQuad", 
		autoScrollingDelay:500 
	});
}
})(jQuery);
</script>
<!-- thumbnailScroller script -->
<script src="jshome/js/jquery.thumbnailScroller.js"></script>
</head>


<body>

<table width="1000" border="1" align="center" background="jshome/images/background.jpg"   >
    <jsp:include page="header.jsp"/>
    <jsp:include page="topmenu.jsp"/>
  <tr background="" >
    <td height="418">
     <div id="wrapper">
    
        <a href="http://dev7studios.com" id="dev7link" title="Go to dev7studios">dev7studios</a>

        <div class="slider-wrapper theme-default">
            <div class="ribbon"></div>
            <div id="slider" class="nivoSlider">
                <img src="jshome/images/slideshow/slide-05.jpg" alt="" title="This is an example of a caption" /> <img src="images/slideshow/slide-06.jpg" alt="" title="This is an example of a caption" /> <img src="images/slideshow/slide-07.jpg" alt="" title="This is an example of a caption" /> <img src="images/slideshow/slide-08.jpg" alt="" title="This is an example of a caption" />
          </div>
            <div id="htmlcaption" class="nivo-html-caption">
                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
            </div>
        </div>

    </div>
    </td>
  </tr>
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

