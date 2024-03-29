<%--
    Document   : jshome_CategoryProduct
    Created on : 8 ส.ค. 2555, 10:36
    Author     : Sarawut
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${param.menuType =='picId'}" >

    <sql:query var="query2" dataSource="webdb">
        SELECT count(*) as count FROM(SELECT pps.pic_id,ppsd.pic_detail_id ,ppsd.Product_Detail_Id from pic_product_setup_detail ppsd left join pic_product_setup pps on pps.Pic_Id = ppsd.pic_id )pps
        join menu_detail_master md on pps.pic_id = md.Pic_id
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        where md.Pic_id = '${param.menuId}' and pdm.product_d_display_flag = 'Y'
        Group by pps.pic_id
    </sql:query>

    <sql:query var="query3" dataSource="webdb">
        SELECT
        pps.company_id,pps.pic_id,pps.product_detail_id,md.menu_group_id,
        md.pic_id,md.menu_code_id,pdm.product_group_id,pdm.product_code,
        pdm.product_price1,pdm.product_price2,pdm.product_price3,pdm.product_price4,pdm.product_d_pic_loc,sb.balance,
        um.unit_name_t,pdm.product_d_name_t,pps.pic_name_t,md.menu_c_name_t,
        cm.show_stock_balance_flag,cm.show_price_list_flag,cm.show_order_flag
        FROM (SELECT pps.pic_id,ppsd.pic_detail_id ,ppsd.Product_Detail_Id ,pps.Company_Id,pps.Pic_Name_T from pic_product_setup_detail ppsd left join pic_product_setup pps on pps.Pic_Id = ppsd.pic_id) pps
        join menu_detail_master md on pps.pic_id = md.pic_id
        join product_detail_master pdm on pps.product_detail_id = pdm.product_detail_id
        left join stock_balance sb on sb.product_detail_id = pps.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        join company_master cm on cm.company_id = pps.company_id
        where pps.pic_id = '${param.menuId}' and pdm.product_d_display_flag = 'Y'
        Group by pps.product_detail_id
        limit ${(param.page-1)*param.show},${param.show}
    </sql:query>

    <sql:query var="query4" dataSource="webdb" >
        select concat(menu_c_name_t) as name from menu_detail_master
        where pic_id = '${param.menuId}'
    </sql:query>

</c:if>

<c:if test="${param.menuType == 'group'}" >

    <sql:query var="query2" dataSource="webdb">
        SELECT count(*) as count FROM (select * from product_group_master pgm group by pgm.product_group_id) pgm
        join product_detail_master pdm on pgm.product_group_id = pdm.product_group_id
        left join stock_balance sb on sb.product_detail_id = pdm.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        where pdm.product_group_id = '${param.menuId}' and pdm.product_d_display_flag = 'Y'
    </sql:query>

    <sql:query var="query3" dataSource="webdb">
        SELECT
        pdm.product_detail_id,pdm.product_group_id,pdm.product_code,
        pdm.product_price1,pdm.product_price2,pdm.product_price3,pdm.product_price4,pdm.product_d_pic_loc,sb.balance,
        um.unit_name_t,pdm.product_d_name_t,
        cm.show_stock_balance_flag,cm.show_price_list_flag,cm.show_order_flag
        FROM (select * from product_group_master pgm group by pgm.product_group_id) pgm
        join product_detail_master pdm on pgm.product_group_id = pdm.product_group_id
        left join stock_balance sb on sb.product_detail_id = pdm.product_detail_id
        left join unit_master um on um.unit_id = sb.unit_id
        join company_master cm on cm.company_id = pgm.company_id
        where pdm.product_group_id = '${param.menuId}' and pdm.product_d_display_flag = 'Y'
        Group by pdm.product_detail_id
        limit ${(param.page-1)*param.show},${param.show}
    </sql:query>

    <sql:query var="query4" dataSource="webdb" >
        select concat(product_g_name_t) as name from  product_group_master pgm
        where pgm.product_group_id  = '${param.menuId}'
    </sql:query>

</c:if>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jshome</title>
    </head>

    <body >
        <div class="col-main">
            <div class="page-title category-title">
                <h1><c:forEach items="${query4.rows}" var="head">${head.name}</c:forEach></h1>
            </div>
            <c:forEach items="${query2.rows}" var="recordNum" >
                <c:set var="total" value="${recordNum.count}" />
            </c:forEach>
            <div class="category-products">
                <div class="toolbar" id="pageNav">
                    <div class="pager"><p class="amount">
                            สินค้า ${((param.page-1)*param.show)+1} ถึง
                            <c:if test="${param.page == (total/param.show) }">${total}</c:if>
                            <c:if test="${param.page != (total/param.show) }">${param.page*param.show}</c:if>
                        </p>
                        <div class="limiter">
                            <c:if test="${param.page != 1}" >
                                <a  href="#" title="Backward" style="text-decoration: none;"  onclick="setProduct(document.getElementById('menuId').value,${param.show},'1',document.getElementById('menuType').value)">
                                    <img src="images/icon/hide-left-icon.png" width="18" height="18" alt="next"/>
                                </a>
                                <a  href="#" title="back"  style="text-decoration: none" onclick="setProduct(document.getElementById('menuId').value,${param.show},${param.page-1},document.getElementById('menuType').value)">
                                    <img src="images/icon/navigate-left-icon.png" width="18" height="18" alt="back" />
                                </a>
                            </c:if>
                            <c:if test="${param.page == 1}" >
                                <img src="images/icon/hide-left-icon.png" width="18" height="18" alt="next"/>
                                <img src="images/icon/navigate-left-icon.png" width="18" height="18" alt="back" />
                            </c:if>

                            <c:forEach begin="1" step="1" end="${param.page-1}" var="count">
                                <c:if test="${count >= (param.page-3)}">
                                    <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuId').value,${param.show},${count},document.getElementById('menuType').value)">${count}</a>
                                </c:if>
                            </c:forEach>
                            <a style="padding:3px 5px;border:1px solid #000; color:#000; background-color:#fff;" onclick="setProduct(document.getElementById('menuId').value,${param.show},${param.page},document.getElementById('menuType').value)">${param.page}</a>
                            <c:forEach begin="${param.page+1}" step="1" end="${((total/param.show)+(1-((total/param.show)%1))%1)}" var="count2">
                                <c:if test="${count2 <= (param.page+3)}">
                                    <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuId').value,${param.show},${count2},document.getElementById('menuType').value)">${count2}</a>
                                </c:if>
                            </c:forEach>

                            <c:if test="${param.page < ((total/param.show)+(1-((total/param.show)%1))%1) }">
                                <a  href="#" title="Next" onclick="setProduct(document.getElementById('menuId').value,${param.show},${param.page+1},document.getElementById('menuType').value)" style="text-decoration: none">
                                    <img src="images/icon/navigate-right-icon.png" width="15" height="15" alt="next"/>
                                </a>
                                <a  href="#" title="forward" onclick="setProduct(document.getElementById('menuId').value,${param.show},<fmt:formatNumber value="${(total/param.show)+(1-((total/param.show)%1))%1}" type="number" pattern="#"/>,document.getElementById('menuType').value)" style="text-decoration: none">
                                    <img src="images/icon/hide-right-icon.png" width="15" height="15" alt="forward"/>
                                </a>
                            </c:if>
                            <c:if test="${param.page >= ((total/param.show)+(1-((total/param.show)%1))%1) }">
                                <img src="images/icon/navigate-right-icon.png" width="15" height="15" alt="next"/>
                                <img src="images/icon/hide-right-icon.png" width="15" height="15" alt="forward"/>
                            </c:if>
                            <input type="text" id="pageNum" style="width:25px"/> <a href="#"style="text-decoration: none" onclick="setProduct(document.getElementById('menuId').value,${param.show},document.getElementById('pageNum').value,document.getElementById('menuType').value)" > ค้นหา! </a>
                        </div>
                    </div>
                    <div class="sorter">
                       <!-- <div class="sort-by" style="display: inline-block">
                            <label>เรียงลำดับจาก</label>
                            <select id="sortBy">
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=name" selected="selected">
                                    ชื่อ                </option>
                                <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=price">
                                    ราคา                </option>
                            </select>
                        </div>-->
                        <div style="display: inline-block">
                            <label>จำนวนที่แสดง</label>
                            <select onchange="setProduct(document.getElementById('menuId').value,this.value,1,document.getElementById('menuType').value,document.getElementById('menuType').value);">
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
                                </c:if>
                                <c:if test="${(counter.count mod 3) == 2}">
                                <li class="item">
                                </c:if>
                                <c:if test="${(counter.count mod 3) == 0}">
                                <li class="item last">
                                </c:if>
                                <a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}" class="product-image"><img src="${product.product_d_pic_loc}" width="150" height="90" alt="${product.product_d_name_t}" /></a>
                                <h2 class="product-name"><a href="productDetail.jsp?productDetailId=${product.product_detail_id}" title="${product.product_d_name_t}">${product.product_d_name_t}</a></h2>
                                <div class="price-box">
                                    <c:if test="${product.show_price_list_flag!='N'}">
                                        <span class="regular-price" id="product-price-156">
                                            <c:if test="${product.show_price_list_flag =='W'}">
                                                <c:if test="${product.product_price1 != null && product.product_price2 <= 0}">
                                                    <span class="price"  >  <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></span>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 > 0}">
                                                    <span class="price"  > <s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  >  <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span>
                                                </c:if>
                                                <c:if test="${product.product_price2 == null}">
                                                    <span class="price"  >  <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></span>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${product.show_price_list_flag =='R'}">
                                                <c:if test="${product.product_price3 != null && product.product_price4 <= 0}">
                                                    <span class="price"  >  <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                </c:if>
                                                <c:if test="${product.product_price3 != null && product.product_price4 > 0}">
                                                    <span class="price"  > <s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  >  <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                </c:if>
                                                <c:if test="${product.product_price4 == null}">
                                                    <span class="price"  >  <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></span>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${product.show_price_list_flag =='A'}">
                                                <c:if test="${product.product_price1 == null && product.product_price2 == null
                                                              && product.product_price3 == null && product.product_price4 == null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                </c:if>
                                                <c:if test="${product.product_price1 == null && product.product_price2 == null
                                                              && product.product_price3 == null && product.product_price4 != null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <c:if test="${product.product_price4 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${product.product_price1 == null && product.product_price2 == null
                                                              && product.product_price3 != null && product.product_price4 == null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>--%>
                                                    <c:if test="${product.product_price3 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                </c:if>
                                                <c:if test="${product.product_price1 == null && product.product_price2 == null
                                                              && product.product_price3 != null && product.product_price4 != null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>--%>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                    </c:if>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 <= 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${product.product_price1 == null && product.product_price2 != null
                                                              && product.product_price3 == null && product.product_price4 == null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <c:if test="${product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                </c:if>
                                                <c:if test="${product.product_price1 == null && product.product_price2 != null
                                                              && product.product_price3 == null && product.product_price4 != null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <c:if test="${product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <c:if test="${product.product_price4 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${product.product_price1 == null && product.product_price2 != null
                                                              && product.product_price3 != null && product.product_price4 == null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <c:if test="${product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <c:if test="${product.product_price3 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                </c:if>
                                                <c:if test="${product.product_price1 == null && product.product_price2 != null
                                                              && product.product_price3 != null && product.product_price4 != null}">
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <c:if test="${product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                    </c:if>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 <= 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 == null
                                                              && product.product_price3 == null && product.product_price4 == null}">
                                                    <c:if test="${product.product_price1 > 0}">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                      <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                      <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 == null
                                                              && product.product_price3 == null && product.product_price4 != null}">
                                                    <c:if test="${product.product_price1 > 0}">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                      <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <c:if test="${product.product_price4 > 0}">
                                                        <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 == null
                                                              && product.product_price3 != null && product.product_price4 == null}">
                                                    <c:if test="${product.product_price1 > 0}">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s> --%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>--%>
                                                    <c:if test="${product.product_price3 > 0}">
                                                        <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--/s>--%></span><br/>
                                                        <%--<span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 == null
                                                              && product.product_price3 != null && product.product_price4 != null}">
                                                    <c:if test="${product.product_price1 > 0}">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>--%>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                    </c:if>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 <= 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 != null
                                                              && product.product_price3 == null && product.product_price4 == null}">
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 <= 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                    <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 != null
                                                              && product.product_price3 == null && product.product_price4 != null}">
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 <= 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <%--<span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>--%>
                                                    <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 != null
                                                              && product.product_price3 != null && product.product_price4 == null}">
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 <= 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    <%--<span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>--%>
                                                </c:if>
                                                <c:if test="${product.product_price1 != null && product.product_price2 != null
                                                              && product.product_price3 != null && product.product_price4 != null}">
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 > 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<s> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายส่ง : ฿ <fmt:formatNumber value="${product.product_price2}" type="number"  pattern="###,###,##0.00"/></span><br/>
                                                    </c:if>
                                                    <c:if test="${product.product_price1 > 0 && product.product_price2 <= 0 }">
                                                        <span class="price"  > ราคาขายส่ง : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price1}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 > 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<s> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/></s></span><br/>
                                                        <span class="price"  > ราคาขายปลีก : ฿ <fmt:formatNumber value="${product.product_price4}" type="number"  pattern="###,###,##0.00"/></span>
                                                    </c:if>
                                                    <c:if test="${product.product_price3 > 0 && product.product_price4 <= 0 }">
                                                        <span class="price"  > ราคาขายปลีก : ฿<%--<s>--%> <fmt:formatNumber value="${product.product_price3}" type="number"  pattern="###,###,##0.00"/><%--</s>--%></span><br/>
                                                    </c:if>
                                                </c:if>
                                            </c:if>
                                        </span>
                                    </c:if>
                                    <c:if test="${product.show_stock_balance_flag=='Y'}">
                                        <div style="color:#000000">จำนวน <c:if test="${product.balance ==null }">0</c:if>
                                            <c:if test="${product.balance !=null }">${product.balance}</c:if>
                                            <c:if test="${product.unit_name_t !=null }">${product.unit_name_t}</c:if>
                                        </div>
                                    </c:if>
                                </div>
                                <c:if test="${product.show_order_flag=='Y'}">
                                    <div class="actions">
                                        <button type="button" title="เพิ่ม" class="button btn-cart" onclick="location.href='productDetail.jsp?productDetailId=${product.product_detail_id}'"><span><span>เพิ่มไปยังตะกร้า</span></span></button>
                                    </div>
                                </c:if>
                            </li>
                            <c:if test="${(counter.count mod 3) == 0}">
                            </ul>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="toolbar-bottom">
                    <div class="toolbar" id="pageNav">
                        <div class="pager"><p class="amount">
                                สินค้า ${((param.page-1)*param.show)+1} ถึง
                                <c:if test="${param.page == (total/param.show) }">${total}</c:if>
                                <c:if test="${param.page != (total/param.show) }">${param.page*param.show}</c:if>
                            </p>
                            <div class="limiter">
                                <c:if test="${param.page != 1}" >
                                    <a  href="#" title="Backward" style="text-decoration: none" onclick="setProduct(document.getElementById('menuId').value,${param.show},'1',document.getElementById('menuType').value)">
                                        <img src="images/icon/hide-left-icon.png" width="15" height="15" alt="next"/>
                                    </a>
                                    <a  href="#" title="back"  style="text-decoration: none" onclick="setProduct(document.getElementById('menuId').value,${param.show},${param.page-1},document.getElementById('menuType').value)">
                                        <img src="images/icon/navigate-left-icon.png" width="15" height="15" alt="back" />
                                    </a>
                                </c:if>
                                <c:if test="${param.page == 1}" >
                                    <img src="images/icon/hide-left-icon.png" width="15" height="15" alt="next"/>
                                    <img src="images/icon/navigate-left-icon.png" width="15" height="15" alt="back" />
                                </c:if>

                                <c:forEach begin="1" step="1" end="${param.page-1}" var="count">
                                    <c:if test="${count >= (param.page-3)}">
                                        <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuId').value,${param.show},${count},document.getElementById('menuType').value)">${count}</a>
                                    </c:if>
                                </c:forEach>
                                <a style="padding:3px 5px;border:1px solid #000; color:#000; background-color:#fff;" onclick="setProduct(document.getElementById('menuId').value,${param.show},${param.page},document.getElementById('menuType').value)">${param.page}</a>
                                <c:forEach begin="${param.page+1}" step="1" end="${((total/param.show)+(1-((total/param.show)%1))%1)}" var="count2">
                                    <c:if test="${count2 <= (param.page+3)}">
                                        <a href="#" style="padding:3px 5px; color:#fff; background-color:#44b0dd; text-decoration:none;" onclick="setProduct(document.getElementById('menuId').value,${param.show},${count2},document.getElementById('menuType').value)">${count2}</a>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${param.page < ((total/param.show)+(1-((total/param.show)%1))%1) }">
                                    <a  href="#" title="Next" onclick="setProduct(document.getElementById('menuId').value,${param.show},${param.page+1},document.getElementById('menuType').value)" style="text-decoration: none">
                                        <img src="images/icon/navigate-right-icon.png" width="15" height="15" alt="next"/>
                                    </a>
                                    <a  href="#" title="forward" onclick="setProduct(document.getElementById('menuId').value,${param.show},<fmt:formatNumber value="${(total/param.show)+(1-((total/param.show)%1))%1}" type="number" pattern="#"/>,document.getElementById('menuType').value)" style="text-decoration: none">
                                        <img src="images/icon/hide-right-icon.png" width="15" height="15" alt="forward"/>
                                    </a>
                                </c:if>
                                <c:if test="${param.page >= ((total/param.show)+(1-((total/param.show)%1))%1) }">
                                    <img src="images/icon/navigate-right-icon.png" width="15" height="15" alt="next"/>
                                    <img src="images/icon/hide-right-icon.png" width="15" height="15" alt="forward"/>
                                </c:if>
                                <input type="text" id="pageNum2" style="width:25px"/> <a href="#"style="text-decoration: none" onclick="setProduct(document.getElementById('menuId').value,${param.show},document.getElementById('pageNum2').value,document.getElementById('menuType').value)" > Go! </a>
                            </div>
                        </div>
                        <div class="sorter">
                           <!-- <div class="sort-by" style="display: inline-block">
                                <label>เรียงลำดับจาก</label>
                                <select id="sortBy">
                                    <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=name" selected="selected">
                                        ชื่อ                </option>
                                    <option value="http://freedemo.templates-master.com/f002/electronics/computers.html?dir=asc&amp;order=price">
                                        ราคา                </option>
                                </select>
                            </div>-->
                            <div style="display: inline-block">
                                <label>จำนวนที่แสดง</label>
                                <select onchange="setProduct(document.getElementById('menuId').value,this.value,1,document.getElementById('menuType').value,document.getElementById('menuType').value);">
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
                </div>
            </div>
        </div>
    </body>

</html>
