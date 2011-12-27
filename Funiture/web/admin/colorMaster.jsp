<%-- 
    Document   : mastercollor
    Created on : Dec 27, 2011, 2:37:34 PM
    Author     : Jik
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
        <form action="colorMaster.do">
            <table border="1">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>รหัสสี</td>
                        <td><input type="text" name="colorCode" value="" /></td>
                    </tr>
                    <tr>
                        <td>ชื่อภาษาอังกฤษ</td>
                        <td><input type="text" name="colorNameE" value="" /></td>
                    </tr>
                     <tr>
                        <td>ชื่อภาษาไทย</td>
                        <td><input type="text" name="colorNameT" value="" /></td>
                    </tr>
                    <tr><input type="hidden" value="Add" name="action" />
                        <td ><input type="submit" value="บันทึก" /></td>
                        <td><input type="submit" value="ยกเลิก" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
