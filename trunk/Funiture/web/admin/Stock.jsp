<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<c:url var="url" value="/" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <link rel="stylesheet" type="text/css" href="../jshome/ui/jquery-ui-1.8.16.custom.js">
        <link rel="stylesheet" type="text/css" media="screen" href="../css/jquery.ui.datepicker.css" />
        <script type="text/javascript" src="../js/jquery.ui.datepicker.min.js" ></script>

        <script type="text/javascript" src="${url}js/jquery-autocomplete/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="${url}js/jquery-autocomplete/lib/jquery.bgiframe.min.js"></script>
        <script type="text/javascript" src="${url}js/jquery-autocomplete/lib/jquery.ajaxQueue.js"></script>
        <script type="text/javascript" src="${url}js/jquery-autocomplete/lib/thickbox-compressed.js"></script>
        <link rel="stylesheet" href="${url}js/jquery-autocomplete/lib/thickbox.css" />
        <link rel="stylesheet" href="${url}js/jquery-autocomplete/jquery.autocomplete.css"/>
        <script type="text/javascript">
           $(document).ready(function() {
	  var jQueryDatePicker1Opts = {
		dateFormat : 'dd/mm/yy',
		changeMonth : true,
		changeYear : true,
		showButtonPanel : false,
		showAnim : 'show'
	};
	$("#startDate").datepicker(jQueryDatePicker1Opts);
        });
        $(document).ready(function(){
    var myData = ${jsonList};
    $("#productCodeSearch").autocomplete(myData, {
        minChars: 0,
        //max: 12,
        autoFill: true,
        mustMatch: true,
        matchContains: false,
        scrollHeight: 220,
        formatItem: function(item) { return item.code; }
    })

    .result(function(event, item) {
        $("#productNameTSearch").text(""+item.name);
    });

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
                                            <h1>ข้อมูลประเภทสินค้า</h1></div>
                                        <div class="buttons" align="right">
                                            <form action="Stock.jsp" >
                                                <button name="action" value="Add" class="button"><span><span>บันทึก</span></span></button>
                                            </form>

                                            <form action="stockMaster.jsp" >
                                                <input type="hidden" name="stockId" value="${param.stockId}" />
                                                <button name="action" value="Seart" class="button"><span><span>ค้นหา</span></span></button>
                                            </form>


                                        </div>
                                        <form action="stockMaster.do" method="post" enctype="multipart/form-data" >

                                            <c:if test="${param.productDetailId==null}" >
                                                <input type="hidden" name="action" value="Add" />
                                                <div class="fieldset">
                                                    <h2 class="legend">ตั้งค่า</h2>
                                                    <ul class="form-list">
                                                        <li >
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" >วันที่นำเข้า</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="startDate" name="startDate" value="" title="startDate"class="startDate"   />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li >
                                                            <div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="firstname" >รหัสสินค้า</label>
                                                                    <div  class="input-box">
			    <input type="text" id="productCodeSearch" name="productCode"  validate="" />
			    <span id="productNameTSearch"></span></div>
                                                                    

                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li >
                                                            <div class="field name-lastname">
                                                                <label for="lastname" >จำนวน</label>
                                                                <div class="input-box">
                                                                    <input type="text" id="quantity" name="quantity" value="" title="Last Name" class="quantity" />
                                                                </div>
                                                            </div>


                                                        </li>
                                                        <li >
                                                            <div class="field name-lastname">
                                                                <label for="lastname" >หน่วย</label>
                                                                <select name="unitId" class="select">
                                                                    <c:forEach  items="${query4.rows}" var="unit">
                                                                        <option value="${unit.unit_id}">${unit.unit_name_t}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>


                                                        </li>
                                                    </ul>
                                                    <br/>
                                                </div>

                                            </c:if>
                                        </form>
                                    </div>
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

    </body>
</html>
