<%--
    Document   : jshome_TestUpload
    Created on : 8 ส.ค. 2555, 13:56
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
    </head>

    <body>
        <form action="upload.do" method="post" enctype="multipart/form-data" >
            <input type="file" name="upload" />
            <input type="submit" />
        </form>
    </body>
    
</html>
