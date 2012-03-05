<%--
    Document   : color
    Created on : Jan 22, 2012, 1:44:02 PM
    Author     : Jik
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//Ddiv HTML 4.01 divansitional//EN"
    "http://www.w3.org/div/html4/loose.ddiv">
<c:if test="${param.producdivetailId!=null}">
    <sql:query var="query3" dataSource="webdb">
        SELECT pdm.*,cm.company_code,pgm.product_group_code,ccm.color_code,sm.quantity,sb.balance  FROM product_detail_master pdm
        left join company_master cm on cm.company_id = pdm.company_id
        left join product_group_master pgm on pgm.product_group_id = pdm.product_group_id
        left join color_code_master ccm on ccm.color_id = pdm.product_color_id
        left join stock_master sm on sm.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = sm.product_detail_id
        where pdm.product_detail_id =  ${param.producdivetailId}
    </sql:query>
</c:if>
<sql:query var="query1" dataSource="webdb">
    SELECT pgm.product_g_name_t as groupName,pgm.product_group_id FROM product_group_master pgm
</sql:query>
<sql:query var="query2" dataSource="webdb">
    SELECT concat(cc.color_name_t) as colorName,cc.color_id FROM color_code_master cc
</sql:query>
<sql:query var="query4" dataSource="webdb">
    SELECT * FROM unit_master u;
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style_main.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="../jshome/css/print.css" media="print" />
        <title>JSP Page</title>
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
                    <br><br><div class="wrapper">
                        <div class="page">
                        </div>
                        <div class="main-container col1-layout">
                            <div class="main">
                                <div class="col-main">
                                    <div class="account-create">
                                        <div class="page-title">
                                            <h1>ข้อมูลสินค้า</h1>
                                        </div>
                                       
                                            <form action="producdivetail.do" method="post" enctype="multipart/form-data" >
                                                <div >
                                                    <c:if test="${param.productDetailId==null}" >
                                                        <input type="hidden" name="action" value="Add" />
                                                        <ul class="form-list">
                                                        <li class="fields">
                                                        <div class="fieldset">
                                                            <div   class="field">Product Group :                                                    
                                                                <select name="productGroupId" class="select">
                                                                    <c:forEach items="${query1.rows}" var="group">
                                                                        <c:if test="${param.productGroupId != group.product_group_id}">
                                                                            <option value="${group.product_group_id}" >${group.product_g_name_t}</option>
                                                                        </c:if>
                                                                        <c:if test="${param.productGroupId == group.product_group_id}">
                                                                            <option value="${group.product_group_id}" selected>${group.product_g_name_t}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>                                                        
                                                            <div  class="field">Product Code
                                                            <input name="productCode" id="productCode" type="text" class="required" /></div>                                                                                                       
                                                            <div  class="field">Model Code
                                                            <input name="productModelCode" id="productCode" type="text" class="input-box"  /></div>                                                            
                                                        </div>
                                                            </li>
                                                            <li class="fields">
                                                        <div class="fieldset">
                                                            <div  class="field">Color                                                            
                                                                <select name="colorId"  class="select">
                                                                    <c:forEach items="${query2.rows}" var="color" >
                                                                        <option value="${color.Color_Id}">${color.colorName}</option>
                                                                    </c:forEach>
                                                                </select></div>                                                        
                                                            <div  align="right" class="field">Promotion Number
                                                            <input name="productMaxSale" type="text" class="input-box" size="10"/></div>
                                                        </div>
                                                        <div>
                                                            <div  align="right">Product Image</div>
                                                            <div  ><input type="file" name="upload" class="input-box" /></div>
                                                        </div>
                                                        <div>
                                                            <div align="right">Product Icon</div>
                                                            <div ><input name="iconLoc" type="text" size="5" class="input-box"/></div>
                                                        </div>

                                                        <div>
                                                            <div  align="right">Product Display</div>
                                                            <div >
                                                                <select name="display" class="select">
                                                                    <option value="Y">Show</option>
                                                                    <option value="N">Not Show</option>
                                                                    <option value="A">Show on Slide</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                                 <div>
                                                            <div  align="right">Quatity</div>
                                                            <div  ><input type="text" style="text-align: right" value="0" class="input-box"  name="qtyplus" size="5"/><input type="hidden" value="0" name="qtyminus" />
                                                                <select name="unitId" class="select">
                                                                    <c:forEach  items="${query4.rows}" var="unit">
                                                                        <option value="${unit.unit_id}">${unit.unit_name_t}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div  align="right">Price 1</div>
                                                            <div ><input name="price1" type="text" size="10" class="input-box"/> Baht (ราคาขายส่ง)</div>
                                                        </div>
                                                        <div>
                                                            <div align="right">Price 2</div>
                                                            <div ><input name="price2" type="text" size="10" class="input-box"/> Baht (ราคาขายส่ง Promotion)</div>
                                                        </div>
                                                        <div>
                                                            <div align="right">Price 3</div>
                                                            <div ><input name="price3" type="text" size="10" class="input-box" /> Baht (ราคาขายปลีก)</div>
                                                        </div>
                                                        <div>
                                                            <div align="right">Price 4</div>
                                                            <div ><input name="price4" type="text" size="10" class="input-box"/> Baht (ราคาขายปลีก Promotion)</div>
                                                        </div>
                                                       
                                                       

                                                        <div>
                                                            <div colspan="4">
                                                                <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                                                    <div>
                                                                        <div  align="center" bgcolor="blue">  Thai</div>
                                                                        <div  align="center" bgcolor="yellow">  English</div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Product Name </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><input name="nameTh" type="text" size="23"/></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Name </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><input name="nameEn" type="text" size="23"/></div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 1 </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect1Th" cols="25" rows="2"></textarea></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 1 </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect1En" cols="25" rows="2"></textarea></div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 2 </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect2Th" cols="25" rows="2"></textarea></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 2 </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect2En" cols="25" rows="2"></textarea></div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 3 </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect3Th" cols="25" rows="2"></textarea></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 3 </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect3En" cols="25" rows="2"></textarea></div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 4 </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect4Th" cols="25" rows="2"></textarea></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;"align="right">Product Spect 4 </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect4En" cols="25" rows="2"></textarea></div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 5 </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect5Th" cols="25" rows="2"></textarea></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 5 </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect5En" cols="25" rows="2"></textarea></div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 6 </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect6Th" cols="25" rows="2"></textarea></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 6 </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect6En" cols="25" rows="2"></textarea></div>
                                                                    </div>
                                                                    <div>
                                                                        <div bgcolor="lightblue" style="border-right: none;" align="right">Remark </div>
                                                                        <div bgcolor="lightblue" style="border-left: none;"><textarea name="remarkTh" cols="25" rows="3"></textarea></div>
                                                                        <div bgcolor="lightyellow" style="border-right: none;" align="right">Remark </div>
                                                                        <div bgcolor="lightyellow" style="border-left: none;"><textarea name="remarkEn" cols="25" rows="3"></textarea></div>
                                                                    </div>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div  align="right"><input type="submit" value="Add/Edit"></div>
                                                            <div ><input type="reset" value="Reset"></div>
                                                        </div>

                                                    </c:if>
                                                    <c:if test="${param.producdivetailId!=null}" >

                                                        <c:forEach var="product" items="${query3.rows}" >
                                                            <input type="hidden" name="action" value="Edit" />
                                                            <input type="hidden" name="producdivetailId" value="${product.product_detail_id}"/>
                                                            <div>
                                                                <div  align="right" >Product Group</div>
                                                                <div >
                                                                    <select name="productGroupId">
                                                                        <c:forEach items="${query1.rows}" var="group">
                                                                            <c:if test="${group.product_Group_Id == product.product_Group_Id }" >
                                                                                <option value="${group.product_group_id}" selected>${group.product_g_name_t}</option>
                                                                            </c:if>
                                                                            <c:if test="${group.product_Group_Id != product.product_Group_Id }" >
                                                                                <option value="${group.product_group_id}" >${group.product_g_name_t}</option>
                                                                            </c:if>
                                                                        </c:forEach>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Product Code</div>
                                                                <div ><input name="productCode" class="input-text" value="${product.product_code}"/></div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Model Code</div>
                                                                <div ><input name="productModelCode" type="text" size="20" value="${product.product_model_code}"/></div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Company Code</div>
                                                                <div ><input name="companyCode" type="text" size="10"  value="${product.company_code}"/></div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Color</div>
                                                                <div >
                                                                    <select name="colorId" style="width:95px">
                                                                        <c:forEach items="${query2.rows}" var="color" >
                                                                            <c:if test="${color.color_Id == product.product_color_Id }" >
                                                                                <option value="${color.Color_Id}" selected>${color.colorName}</option>
                                                                            </c:if>
                                                                            <c:if test="${color.color_Id != product.product_color_Id }" >
                                                                                <option value="${color.Color_Id}">${color.colorName}</option>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </select></div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Promotion Number</div>
                                                                <div ><input name="productMaxSale" type="text" size="10"  value="${product.product_max_sale}"/></div>
                                                            </div>
                                                            <div>
                                                                <div  align="right">Price 1</div>
                                                                <div ><input name="price1" type="text" size="10" value="${product.product_Price1}"/> Baht (ราคาขายส่ง)</div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Price 2</div>
                                                                <div ><input name="price2" type="text" size="10" value="${product.product_Price2}"/> Baht (ราคาขายส่ง Promotion)</div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Price 3</div>
                                                                <div ><input name="price3" type="text" size="10" value="${product.product_Price3}"/> Baht (ราคาขายปลีก)</div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Price 4</div>
                                                                <div ><input name="price4" type="text" size="10" value="${product.product_Price4}"/> Baht (ราคาขายปลีก Promotion)</div>
                                                            </div>
                                                            <c:if test="${product.product_d_pic_loc!=null&&product.product_d_pic_loc!=''}" >
                                                                <div>
                                                                    <div  align="right">Product Image</div>
                                                                    <div  ><input type="text" name="uploadtmp" value="${product.product_d_pic_loc}" style="width:400px;" readonly/></div>
                                                                </div>
                                                            </c:if>
                                                            <div>
                                                                <c:if test="${product.product_d_pic_loc!=null&&product.product_d_pic_loc!=''}" >
                                                                    <div  align="right"></div>
                                                                </c:if>
                                                                <c:if test="${product.product_d_pic_loc==null||product.product_d_pic_loc==''}" >
                                                                    <div  align="right">Product Image</div>
                                                                </c:if>
                                                                <div  ><input type="file" name="upload"/></div>
                                                            </div>
                                                            <div>
                                                                <div align="right">Product Icon</div>
                                                                <div ><input name="iconLoc" type="text" size="5"/></div>
                                                            </div>

                                                            <div>
                                                                <div  align="right">Product Display</div>
                                                                <div >
                                                                    <select name="display">
                                                                        <option value="Y" <c:if test="${product.product_d_display_flag == 'Y'}"> selected</c:if> >Show</option>
                                                                        <option value="N" <c:if test="${product.product_d_display_flag == 'N'}"> selected</c:if>>Not Show</option>
                                                                        <option value="A" <c:if test="${product.product_d_display_flag == 'A'}"> selected</c:if>>Show on Slide</option>
                                                                    </select></div>
                                                            </div>

                                                            <div>
                                                                <div  align="right">Quatity</div>
                                                                <div  >
                                                                    <c:if test="${product.balance != null && product.balance != ''}">
                                                                        <input type="text" style="text-align: right" value="${product.balance}" name="qtyold" size="5" disabled/>
                                                                    </c:if>
                                                                    <c:if test="${product.balance == null || product.balance == ''}">
                                                                        <input type="text" style="text-align: right" value="0" name="qtyold" size="5" disabled/>
                                                                    </c:if>
                                                                    <select name="unitId">
                                                                        <c:forEach  items="${query4.rows}" var="unit">
                                                                            <option value="${unit.unit_id}">${unit.unit_name_t}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                        &nbsp;&nbsp;&nbsp; เพิ่ม <input type="text" name="qtyplus" value="0" size="5"/>
                                                                        &nbsp;&nbsp;&nbsp; ลด <input type="text" name="qtyminus" value="0" size="5"/>
                                                                </div>
                                                                
                                                            </div>
                                                        
                                                                    </ul>
                                                            <div>
                                                                <div colspan="4">
                                                                    <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                                                        <div>
                                                                            <div  align="center" bgcolor="blue">  Thai</div>
                                                                            <div  align="center" bgcolor="yellow">  English</div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Product Name </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><input name="nameTh" type="text" size="23" value="${product.product_d_name_t}"/></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Name </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><input name="nameEn" type="text" size="23" value="${product.product_d_name_e}"/></div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 1 </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect1Th" cols="25" rows="2" >${product.product_spec1_t}</textarea></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 1 </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect1En" cols="25" rows="2">${product.product_spec1_e}</textarea></div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 2 </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect2Th" cols="25" rows="2">${product.product_spec2_t}</textarea></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 2 </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect2En" cols="25" rows="2">${product.product_spec2_e}</textarea></div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 3 </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect3Th" cols="25" rows="2">${product.product_spec3_t}</textarea></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 3 </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect3En" cols="25" rows="2">${product.product_spec3_e}</textarea></div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 4 </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect4Th" cols="25" rows="2">${product.product_spec4_t}</textarea></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;"align="right">Product Spect 4 </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect4En" cols="25" rows="2">${product.product_spec4_e}</textarea></div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 5 </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect5Th" cols="25" rows="2">${product.product_spec5_t}</textarea></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 5 </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect5En" cols="25" rows="2">${product.product_spec5_e}</textarea></div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Product Spect 6 </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><textarea name="spect6Th" cols="25" rows="2">${product.product_spec6_t}</textarea></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;" align="right">Product Spect 6 </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><textarea name="spect6En" cols="25" rows="2">${product.product_spec6_e}</textarea></div>
                                                                        </div>
                                                                        <div>
                                                                            <div bgcolor="lightblue" style="border-right: none;" align="right">Remark </div>
                                                                            <div bgcolor="lightblue" style="border-left: none;"><textarea name="remarkTh" cols="25" rows="3">${product.product_d_remark_t}</textarea></div>
                                                                            <div bgcolor="lightyellow" style="border-right: none;" align="right">Remark </div>
                                                                            <div bgcolor="lightyellow" style="border-left: none;"><textarea name="remarkEn" cols="25" rows="3">${product.product_d_remark_e}</textarea></div>
                                                                        </div>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div  align="right"><input type="submit" value="Add/Edit"  ></div>
                                                                <div ><input type="reset" value="Reset"></div>
                                                            </div>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
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
