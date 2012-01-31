<%-- 
    Document   : categoryProduct
    Created on : 7 ธ.ค. 2554, 10:10:05
    Author     : Achilles
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.menuCode == 'all'}">
    <sql:query var="query" dataSource="webdb">
        SELECT 
        pps.company_id,pps.pic_code,pps.product_detail_id,md.menu_group_id,
        md.pic_code,md.menu_code_id,pdm.product_group_id,pdm.product_code,
        pdm.product_price1,pdm.product_d_pic_loc,sb.balance,
        um.unit_name_t,pdm.product_d_name_t,pps.pic_name_t,md.menu_c_name_t
        FROM (select * from pic_product_setup pps group by pps.product_detail_id) pps
        join menu_detail_master md on pps.pic_code = md.pic_code
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
    </sql:query>    
    <sql:query var="query2" dataSource="webdb">
        SELECT count(*) as count FROM (select * from pic_product_setup pps group by pps.product_detail_id) pps
        join menu_detail_master md on pps.pic_code = md.pic_code
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
    </sql:query>
    <sql:query var="query3" dataSource="webdb">
        SELECT
        pps.company_id,pps.pic_code,pps.product_detail_id,md.menu_group_id,
        md.pic_code,md.menu_code_id,pdm.product_group_id,pdm.product_code,
        pdm.product_price1,pdm.product_d_pic_loc,sb.balance,
        um.unit_name_t,pdm.product_d_name_t,pps.pic_name_t,md.menu_c_name_t
        FROM (select * from pic_product_setup pps group by pps.product_detail_id) pps
        join menu_detail_master md on pps.pic_code = md.pic_code
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        limit ${(param.page-1)*param.show},${param.show}
    </sql:query> 
</c:if>
<c:if test="${param.menuCode != 'all'}">        
    <sql:query var="query" dataSource="webdb">
        SELECT 
        pps.company_id,pps.pic_code,pps.product_detail_id,md.menu_group_id,
        md.pic_code,md.menu_code_id,pdm.product_group_id,pdm.product_code,
        pdm.product_price1,pdm.product_d_pic_loc,sb.balance,
        um.unit_name_t,pdm.product_d_name_t,pps.pic_name_t,md.menu_c_name_t
        FROM (select * from pic_product_setup pps group by pps.pic_code,pps.product_detail_id) pps
        join menu_detail_master md on pps.pic_code = md.pic_code
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        where pps.pic_code = '${param.menuCode}'
        Group by pps.product_detail_id
    </sql:query>
    <sql:query var="query2" dataSource="webdb">
        SELECT count(*) as count FROM (select * from pic_product_setup pps group by pps.pic_code,pps.product_detail_id) pps
        join menu_detail_master md on pps.pic_code = md.pic_code
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        where pps.pic_code = '${param.menuCode}'
        Group by pps.product_detail_id
    </sql:query>
    <sql:query var="query3" dataSource="webdb">
        SELECT 
        pps.company_id,pps.pic_code,pps.product_detail_id,md.menu_group_id,
        md.pic_code,md.menu_code_id,pdm.product_group_id,pdm.product_code,
        pdm.product_price1,pdm.product_d_pic_loc,sb.balance,
        um.unit_name_t,pdm.product_d_name_t,pps.pic_name_t,md.menu_c_name_t
        FROM (select * from pic_product_setup pps group by pps.pic_code,pps.product_detail_id) pps
        join menu_detail_master md on pps.pic_code = md.pic_code
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        where pps.pic_code = '${param.menuCode}'
        Group by pps.product_detail_id
        limit ${(param.page-1)*param.show},${param.show}
    </sql:query>
</c:if>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>      
    </head>
    <body >
        <div class="col-main">
            <div class="page-title category-title">
                <h1>ราการสินค้า</h1>
            </div>


            <c:forEach items="${query2.rows}" var="recordNum" >
                <c:set var="total" value="${recordNum.count}" />
            </c:forEach>


            <div class="category-products">
                <div class="toolbar" id="pageNav">
                    <div class="pager">
                        <table border="0">
                            <tr>
                                <td width="31%">
                                    สินค้า ${((param.page-1)*param.show)+1} ถึง
                                    <c:if test="${param.page == (total/param.show) }">${total}</c:if>                 
                                    <c:if test="${param.page != (total/param.show) }">${param.page*param.show}</c:if>
                                    จาก ${total} 
                                </td>
                                <td width="7%">
                                    <c:if test="${param.page != 1}" >
                                        <a  href="#" title="Backward" style="text-decoration: none;"  onclick="setProduct(document.getElementById('menuCode').value,${param.show},'1')">
                                            <img src="images/icon/00247.png" width="15" height="15" alt="next"/>
                                        </a>
                                        <a  href="#" title="back"  style="text-decoration: none" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${param.page-1})">
                                            <img src="images/icon/00245.png" width="15" height="15" alt="back" />
                                        </a>
                                    </c:if>
                                    <c:if test="${param.page == 1}" >
                                        <img src="images/icon/00247.png" width="15" height="15" alt="next"/>
                                        <img src="images/icon/00245.png" width="15" height="15" alt="back" />    
                                    </c:if>
                                </td>
                                <td width="40%" style="text-align:center;">
                                    <%--<c:if test="${param.page-4 > 0}">
                                        ...
                                    </c:if> --%>
                                    <c:forEach begin="1" step="1" end="${param.page-1}" var="count">
                                        <c:if test="${count >= (param.page-3)}">
                                            <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${count})">${count}</a>
                                        </c:if>
                                    </c:forEach>
                                    <a style="padding:3px 5px;border:1px solid #000; color:#000; background-color:#fff;" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${param.page})">${param.page}</a>
                                    <c:forEach begin="${param.page+1}" step="1" end="${((total/param.show)+(1-((total/param.show)%1))%1)}" var="count2">                                    
                                        <c:if test="${count2 <= (param.page+3)}">
                                            <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${count2})">${count2}</a>
                                        </c:if>
                                    </c:forEach>
                                    <%--       
                                    <c:if test="${param.page+4 < (total/param.show)}">
                                        ...
                                    </c:if>  
                                    --%>
                                </td>
                                <td width="8%">
                                    <c:if test="${param.page < ((total/param.show)+(1-((total/param.show)%1))%1) }">
                                        <a  href="#" title="Next" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${param.page+1})" style="text-decoration: none">
                                            <img src="images/icon/00246.png" width="15" height="15" alt="next"/>
                                        </a>
                                        <a  href="#" title="forward" onclick="setProduct(document.getElementById('menuCode').value,${param.show},<fmt:formatNumber value="${(total/param.show)+(1-((total/param.show)%1))%1}" type="number" pattern="#"/>)" style="text-decoration: none">
                                            <img src="images/icon/00248.png" width="15" height="15" alt="forward"/>
                                        </a>
                                    </c:if>
                                    <c:if test="${param.page >= ((total/param.show)+(1-((total/param.show)%1))%1) }">                                   
                                        <img src="images/icon/00246.png" width="15" height="15" alt="next"/>                                       
                                        <img src="images/icon/00248.png" width="15" height="15" alt="forward"/>
                                    </c:if>
                                </td>
                                <td width="14%" style="text-align: right;">
                                    <input type="text" id="pageNum" style="width:25px"/> <a href="#"style="text-decoration: none" onclick="setProduct(document.getElementById('menuCode').value,${param.show},document.getElementById('pageNum').value)" > ค้นหา! </a>
                                </td>    


                            </tr>
                        </table>



                    </div>

                    <div class="sorter">
                        <div class="sort-by" style="display: inline-block">
                            <label>เรียงลำดับจาก</label>
                            <select id="sortBy">
                                
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=name" selected="selected">
                                    ชื่อ                </option>
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=price">
                                    ราคา                </option>
                            </select>

                        </div>
                        <div style="display: inline-block">
                            <label>จำนวนที่แสดง</label>
                            <select onchange="setProduct(document.getElementById('menuCode').value,this.value,1);">
                                <c:forEach begin="9" end="30" step="3" var="show">
                                    <c:if test="${show == param.show}" >
                                        <option value="${show}" selected="selected"  > ${show} </option>
                                    </c:if>
                                    <c:if test="${show != param.show}" >
                                        <option value="${show}"  > ${show} </option>
                                    </c:if>
                                </c:forEach>
                            </select> ต่อหน้า
                        </div>
                    </div>
                </div>

                <div id="productList">
                    <c:forEach  items="${query3.rows}" var="product"  varStatus="counter">
                        <c:if test="${(counter.count mod 3) == 1}">
                            <ul class="products-grid">
                                <li class="item first">
                                    <a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}" class="thickbox"><img src="${product.product_d_pic_loc}" width="135" height="135" alt="Single Image" /></a>
                                    <h2 class="product-name"><a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}">${product.product_d_name_t}</a></h2>
                                      <div class="price-box">
                                        <span class="regular-price" id="product-price-156">
                                            <span class="price">${product.product_price1}</span></span>
                                            <div style="color:#00ee00">จำนวน <c:if test="${product.balance ==null }">0</c:if>
                                                                             <c:if test="${product.balance !=null }">${product.balance}</c:if>
                                                                             <c:if test="${product.unit_name_t !=null }">${product.unit_name_t}</c:if>
                                            </div>
                                    </div>

                                    <div class="actions">
                                        <button type="button" title="เพิ่ม" class="button btn-cart" onclick="location.href='productDetail.jsp?productDetailId=${product.product_detail_id}'"><span><span>เพิ่ม</span></span></button>
                                        
                                    </div>
                                </li>

                            </c:if>
                            <c:if test="${(counter.count mod 3) == 2}">
                                <li class="item">
                                    <a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}" class="product-image"><img src="${product.product_d_pic_loc}" width="135" height="135" alt="${product.product_d_name_t}" /></a>
                                    <h2 class="product-name"><a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}">${product.product_d_name_t}</a></h2>



                                    <div class="price-box">
                                        <span class="regular-price" id="product-price-156">
                                            <span class="price">${product.product_price1}</span>
                                        <div style="color:#00ee00">จำนวน <c:if test="${product.balance ==null }">0</c:if>
                                                                             <c:if test="${product.balance !=null }">${product.balance}</c:if>
                                                                             <c:if test="${product.unit_name_t !=null }">${product.unit_name_t}</c:if>
                                            </div></span>

                                    </div>

                                    <div class="actions">
                                        <button type="button" title="เพิ่ม" class="button btn-cart" onclick="location.href='productDetail.jsp?productDetailId=${product.product_detail_id}'"><span><span>เพิ่ม</span></span></button>
                                        
                                    </div>
                                </li>

                            </c:if>
                            <c:if test="${(counter.count mod 3) == 0}">
                                <li class="item last">
                                    <a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}" class="product-image"><img src="${product.product_d_pic_loc}" width="135" height="135" alt="${product.product_d_name_t}" /></a>
                                    <h2 class="product-name"><a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}">${product.product_d_name_t}</a></h2>



                                    <div class="price-box">
                                        <span class="regular-price" id="product-price-156">
                                            <span class="price">${product.product_price1}</span>                </span>
                                            <div style="color:#00ee00">จำนวน <c:if test="${product.balance ==null }">0</c:if>
                                                                             <c:if test="${product.balance !=null }">${product.balance}</c:if>
                                                                             <c:if test="${product.unit_name_t !=null }">${product.unit_name_t}</c:if>
                                            </div>
                                    </div>

                                    <div class="actions">
                                       <button type="button" title="เพิ่ม" class="button btn-cart" onclick="location.href='productDetail.jsp?productDetailId=${product.product_detail_id}'"><span><span>เพิ่ม</span></span></button>
                                        
                                    </div>
                                </li>
                            </ul>
                        </c:if>


                    </c:forEach>




                </div>

                <div class="toolbar-bottom">
                    <div class="toolbar">

                        <div class="pager">
                            <table border="0">
                                <tr>
                                    <td width="31%">
                                        สินค้า ${((param.page-1)*param.show)+1} ถึง
                                        <c:if test="${param.page == (total/param.show) }">${total}</c:if>                 
                                        <c:if test="${param.page != (total/param.show) }">${param.page*param.show}</c:if>
                                        จาก ${total}
                                    </td>
                                    <td width="7%">
                                        <c:if test="${param.page != 1}" >
                                            <a  href="#" title="Backward" style="text-decoration: none" onclick="setProduct(document.getElementById('menuCode').value,${param.show},'1')">
                                                <img src="images/icon/00247.png" width="15" height="15" alt="next"/>
                                            </a>
                                            <a  href="#" title="back"  style="text-decoration: none" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${param.page-1})">
                                                <img src="images/icon/00245.png" width="15" height="15" alt="back" />
                                            </a>
                                        </c:if>
                                        <c:if test="${param.page == 1}" >
                                            <img src="images/icon/00247.png" width="15" height="15" alt="next"/>
                                            <img src="images/icon/00245.png" width="15" height="15" alt="back" />    
                                        </c:if>
                                    </td>
                                    <td width="40%" style="text-align:center;">
                                        <%--<c:if test="${param.page-4 > 0}">
                                            ...
                                        </c:if> --%>
                                        <c:forEach begin="1" step="1" end="${param.page-1}" var="count">
                                            <c:if test="${count >= (param.page-3)}">
                                                <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${count})">${count}</a>
                                            </c:if>
                                        </c:forEach>
                                        <a style="padding:3px 5px;border:1px solid #000; color:#000; background-color:#fff;" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${param.page})">${param.page}</a>
                                        <c:forEach begin="${param.page+1}" step="1" end="${((total/param.show)+(1-((total/param.show)%1))%1)}" var="count2">                                    
                                            <c:if test="${count2 <= (param.page+3)}">
                                                <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${count2})">${count2}</a>
                                            </c:if>
                                        </c:forEach>
                                        <%--       
                                        <c:if test="${param.page+4 < (total/param.show)}">
                                            ...
                                        </c:if>  
                                        --%>
                                    </td>
                                    <td width="8%">
                                        <c:if test="${param.page < ((total/param.show)+(1-((total/param.show)%1))%1) }">
                                            <a  href="#" title="Next" onclick="setProduct(document.getElementById('menuCode').value,${param.show},${param.page+1})" style="text-decoration: none">
                                                <img src="images/icon/00246.png" width="15" height="15" alt="next"/>
                                            </a>
                                            <a  href="#" title="forward" onclick="setProduct(document.getElementById('menuCode').value,${param.show},<fmt:formatNumber value="${(total/param.show)+(1-((total/param.show)%1))%1}" type="number" pattern="#"/>)" style="text-decoration: none">
                                                <img src="images/icon/00248.png" width="15" height="15" alt="forward"/>
                                            </a>
                                        </c:if>
                                        <c:if test="${param.page >= ((total/param.show)+(1-((total/param.show)%1))%1) }">                                   
                                            <img src="images/icon/00246.png" width="15" height="15" alt="next"/>                                       
                                            <img src="images/icon/00248.png" width="15" height="15" alt="forward"/>
                                        </c:if>
                                    </td>
                                    <td width="14%" style="text-align: right;">
                                        <input type="text" id="pageNum2" style="width:25px"/> <a href="#"style="text-decoration: none" onclick="setProduct(document.getElementById('menuCode').value,${param.show},document.getElementById('pageNum2').value)" > Go! </a>
                                    </td>    


                                </tr>
                            </table>



                        </div>

                        <div class="sorter">
                            <div class="sort-by" style="display: inline-block">
                                <label>เรียงลำดับจาก</label>
                                <select id="sortBy">
                                    
                                    <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=name" selected="selected">
                                        ชื่อ               </option>
                                    <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=price">
                                        ราคา               </option>
                                </select>

                            </div>
                            <div style="display: inline-block">
                                <label>จำนวนที่แสดง</label>
                                <select onchange="setProduct(document.getElementById('menuCode').value,this.value,1);">
                                    <c:forEach begin="9" end="30" step="3" var="show">
                                        <c:if test="${show == param.show}" >
                                            <option value="${show}" selected="selected"  > ${show} </option>
                                        </c:if>
                                        <c:if test="${show != param.show}" >
                                            <option value="${show}"  > ${show} </option>
                                        </c:if>
                                    </c:forEach>
                                </select> ต่อหน้า
                            </div>
                            <br/><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
