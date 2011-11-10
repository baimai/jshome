package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<title>Untitled Document</title>\n");
      out.write("<!--menu-->\n");
      out.write("<link href=\"jshome/css/black-style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link rel=\"stylesheet\" href=\"jshome/css/default/default.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"jshome/css/pascal/pascal.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"jshome/css/orman/orman.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"jshome/css/nivo-slider.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"jshome/css/style.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("\n");
      out.write("   <script type=\"text/javascript\" src=\"jshome/js/jquery-1.6.1.min.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"jshome/js/jquery.nivo.slider.pack.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("    $(window).load(function() {\n");
      out.write("        $('#slider').nivoSlider();\n");
      out.write("    });\n");
      out.write("    </script>\n");
      out.write("    <!-- thumbnail scroller stylesheet -->\n");
      out.write("<link href=\"jshome/css/jquery.thumbnailScroller.css\" rel=\"stylesheet\" />\n");
      out.write("<!-- jquery -->\n");
      out.write("<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js\"></script>\n");
      out.write("<!-- jquery ui custom build (for animation easing) -->\n");
      out.write("<script src=\"jshome/js/jquery-ui-1.8.13.custom.min.js\"></script>\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("<!--\n");
      out.write("body {\n");
      out.write("\tmargin-left: 0px;\n");
      out.write("\t/*margin-top: 40px;*/\n");
      out.write("\tmargin-right: 0px;\n");
      out.write("\tmargin-bottom: 0px;\n");
      out.write("}\n");
      out.write("-->\n");
      out.write("</style>\n");
      out.write("<script>\n");
      out.write("/* jQuery.noConflict() for using the plugin along with other libraries. \n");
      out.write("   You can remove it if you won't use other libraries (e.g. prototype, scriptaculous etc.) or \n");
      out.write("   if you include jQuery before other libraries in yourdocument's head tag. \n");
      out.write("   [more info: http://docs.jquery.com/Using_jQuery_with_Other_Libraries] */\n");
      out.write("jQuery.noConflict(); \n");
      out.write("/* calling thumbnailScroller function with options as parameters */\n");
      out.write("(function($){\n");
      out.write("window.onload=function(){ \n");
      out.write("\t$(\"#tS2\").thumbnailScroller({ \n");
      out.write("\t\tscrollerType:\"hoverPrecise\", \n");
      out.write("\t\tscrollerOrientation:\"horizontal\", \n");
      out.write("\t\tscrollSpeed:2, \n");
      out.write("\t\tscrollEasing:\"easeOutCirc\", \n");
      out.write("\t\tscrollEasingAmount:600, \n");
      out.write("\t\tacceleration:4, \n");
      out.write("\t\tscrollSpeed:800, \n");
      out.write("\t\tnoScrollCenterSpace:10, \n");
      out.write("\t\tautoScrolling:0, \n");
      out.write("\t\tautoScrollingSpeed:2000, \n");
      out.write("\t\tautoScrollingEasing:\"easeInOutQuad\", \n");
      out.write("\t\tautoScrollingDelay:500 \n");
      out.write("\t});\n");
      out.write("\t$(\"#tS3\").thumbnailScroller({ \n");
      out.write("\t\tscrollerType:\"hoverPrecise\", \n");
      out.write("\t\tscrollerOrientation:\"horizontal\", \n");
      out.write("\t\tscrollSpeed:2, \n");
      out.write("\t\tscrollEasing:\"easeOutCirc\", \n");
      out.write("\t\tscrollEasingAmount:600, \n");
      out.write("\t\tacceleration:4, \n");
      out.write("\t\tscrollSpeed:800, \n");
      out.write("\t\tnoScrollCenterSpace:10, \n");
      out.write("\t\tautoScrolling:0, \n");
      out.write("\t\tautoScrollingSpeed:2000, \n");
      out.write("\t\tautoScrollingEasing:\"easeInOutQuad\", \n");
      out.write("\t\tautoScrollingDelay:500 \n");
      out.write("\t});\n");
      out.write("\t$(\"#tS4\").thumbnailScroller({ \n");
      out.write("\t\tscrollerType:\"hoverPrecise\", \n");
      out.write("\t\tscrollerOrientation:\"horizontal\", \n");
      out.write("\t\tscrollSpeed:2, \n");
      out.write("\t\tscrollEasing:\"easeOutCirc\", \n");
      out.write("\t\tscrollEasingAmount:600, \n");
      out.write("\t\tacceleration:4, \n");
      out.write("\t\tscrollSpeed:800, \n");
      out.write("\t\tnoScrollCenterSpace:10, \n");
      out.write("\t\tautoScrolling:0, \n");
      out.write("\t\tautoScrollingSpeed:2000, \n");
      out.write("\t\tautoScrollingEasing:\"easeInOutQuad\", \n");
      out.write("\t\tautoScrollingDelay:500 \n");
      out.write("\t});\n");
      out.write("}\n");
      out.write("})(jQuery);\n");
      out.write("</script>\n");
      out.write("<!-- thumbnailScroller script -->\n");
      out.write("<script src=\"jshome/js/jquery.thumbnailScroller.js\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<table width=\"1000\" border=\"1\" align=\"center\" background=\"jshome/images/background.jpg\"   >\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "topmenu.jsp", out, false);
      out.write("\n");
      out.write("  <tr background=\"\" >\n");
      out.write("    <td height=\"418\">\n");
      out.write("     <div id=\"wrapper\">\n");
      out.write("    \n");
      out.write("        <a href=\"http://dev7studios.com\" id=\"dev7link\" title=\"Go to dev7studios\">dev7studios</a>\n");
      out.write("\n");
      out.write("        <div class=\"slider-wrapper theme-default\">\n");
      out.write("            <div class=\"ribbon\"></div>\n");
      out.write("            <div id=\"slider\" class=\"nivoSlider\">\n");
      out.write("                <img src=\"jshome/images/slideshow/slide-05.jpg\" alt=\"\" title=\"This is an example of a caption\" /> <img src=\"images/slideshow/slide-06.jpg\" alt=\"\" title=\"This is an example of a caption\" /> <img src=\"images/slideshow/slide-07.jpg\" alt=\"\" title=\"This is an example of a caption\" /> <img src=\"images/slideshow/slide-08.jpg\" alt=\"\" title=\"This is an example of a caption\" />\n");
      out.write("          </div>\n");
      out.write("            <div id=\"htmlcaption\" class=\"nivo-html-caption\">\n");
      out.write("                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href=\"#\">a link</a>.\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    </td>\n");
      out.write("  </tr>\n");
      out.write("   <tr>\n");
      out.write("    <td></td>\n");
      out.write("  </tr>\n");
      out.write("   ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "hotProduct.jsp", out, false);
      out.write("\n");
      out.write("   ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "newProduct.jsp", out, false);
      out.write("\n");
      out.write("   ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "promotionProduct.jsp", out, false);
      out.write("\n");
      out.write("   ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
