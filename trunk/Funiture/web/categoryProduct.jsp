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
        SELECT * FROM pic_product_setup me
        join menu_detail_master md on me.pic_code = md.pic_code
    </sql:query>    
    <sql:query var="query2" dataSource="webdb">
        SELECT count(*) as count FROM pic_product_setup me
        join menu_detail_master md on me.pic_code = md.pic_code
    </sql:query>
    <sql:query var="query3" dataSource="webdb">
        SELECT * FROM pic_product_setup mps
        join product_detail_master pdm on mps.product_code = pdm.product_code
        limit ${(param.page-1)*param.show},${param.show}
    </sql:query> 
</c:if>
<c:if test="${param.menuCode != 'all'}">        
    <sql:query var="query" dataSource="webdb">
        SELECT * FROM pic_product_setup mps
        join menu_detail_master mdm on mdm.pic_code = mps.pic_code
        where mdm.pic_code = '${param.menuCode}'
    </sql:query>
    <sql:query var="query2" dataSource="webdb">
        SELECT count(*) as count FROM pic_product_setup mps
        join menu_detail_master mdm on mdm.pic_code = mps.pic_code
        where mdm.pic_code = '${param.menuCode}'
    </sql:query>
    <sql:query var="query3" dataSource="webdb">
        SELECT * FROM pic_product_setup mps
        join product_detail_master pdm on pdm.product_code = mps.product_code
        join menu_detail_master mdm on mdm.pic_code = mps.pic_code
        where mdm.pic_code = '${param.menuCode}'
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
                <h1>Computers</h1>
            </div>


            <c:forEach items="${query2.rows}" var="recordNum" >
                <c:set var="total" value="${recordNum.count}" />
            </c:forEach>

           
            <div class="category-products">
                <div class="toolbar" id="pageNav">
                    <div class="pager">
                        <table border="0">
                            <tr>
                                <td width="34%">
                                    Items ${((param.page-1)*param.show)+1} to 
                                    <c:if test="${param.page == (total/param.show) }">${total}</c:if>                 
                                    <c:if test="${param.page != (total/param.show) }">${param.page*param.show}</c:if>
                                    of ${total} total    
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
                                <td width="7%">
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
                                <td width="12%" style="text-align: right;">
                                    <input type="text" id="pageNum" style="width:25px"/> <a href="#"style="text-decoration: none" onclick="setProduct(document.getElementById('menuCode').value,${param.show},document.getElementById('pageNum').value)" > Go! </a>
                                </td>    


                            </tr>
                        </table>



                    </div>

                    <div class="sorter">
                        <div class="sort-by" style="display: inline-block">
                            <label>Sort By</label>
                            <select id="sortBy">
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=position">
                                    Position                </option>
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=name" selected="selected">
                                    Name                </option>
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=price">
                                    Price                </option>
                            </select>

                        </div>
                        <div style="display: inline-block">
                            <label>Show</label>
                            <select onchange="setProduct(document.getElementById('menuCode').value,this.value,1);">
                                <c:forEach begin="9" end="30" step="3" var="show">
                                    <c:if test="${show == param.show}" >
                                        <option value="${show}" selected="selected"  > ${show} </option>
                                    </c:if>
                                    <c:if test="${show != param.show}" >
                                        <option value="${show}"  > ${show} </option>
                                    </c:if>
                                </c:forEach>
                            </select> per page 
                        </div>
                    </div>
                </div>

                <div id="productList">
                    <c:forEach  items="${query3.rows}" var="product"  varStatus="counter">
                        <c:if test="${(counter.count mod 3) == 1}">
                            <ul class="products-grid">
                                <li class="item first">
                                    <a href="http://freedemo.templates-master.com/f002/19-widescreen-flat-panel-lcd-monitor.html" title="19&quot; Widescreen Flat-Panel LCD Monitor" class="product-image"><img src="${product.product_d_Logo}" width="135" height="135" alt="19&quot; Widescreen Flat-Panel LCD Monitor" /></a>
                                    <h2 class="product-name"><a href="http://freedemo.templates-master.com/f002/19-widescreen-flat-panel-lcd-monitor.html" title="19&quot; Widescreen Flat-Panel LCD Monitor">${product.product_d_name_t}</a></h2>



                                    <div class="price-box">
                                        <span class="regular-price" id="product-price-156">
                                            <span class="price">${product.product_price1}</span>                </span>

                                    </div>

                                    <div class="actions">
                                        <button type="button" title="Add to Cart" class="button btn-cart" onclick="addToCart('${product.product_code}','${product.product_d_name_t}','1','plus','${product.product_group}','${product.product_price1}')"><span><span>Add to Cart</span></span></button>
                                        <ul class="add-to-links">
                                            <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/156/" class="link-wishlist">Add to Wishlist</a></li>

                                        </ul>
                                    </div>
                                </li>
                                
                            </c:if>
                            <c:if test="${(counter.count mod 3) == 2}">
                            <li class="item">
                                <a href="http://freedemo.templates-master.com/f002/19-widescreen-flat-panel-lcd-monitor.html" title="19&quot; Widescreen Flat-Panel LCD Monitor" class="product-image"><img src="${product.product_d_Logo}" width="135" height="135" alt="19&quot; Widescreen Flat-Panel LCD Monitor" /></a>
                                <h2 class="product-name"><a href="http://freedemo.templates-master.com/f002/19-widescreen-flat-panel-lcd-monitor.html" title="19&quot; Widescreen Flat-Panel LCD Monitor">${product.product_d_name_t}</a></h2>



                                <div class="price-box">
                                    <span class="regular-price" id="product-price-156">
                                        <span class="price">${product.product_price1}</span>                </span>

                                </div>

                                <div class="actions">
                                    <button type="button" title="Add to Cart" class="button btn-cart" onclick="addToCart('${product.product_code}','${product.product_d_name_t}','1','plus','${product.product_group}','${product.product_price1}')"><span><span>Add to Cart</span></span></button>
                                    <ul class="add-to-links">
                                        <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/156/" class="link-wishlist">Add to Wishlist</a></li>

                                    </ul>
                                </div>
                            </li>
                            
                        </c:if>
                        <c:if test="${(counter.count mod 3) == 0}">
                            <li class="item last">
                                <a href="http://freedemo.templates-master.com/f002/19-widescreen-flat-panel-lcd-monitor.html" title="19&quot; Widescreen Flat-Panel LCD Monitor" class="product-image"><img src="${product.product_d_Logo}" width="135" height="135" alt="19&quot; Widescreen Flat-Panel LCD Monitor" /></a>
                                <h2 class="product-name"><a href="http://freedemo.templates-master.com/f002/19-widescreen-flat-panel-lcd-monitor.html" title="19&quot; Widescreen Flat-Panel LCD Monitor">${product.product_d_name_t}</a></h2>



                                <div class="price-box">
                                    <span class="regular-price" id="product-price-156">
                                        <span class="price">${product.product_price1}</span>                </span>

                                </div>

                                <div class="actions">
                                    <button type="button" title="Add to Cart" class="button btn-cart" onclick="addToCart('${product.product_code}','${product.product_d_name_t}','1','plus','${product.product_group}','${product.product_price1}')"><span><span>Add to Cart</span></span></button>
                                    <ul class="add-to-links">
                                        <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/156/" class="link-wishlist">Add to Wishlist</a></li>

                                    </ul>
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
                                <td width="34%">
                                    Items ${((param.page-1)*param.show)+1} to 
                                    <c:if test="${param.page == (total/param.show) }">${total}</c:if>                 
                                    <c:if test="${param.page != (total/param.show) }">${param.page*param.show}</c:if>
                                    of ${total} total    
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
                                <td width="7%">
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
                                <td width="12%" style="text-align: right;">
                                    <input type="text" id="pageNum2" style="width:25px"/> <a href="#"style="text-decoration: none" onclick="setProduct(document.getElementById('menuCode').value,${param.show},document.getElementById('pageNum2').value)" > Go! </a>
                                </td>    


                            </tr>
                        </table>



                    </div>

                    <div class="sorter">
                        <div class="sort-by" style="display: inline-block">
                            <label>Sort By</label>
                            <select id="sortBy">
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=position">
                                    Position                </option>
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=name" selected="selected">
                                    Name                </option>
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=price">
                                    Price                </option>
                            </select>

                        </div>
                        <div style="display: inline-block">
                            <label>Show</label>
                            <select onchange="setProduct(document.getElementById('menuCode').value,this.value,1);">
                                <c:forEach begin="9" end="30" step="3" var="show">
                                    <c:if test="${show == param.show}" >
                                        <option value="${show}" selected="selected"  > ${show} </option>
                                    </c:if>
                                    <c:if test="${show != param.show}" >
                                        <option value="${show}"  > ${show} </option>
                                    </c:if>
                                </c:forEach>
                            </select> per page 
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
