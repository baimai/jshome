<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.productList!=null}">
    <%-- List สินค้าที่ใกล้เคียง สีต่างกัน--%>
    <sql:query var="query" dataSource="webdb">
        select * from (select * from product_detail_master pdm where pdm.product_detail_id not in (
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            ${list.productDetailId}
        </c:forEach>
        ) and pdm.product_code in (
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            '${list.productCode}'
        </c:forEach>
        )
        order by rand() limit 2) tbl1
        union all
        select * from ( select * from product_detail_master pdm where pdm.product_detail_id not in (
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            ${list.productDetailId}
        </c:forEach>
        ) and pdm.product_group_id in(
        <c:forEach var="list" items="${sessionScope.productList}" varStatus="counter">
            <c:if test="${counter.count!=1}">,</c:if>
            ${list.productGroupId}
        </c:forEach>
        )
        order by rand() limit 2) tbl2 limit 2
    </sql:query>
</c:if>

<!DOCTYPE html>
<html  >
    <title>Shopping Cart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Default Description" />
    <meta name="keywords" content="Magento, Varien, E-commerce" />
    <meta name="robots" content="*" />
    <link rel="icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />
    <!--[if lt IE 7]>
    <script type="text/javascript">
    //<![CDATA[
        var BLANK_URL = 'http://freedemo.templates-master.com/js/blank.html';
        var BLANK_IMG = 'http://freedemo.templates-master.com/js/spacer.gif';
    //]]>
    </script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="jshome/css/calendar-win2k-1.css" />
    <link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
    <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
    <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
    <link rel="stylesheet" type="text/css" href="jshome/css/print.css" media="print" />
    <script type="text/javascript" src="jshome/js/prototype/prototype.js"></script>
    <script type="text/javascript" src="jshome/js/lib/ccard.js"></script>
    <script type="text/javascript" src="jshome/js/prototype/validation.js"></script>
    <script type="text/javascript" src="jshome/js/scriptaculous/builder.js"></script>
    <script type="text/javascript" src="jshome/js/scriptaculous/effects.js"></script>
    <script type="text/javascript" src="jshome/js/scriptaculous/dragdrop.js"></script>
    <script type="text/javascript" src="jshome/js/scriptaculous/controls.js"></script>
    <script type="text/javascript" src="jshome/js/scriptaculous/slider.js"></script>
    <script type="text/javascript" src="jshome/jshome/js/varien/js.js"></script>
    <script type="text/javascript" src="jshome/js/varien/form.js"></script>
    <script type="text/javascript" src="jshome/js/varien/menu.js"></script>
    <script type="text/javascript" src="jshome/js/mage/translate.js"></script>
    <script type="text/javascript" src="jshome/js/mage/cookies.js"></script>
    <script type="text/javascript" src="jshome/js/varien/weee.js"></script>
    <script type="text/javascript">


    </script>
    <!--[if lt IE 8]>
    <link rel="stylesheet" type="text/css" href="http://freedemo.templates-master.com/skin/frontend/default/f002/css/styles-ie.css" media="all" />
    <![endif]-->
    <!--[if lt IE 7]>
    <script type="text/javascript" src="http://freedemo.templates-master.com/js/lib/ds-sleight.js"></script>
    <script type="text/javascript" src="http://freedemo.templates-master.com/skin/frontend/base/default/js/ie6.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="style_main.css" type="text/css" media="screen" />
    <script src="jqgrid4.2/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/thickbox.js"></script>
    <link rel="stylesheet" href="css/thickbox.css" type="text/css" media="screen" />

</head>

<body class=" checkout-cart-index">
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
                <jsp:include page="slide.jsp"/>
                <table border="0" cellspacing="0" cellpadding="0" width="940px">
                    <tr>
                        <td valign="top">
                            <%--หน้า cartDetail.jsp --%>
                            <div class="wrapper">
                                <div class="page">
                                </div>        <div class="main-container col1-layout">
                                    <div class="main">
                                        <div class="col-main">
                                            <div class="cart">
                                                <div class="page-title title-buttons">
                                                    <h1>ตะกร้าสินค้า</h1>
                                                    <ul class="checkout-types">
                                                        <c:if test="${sessionScope.loginDetail != null}">
                                                            <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="window.location='addOrder.do';"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                        </c:if>
                                                        <c:if test="${sessionScope.loginDetail == null}">
                                                            <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="alert('กรุณาเข้าสู่ระบบก่อน')"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                                <form action="addProduct.do" method="get">
                                                    <fieldset>
                                                        <table id="shopping-cart-table" class="data-table cart-table">
                                                            <col width="1" />
                                                            <col width="1" />
                                                            <col />
                                                            <col width="1" />
                                                            <col width="1" />
                                                            <col width="1" />

                                                            <thead>
                                                                <tr>
                                                                    <th rowspan="1" class="a-center">&nbsp;</th>
                                                                    <th rowspan="1">&nbsp;</th>
                                                                    <th rowspan="1"><span class="nobr">ชื่อสินค้า</span></th>
                                                                    <th class="a-center" colspan="1"><span class="nobr">ราคาาต่อหน่วย</span></th>
                                                                    <th rowspan="1" class="a-center">จำนวนชิ้น</th>
                                                                    <th class="a-center" colspan="1">ราคารวม</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <td colspan="50" class="a-right">
                                                                        <button type="button" title="สั่งสินค้าเพิ่มเติม" class="button btn-continue" onclick="location.href='category.jsp'"><span><span>สั่งสินค้าเพิ่มเติม</span></span></button>
                                                                        <input type="hidden" name="status" id="status" value="update" />
                                                                        <button type="submit" title="ปรับปรุงรายการสินค้า" class="button btn-update"><span><span>ปรับปรุงรายการสินค้า</span></span></button>
                                                                    </td>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                                <c:forEach var="product" items="${sessionScope.productList}">

                                                                    <tr>
                                                                        <td class="a-center"><a href="addProduct.do?productDetailId=${product.productDetailId}&status=remove" title="ลบรายการ" class="btn-remove2">ลบรายการ</a></td>
                                                                        <td><a href="http://freedemo.templates-master.com/f002/ottoman.html" title="Ottoman"><img src="${product.productPath}" width="363" height="150" alt="Ottoman" /></a></td>
                                                                        <td>
                                                                            <h2 class="product-name">
                                                                                <a href="http://freedemo.templates-master.com/f002/ottoman.html">${product.productName}</a>
                                                                            </h2>
                                                                        </td>
                                                                        <td class="a-right">
                                                                            <span class="cart-price">

                                                                                <span class="price">${product.productPrice}</span>
                                                                            </span>


                                                                        </td>
                                                                        <td class="a-center">
                                                                            <input name="amounts" id="amounts" value="${product.amount}" size="4" title="Qty" class="input-text qty" maxlength="12" />
                                                                        </td>
                                                                        <td class="a-right">
                                                                            <span class="cart-price">

                                                                                <span class="price">${product.productPrice*product.amount}</span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </fieldset>
                                                </form>
                                                <div class="cart-collaterals">
                                                    <div class="col2-set">
                                                        <div class="col-1">
                                                            <div class="crosssell">
                                                                <h2>สินค้าแนะนำ</h2>
                                                                <ul id="crosssell-products-list">
                                                                    <c:forEach var="relate" items="${query.rows}" >
                                                                        <li class="item">
                                                                            <a class="product-image" href="productDetail.jsp?productDetailId=${relate.product_detail_id}" title="${relate.product_d_name_t}"><img src="${relate.product_d_pic_loc}" width="75" height="75" alt="${relate.product_d_name_t}" /></a>
                                                                            <div class="product-details">
                                                                                <h3 class="product-name"><a href="productDetail.jsp?productDetailId=${relate.product_detail_id}">${relate.product_d_name_t}</a></h3>



                                                                                <div class="price-box">
                                                                                    <span class="regular-price" id="product-price-42">
                                                                                        <span class="price">฿ ${relate.product_price1}</span>                </span>

                                                                                </div>

                                                                                <a href="productDetail.jsp?productDetailId=${relate.product_detail_id}"><button type="button" title="เพิ่ม" class="button btn-cart" ><span><span>เพิ่ม</span></span></button></a>
                                                                                <ul class="add-to-links">
                                                                                    <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/42/" class="link-wishlist">Add to Wishlist</a></li>
                                                                                    <li><span class="separator">|</span> <a href="http://freedemo.templates-master.com/f002/catalog/product_compare/add/product/42/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvY2hlY2tvdXQvY2FydC9pbmRleC8_X19fU0lEPVU,/" class="link-compare">Add to Compare</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <form id="discount-coupon-form" action="http://freedemo.templates-master.com/f002/checkout/cart/couponPost/" method="post">
                                                                <div class="discount">
                                                                    <h2>Discount Codes</h2>
                                                                    <div class="discount-form">
                                                                        <label for="coupon_code">Enter your coupon code if you have one.</label>
                                                                        <input type="hidden" name="remove" id="remove-coupone" value="0" />
                                                                        <div class="input-box">
                                                                            <input class="input-text" id="coupon_code" name="coupon_code" value="" />
                                                                        </div>
                                                                        <div class="buttons-set">
                                                                            <button type="button" title="Apply Coupon" class="button" onclick="discountForm.submit(false)" value="Apply Coupon"><span><span>Apply Coupon</span></span></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                            <div class="shipping">
                                                                <h2>Estimate Shipping and Tax</h2>
                                                                <div class="shipping-form">
                                                                    <form action="http://freedemo.templates-master.com/f002/checkout/cart/estimatePost/" method="post" id="shipping-zip-form">
                                                                        <p>Enter your destination to get a shipping estimate.</p>
                                                                        <ul class="form-list">
                                                                            <li>
                                                                                <label for="country" class="required"><em>*</em>Country</label>
                                                                                <div class="input-box">
                                                                                    <select name="country_id" id="country" class="validate-select" title="Country" ><option value=""> </option><option value="AF">Afghanistan</option><option value="AL">Albania</option><option value="DZ">Algeria</option><option value="AS">American Samoa</option><option value="AD">Andorra</option><option value="AO">Angola</option><option value="AI">Anguilla</option><option value="AQ">Antarctica</option><option value="AG">Antigua and Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AW">Aruba</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BS">Bahamas</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BM">Bermuda</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BA">Bosnia and Herzegovina</option><option value="BW">Botswana</option><option value="BV">Bouvet Island</option><option value="BR">Brazil</option><option value="IO">British Indian Ocean Territory</option><option value="VG">British Virgin Islands</option><option value="BN">Brunei</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="KY">Cayman Islands</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN">China</option><option value="CX">Christmas Island</option><option value="CC">Cocos [Keeling] Islands</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CG">Congo - Brazzaville</option><option value="CD">Congo - Kinshasa</option><option value="CK">Cook Islands</option><option value="CR">Costa Rica</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="CI">CÃ´te d'Ivoire</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="ET">Ethiopia</option><option value="FK">Falkland Islands</option><option value="FO">Faroe Islands</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="FR">France</option><option value="GF">French Guiana</option><option value="PF">French Polynesia</option><option value="TF">French Southern Territories</option><option value="GA">Gabon</option><option value="GM">Gambia</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GI">Gibraltar</option><option value="GR">Greece</option><option value="GL">Greenland</option><option value="GD">Grenada</option><option value="GP">Guadeloupe</option><option value="GU">Guam</option><option value="GT">Guatemala</option><option value="GG">Guernsey</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HM">Heard Island and McDonald Islands</option><option value="HN">Honduras</option><option value="HK">Hong Kong SAR China</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN">India</option><option value="ID">Indonesia</option><option value="IR">Iran</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IM">Isle of Man</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JE">Jersey</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Laos</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MO">Macau SAR China</option><option value="MK">Macedonia</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MQ">Martinique</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="YT">Mayotte</option><option value="MX">Mexico</option><option value="FM">Micronesia</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="ME">Montenegro</option><option value="MS">Montserrat</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar [Burma]</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="AN">Netherlands Antilles</option><option value="NC">New Caledonia</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NU">Niue</option><option value="NF">Norfolk Island</option><option value="KP">North Korea</option><option value="MP">Northern Mariana Islands</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PW">Palau</option><option value="PS">Palestinian Territories</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PN">Pitcairn Islands</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="PR">Puerto Rico</option><option value="QA">Qatar</option><option value="RO">Romania</option><option value="RU">Russia</option><option value="RW">Rwanda</option><option value="RE">RÃ©union</option><option value="BL">Saint BarthÃ©lemy</option><option value="SH">Saint Helena</option><option value="KN">Saint Kitts and Nevis</option><option value="LC">Saint Lucia</option><option value="MF">Saint Martin</option><option value="PM">Saint Pierre and Miquelon</option><option value="VC">Saint Vincent and the Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="RS">Serbia</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="GS">South Georgia and the South Sandwich Islands</option><option value="KR">South Korea</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SJ">Svalbard and Jan Mayen</option><option value="SZ">Swaziland</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syria</option><option value="ST">SÃ£o TomÃ© and PrÃ­ncipe</option><option value="TW">Taiwan</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="TL">Timor-Leste</option><option value="TG">Togo</option><option value="TK">Tokelau</option><option value="TO">Tonga</option><option value="TT">Trinidad and Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TC">Turks and Caicos Islands</option><option value="TV">Tuvalu</option><option value="UM">U.S. Minor Outlying Islands</option><option value="VI">U.S. Virgin Islands</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom</option><option value="US" selected="selected">United States</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VA">Vatican City</option><option value="VE">Venezuela</option><option value="VN">Vietnam</option><option value="WF">Wallis and Futuna</option><option value="EH">Western Sahara</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option><option value="AX">Ãland Islands</option></select>                    </div>
                                                                            </li>
                                                                            <li>
                                                                                <label for="region_id">State/Province</label>
                                                                                <div class="input-box">
                                                                                    <select id="region_id" name="region_id" title="State/Province" style="display:none;">
                                                                                        <option value="">Please select region, state or province</option>
                                                                                    </select>
                                                                                    <input type="text" id="region" name="region" value=""  title="State/Province" class="input-text" style="display:none;" />
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <label for="postcode">Zip/Postal Code</label>
                                                                                <div class="input-box">
                                                                                    <input class="input-text validate-postcode" type="text" id="postcode" name="estimate_postcode" value="" />
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                        <div class="buttons-set">
                                                                            <button type="button" title="Get a Quote" onclick="coShippingMethodForm.submit()" class="button"><span><span>Get a Quote</span></span></button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="totals">
                                                        <c:set var="total" value="0" />
                                                        <c:forEach var="list" items="${sessionScope.productList}">
                                                            <c:set var="price" value="${list.productPrice*list.amount}" />
                                                            <c:set var="total" value="${total+price}"/>
                                                        </c:forEach>




                                                        <table id="shopping-cart-totals-table">
                                                            <col />
                                                            <col width="1" />
                                                            <tfoot>
                                                                <tr>
                                                                    <td style="" class="a-right" colspan="1">
                                                                        <strong>ราคารวมทั้งสิ้น</strong>
                                                                    </td>
                                                                    <td style="" class="a-right">
                                                                        <strong><span class="price"> ฿ <fmt:formatNumber value="${total}" type="number" pattern="###,###,##0.00" /></span></strong>
                                                                    </td>
                                                                </tr>
                                                            </tfoot>


                                                            <tbody>
                                                                <tr>
                                                                    <td style="" class="a-right" colspan="1">
                                                                        ราคารวมสินค้าทั้งหมด   </td>
                                                                    <td style="" class="a-right">
                                                                        <span class="price">฿ <fmt:formatNumber value="${total}" type="number" pattern="###,###,##0.00" /></span>    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <ul class="checkout-types">
                                                            <c:if test="${sessionScope.loginDetail != null}">
                                                                <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="window.location='addOrder.do';"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                            </c:if>
                                                            <c:if test="${sessionScope.loginDetail == null}">
                                                                <li><button type="button" title="สั่งซื้อสินค้า" class="button btn-checkout" onclick="alert('กรุณาเข้าสู่ระบบก่อน')"><span><span>สั่งซื้อสินค้า</span></span></button></li>
                                                            </c:if>
                                                            <li><a href="http://freedemo.templates-master.com/f002/checkout/multishipping/">Checkout with Multiple Addresses</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <%--จบหน้า cartDetail.jsp --%>
                        </td>

                    </tr>
                </table>

                <br/><br/>
                <jsp:include page="footer.jsp" />
                <br/><br/>
            </div>


        </div>
        <div class="cleared"></div>
    </div>

    <div class="cleared"></div>
    <p class="art-page-footer"></p>


</body>
</html>
