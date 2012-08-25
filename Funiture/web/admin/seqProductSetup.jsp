<%--
    Document   : jshome_SeqProductSetup
    Created on : 9 ส.ค. 2555, 15:19
    Author     : Sarawut
--%>

<%@include file="checkRole.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
        <style type="text/css">
            body
            {
                line-height: 1.6em;
            }

            #box-table-a
            {

                font-size: 12px;
                margin: 45px;
                width: 870px;
                text-align: left;
                border-collapse: collapse;
            }
            #box-table-a th
            {
                font-size: 13px;
                font-weight: normal;
                padding: 8px;
                background: #b9c9fe;
                border-top: 4px solid #aabcfe;
                border-bottom: 1px solid #fff;
                color: #039;
            }
            #box-table-a td
            {
                padding: 8px;
                background: #e8edff;
                border-bottom: 1px solid #fff;
                color: #669;
                border-top: 1px solid transparent;
            }
            #box-table-a tr:hover td
            {
                background: #d0dafd;
                color: #339;
            }
        </style>
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
                    <jsp:include page="header.jsp"/>
                    <br><br>
                    <div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>จัดลำดับสินค้า</h1>
                                        </div>
                                        <form action="seqProductSetup.do" >
                                            <div class="buttons" align="center">
                                                <input type="hidden" value="${param.picId}" name="picId" />
                                                <button name="action" type="submit" value="saveSeq" class="button"><span><span>บันทึก</span></span></button>
                                            </div>

                                            <center>
                                                <br/>
                                                <table  width="100%"   id="box-table-a">
                                                    <thead>
                                                        <tr>
                                                            <th width="15%" align="center" scope="col"><center>รหัสชุดแสดง</center></th>
                                                            <th width="20%" align="center" scope="col"><center>ชื่อรหัสสินค้า</center></th>
                                                            <th width="20%" align="center" scope="col">ชื่อสินค้าไทย</th>
                                                            <th width="20%" align="center" scope="col"><center>ประเภทสินค้า</center></th>
                                                            <th width="10%" align="center" scope="col"><center>Seq No.</center></th>
                                                            <%--<th width="5%"></th> --%>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="pic" items="${picProductList}" varStatus="counter">
                                                            <tr>
                                                                <td align="center">
                                                                    <center>${pic.picCode}</center>
                                                                </td>
                                                                <td align="center" >
                                                                    <center>${pic.picProductSetupDetailEntity.productDetailMasterEntity.productCode}</center>
                                                                </td>
                                                                <td align="center" >
                                                                    ${pic.picProductSetupDetailEntity.productDetailMasterEntity.productDNameT}
                                                                </td>
                                                                <td align="center" >
                                                                    <center>${pic.picNameT}</center>
                                                                </td>
                                                                 <td align="center" >
                                                                    <input name="picSeq" type="text" value="${pic.picProductSetupDetailEntity.picSeq}" style="width:100%;text-align: right;"/>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <br/><br/><br/>
                                            </center>
                                        </form>

                                    </div>
                                    <br/><br/><br/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="cleared"></div>
        </div>
        <div class="cleared"></div>
        <p class="art-page-footer"></p>
         <jsp:include page="footer.jsp" />
                    <br/><br/>
    </body>
    
</html>
