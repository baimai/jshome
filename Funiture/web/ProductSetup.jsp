<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : ProductSetup
    Created on : 24 พ.ย. 2554, 12:03:30
    Author     : Achilles
--%>
<sql:query var="query" dataSource="webdb">
    SELECT * FROM menu_detail_master mdm 
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT * FROM product_detail_master mdm 
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Product Setup</title>
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <script type="text/javascript">
            function chooseMenu(text){
                document.getElementById('menuSelect').innerHTML = text;
                document.getElementById('selectMCode').value = document.getElementById('menuCode').value;
            }
            function chooseProduct(text,value1){
                document.getElementById('productSelect').innerHTML = text;
                document.getElementById('selectPCode').value = value1;
            }
        </script>    
    </head>
    <body>
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
                    <br/><br/><br/>
                    <form>
                    <table align="center">
                        <tr>
                            <td align="center">ประเภทสินค้า</td>
                            <td style="width:100px"></td>
                            <td>ชื่อสินค้า</td>
                        </tr>
                        <tr>
                            <td>                                 
                                <select name="menuCode" size="10" style="width:150px;" onclick="chooseMenu(this.options[this.selectedIndex].text)">
                                    <option selected value=""> none </option>
                                    <c:forEach var="menu" items="${query.rows}">
                                        <option value="${menu.menu_code}">${menu.menu_c_name_t}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td></td>
                            <td>                                 
                                <select name="productCode" size="10" style="width:250px;" onclick="chooseProduct(this.options[this.selectedIndex].text)">
                                    <option selected value=""> none </option>
                                    <c:forEach var="product" items="${query2.rows}">
                                        <option value="${product.product_code}">${product.product_D_name_t}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td><td></td><td></td>
                        </tr>
                        <tr height="100px">
                            <td><label id="menuSelect"> ไม่ได้ถูกเลือก </label><input type="hidden" name="selectMCode"/></td>
                            <td></td>
                            <td><label id="productSelect"> ไม่ได้ถูกเลือก </label><input type="hidden" name="selectPCode"/></td>
                        </tr>
                        <tr><td colspan="3" align="center"><input type="submit" value="ADD" /><input type="reset" value="Clear" /></td></tr>
                    </table>
                    </form>
                    <br/><br/><br/><br/><br/><br/>
                    <jsp:include page="footer.jsp" />
                    <br/><br/>
                </div>


            </div>

        </div>
    </body>
</html>
