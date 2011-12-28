<%-- 
    Document   : testUpload
    Created on : 28 ธ.ค. 2554, 13:21:25
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="upload.do" method="post" enctype="multipart/form-data" >
            <input type="file" name="upload" />
            <input type="submit" />
        </form>
    </body>
</html>
