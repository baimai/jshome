<%--
    Document   : jshome_Cart_Detail
    Created on : 8 ส.ค. 2555, 10:36
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >

    <head>
        <title>jshome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <link rel="stylesheet" type="text/css" href="css/calendar-win2k-1.css" />
        <link rel="stylesheet" type="text/css" href="css/widgets.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />

        <script type="text/javascript" src="js/prototype/prototype.js"></script>
        <script type="text/javascript" src="js/lib/ccard.js"></script>
        <script type="text/javascript" src="js/prototype/validation.js"></script>
        <script type="text/javascript" src="js/scriptaculous/builder.js"></script>
        <script type="text/javascript" src="js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="js/scriptaculous/dragdrop.js"></script>
        <script type="text/javascript" src="js/scriptaculous/controls.js"></script>
        <script type="text/javascript" src="js/scriptaculous/slider.js"></script>
        <script type="text/javascript" src="js/varien/js.js"></script>
        <script type="text/javascript" src="js/varien/form.js"></script>
        <script type="text/javascript" src="js/varien/menu.js"></script>
        <script type="text/javascript" src="js/mage/translate.js"></script>
        <script type="text/javascript" src="js/mage/cookies.js"></script>
        <script type="text/javascript" src="js/varien/weee.js"></script>

        <script type="text/javascript">
            optionalZipCountries = [];
        </script>

        <script type="text/javascript">var Translator = new Translate({"Credit card number doesn't match credit card type":"Credit card number does not match credit card type","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Please use only letters (a-z or A-Z), numbers (0-9) or underscores (_) in this field, first character must be a letter."});</script>
    </head>

    <body class=" checkout-cart-index">
        <div class="wrapper">
            <noscript>
                <div class="noscript">
                    <div class="noscript-inner">
                        <p><strong>JavaScript seem to be disabled in your browser.</strong></p>
                        <p>You must have JavaScript enabled in your browser to utilize the functionality of this website.</p>
                    </div>
                </div>
            </noscript>
            <div class="page">
            </div>
            <div class="main-container col1-layout">
                <div class="main">
                    <div class="col-main">
                        <div class="cart">
                            <div class="page-title title-buttons">
                                <h1>Shopping Cart</h1>
                                <ul class="checkout-types">
                                    <li>    <button type="button" title="Proceed to Checkout" class="button btn-checkout" onclick="window.location='http://freedemo.templates-master.com/f002/checkout/onepage/';"><span><span>Proceed to Checkout</span></span></button>
                                    </li>
                                </ul>
                            </div>
                            <form action="http://freedemo.templates-master.com/f002/checkout/cart/updatePost/" method="post">
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
                                                <th class="a-center" colspan="1"><span class="nobr">Unit Price</span></th>
                                                <th rowspan="1" class="a-center">Qty</th>
                                                <th class="a-center" colspan="1">Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <td colspan="50" class="a-right">
                                                    <button type="button" title="Continue Shopping" class="button btn-continue" onclick="setLocation('http://freedemo.templates-master.com/f002/')"><span><span>Continue Shopping</span></span></button>
                                                    <button type="submit" title="Update Shopping Cart" class="button btn-update"><span><span>Update Shopping Cart</span></span></button>
                                                </td>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>
                                                <td class="a-center"><a href="http://freedemo.templates-master.com/f002/checkout/cart/delete/id/7959/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvY2hlY2tvdXQvY2FydC9pbmRleC8_X19fU0lEPVU,/" title="Remove item" class="btn-remove2">Remove item</a></td>
                                                <td><a href="http://freedemo.templates-master.com/f002/ottoman.html" title="Ottoman"><img src="jshome/images/thumb/smallpost_thumb2_2.jpg" width="363" height="150" alt="Ottoman" /></a></td>
                                                <td>
                                                    <h2 class="product-name">
                                                        <a href="http://freedemo.templates-master.com/f002/ottoman.html">Ottoman</a>
                                                    </h2>
                                                </td>
                                                <td class="a-right">
                                                    <span class="cart-price">

                                                        <span class="price">$299.99</span>
                                                    </span>
                                                </td>
                                                <td class="a-center">
                                                    <input name="cart[7959][qty]" value="1" size="4" title="Qty" class="input-text qty" maxlength="12" />
                                                </td>
                                                <td class="a-right">
                                                    <span class="cart-price">
                                                        <span class="price">$299.99</span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <script type="text/javascript">decorateTable('shopping-cart-table')</script>
                                </fieldset>
                            </form>
                            <div class="cart-collaterals">
                                <div class="col2-set">
                                    <div class="col-1">
                                        <div class="crosssell">
                                            <h2>Based on your selection, you may be interested in the following items:</h2>
                                            <ul id="crosssell-products-list">
                                                <li class="item">
                                                    <a class="product-image" href="http://freedemo.templates-master.com/f002/barcelona-bamboo-platform-bed.html" title="Barcelona Bamboo Platform Bed"><img src="http://freedemo.templates-master.com/media/catalog/product/cache/5/thumbnail/75x/9df78eab33525d08d6e5fb8d27136e95/b/a/barcelona-bamboo-platform-bed.jpg" width="75" height="75" alt="Barcelona Bamboo Platform Bed" /></a>
                                                    <div class="product-details">
                                                        <h3 class="product-name"><a href="http://freedemo.templates-master.com/f002/barcelona-bamboo-platform-bed.html">Barcelona Bamboo Platform Bed</a></h3>
                                                        <div class="price-box">
                                                            <span class="regular-price" id="product-price-42">
                                                                <span class="price">$2,299.00</span>                </span>
                                                        </div>
                                                        <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://freedemo.templates-master.com/f002/checkout/cart/add/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvY2hlY2tvdXQvY2FydC9pbmRleC8_X19fU0lEPVU,/product/42/in_cart/1/')"><span><span>Add to Cart</span></span></button>
                                                        <ul class="add-to-links">
                                                            <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/42/" class="link-wishlist">Add to Wishlist</a></li>
                                                            <li><span class="separator">|</span> <a href="http://freedemo.templates-master.com/f002/catalog/product_compare/add/product/42/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvY2hlY2tvdXQvY2FydC9pbmRleC8_X19fU0lEPVU,/" class="link-compare">Add to Compare</a></li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="item">
                                                    <a class="product-image" href="http://freedemo.templates-master.com/f002/akio-dresser.html" title="Akio Dresser"><img src="http://freedemo.templates-master.com/media/catalog/product/cache/5/thumbnail/75x/9df78eab33525d08d6e5fb8d27136e95/a/k/akio-dresser.jpg" width="75" height="75" alt="Akio Dresser" /></a>
                                                    <div class="product-details">
                                                        <h3 class="product-name"><a href="http://freedemo.templates-master.com/f002/akio-dresser.html">Akio Dresser</a></h3>
                                                        <div class="price-box">
                                                            <span class="regular-price" id="product-price-41">
                                                                <span class="price">$399.99</span>                </span>
                                                        </div>
                                                        <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://freedemo.templates-master.com/f002/checkout/cart/add/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvY2hlY2tvdXQvY2FydC9pbmRleC8_X19fU0lEPVU,/product/41/in_cart/1/')"><span><span>Add to Cart</span></span></button>
                                                        <ul class="add-to-links">
                                                            <li><a href="http://freedemo.templates-master.com/f002/wishlist/index/add/product/41/" class="link-wishlist">Add to Wishlist</a></li>
                                                            <li><span class="separator">|</span> <a href="http://freedemo.templates-master.com/f002/catalog/product_compare/add/product/41/uenc/aHR0cDovL2ZyZWVkZW1vLnRlbXBsYXRlcy1tYXN0ZXIuY29tL2YwMDIvY2hlY2tvdXQvY2FydC9pbmRleC8_X19fU0lEPVU,/" class="link-compare">Add to Compare</a></li>
                                                        </ul>
                                                    </div>
                                                </li>
                                            </ul>
                                            <script type="text/javascript">decorateList('crosssell-products-list', 'none-recursive')</script>
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
                                        <script type="text/javascript">
                                            var discountForm = new VarienForm('discount-coupon-form');
                                            discountForm.submit = function (isRemove) {
                                                if (isRemove) {
                                                    $('coupon_code').removeClassName('required-entry');
                                                    $('remove-coupone').value = "1";
                                                } else {
                                                    $('coupon_code').addClassName('required-entry');
                                                    $('remove-coupone').value = "0";
                                                }
                                                return VarienForm.prototype.submit.bind(discountForm)();
                                            }
                                        </script>
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
                                                                <script type="text/javascript">
                                                                    $('region_id').setAttribute('defaultValue',  "");
                                                                </script>
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

                                                <script type="text/javascript">
                                                    new RegionUpdater('country', 'region', 'region_id', {"US":{"1":{"code":"AL","name":"Alabama"},"2":{"code":"AK","name":"Alaska"},"3":{"code":"AS","name":"American Samoa"},"4":{"code":"AZ","name":"Arizona"},"5":{"code":"AR","name":"Arkansas"},"6":{"code":"AF","name":"Armed Forces Africa"},"7":{"code":"AA","name":"Armed Forces Americas"},"8":{"code":"AC","name":"Armed Forces Canada"},"9":{"code":"AE","name":"Armed Forces Europe"},"10":{"code":"AM","name":"Armed Forces Middle East"},"11":{"code":"AP","name":"Armed Forces Pacific"},"12":{"code":"CA","name":"California"},"13":{"code":"CO","name":"Colorado"},"14":{"code":"CT","name":"Connecticut"},"15":{"code":"DE","name":"Delaware"},"16":{"code":"DC","name":"District of Columbia"},"17":{"code":"FM","name":"Federated States Of Micronesia"},"18":{"code":"FL","name":"Florida"},"19":{"code":"GA","name":"Georgia"},"20":{"code":"GU","name":"Guam"},"21":{"code":"HI","name":"Hawaii"},"22":{"code":"ID","name":"Idaho"},"23":{"code":"IL","name":"Illinois"},"24":{"code":"IN","name":"Indiana"},"25":{"code":"IA","name":"Iowa"},"26":{"code":"KS","name":"Kansas"},"27":{"code":"KY","name":"Kentucky"},"28":{"code":"LA","name":"Louisiana"},"29":{"code":"ME","name":"Maine"},"30":{"code":"MH","name":"Marshall Islands"},"31":{"code":"MD","name":"Maryland"},"32":{"code":"MA","name":"Massachusetts"},"33":{"code":"MI","name":"Michigan"},"34":{"code":"MN","name":"Minnesota"},"35":{"code":"MS","name":"Mississippi"},"36":{"code":"MO","name":"Missouri"},"37":{"code":"MT","name":"Montana"},"38":{"code":"NE","name":"Nebraska"},"39":{"code":"NV","name":"Nevada"},"40":{"code":"NH","name":"New Hampshire"},"41":{"code":"NJ","name":"New Jersey"},"42":{"code":"NM","name":"New Mexico"},"43":{"code":"NY","name":"New York"},"44":{"code":"NC","name":"North Carolina"},"45":{"code":"ND","name":"North Dakota"},"46":{"code":"MP","name":"Northern Mariana Islands"},"47":{"code":"OH","name":"Ohio"},"48":{"code":"OK","name":"Oklahoma"},"49":{"code":"OR","name":"Oregon"},"50":{"code":"PW","name":"Palau"},"51":{"code":"PA","name":"Pennsylvania"},"52":{"code":"PR","name":"Puerto Rico"},"53":{"code":"RI","name":"Rhode Island"},"54":{"code":"SC","name":"South Carolina"},"55":{"code":"SD","name":"South Dakota"},"56":{"code":"TN","name":"Tennessee"},"57":{"code":"TX","name":"Texas"},"58":{"code":"UT","name":"Utah"},"59":{"code":"VT","name":"Vermont"},"60":{"code":"VI","name":"Virgin Islands"},"61":{"code":"VA","name":"Virginia"},"62":{"code":"WA","name":"Washington"},"63":{"code":"WV","name":"West Virginia"},"64":{"code":"WI","name":"Wisconsin"},"65":{"code":"WY","name":"Wyoming"}},"CA":{"66":{"code":"AB","name":"Alberta"},"67":{"code":"BC","name":"British Columbia"},"68":{"code":"MB","name":"Manitoba"},"69":{"code":"NL","name":"Newfoundland and Labrador"},"70":{"code":"NB","name":"New Brunswick"},"71":{"code":"NS","name":"Nova Scotia"},"72":{"code":"NT","name":"Northwest Territories"},"73":{"code":"NU","name":"Nunavut"},"74":{"code":"ON","name":"Ontario"},"75":{"code":"PE","name":"Prince Edward Island"},"76":{"code":"QC","name":"Quebec"},"77":{"code":"SK","name":"Saskatchewan"},"78":{"code":"YT","name":"Yukon Territory"}},"DE":{"79":{"code":"NDS","name":"Niedersachsen"},"80":{"code":"BAW","name":"Baden-W\u00fcrttemberg"},"81":{"code":"BAY","name":"Bayern"},"82":{"code":"BER","name":"Berlin"},"83":{"code":"BRG","name":"Brandenburg"},"84":{"code":"BRE","name":"Bremen"},"85":{"code":"HAM","name":"Hamburg"},"86":{"code":"HES","name":"Hessen"},"87":{"code":"MEC","name":"Mecklenburg-Vorpommern"},"88":{"code":"NRW","name":"Nordrhein-Westfalen"},"89":{"code":"RHE","name":"Rheinland-Pfalz"},"90":{"code":"SAR","name":"Saarland"},"91":{"code":"SAS","name":"Sachsen"},"92":{"code":"SAC","name":"Sachsen-Anhalt"},"93":{"code":"SCN","name":"Schleswig-Holstein"},"94":{"code":"THE","name":"Th\u00fcringen"}},"AT":{"95":{"code":"WI","name":"Wien"},"96":{"code":"NO","name":"Nieder\u00f6sterreich"},"97":{"code":"OO","name":"Ober\u00f6sterreich"},"98":{"code":"SB","name":"Salzburg"},"99":{"code":"KN","name":"K\u00e4rnten"},"100":{"code":"ST","name":"Steiermark"},"101":{"code":"TI","name":"Tirol"},"102":{"code":"BL","name":"Burgenland"},"103":{"code":"VB","name":"Voralberg"}},"CH":{"104":{"code":"AG","name":"Aargau"},"105":{"code":"AI","name":"Appenzell Innerrhoden"},"106":{"code":"AR","name":"Appenzell Ausserrhoden"},"107":{"code":"BE","name":"Bern"},"108":{"code":"BL","name":"Basel-Landschaft"},"109":{"code":"BS","name":"Basel-Stadt"},"110":{"code":"FR","name":"Freiburg"},"111":{"code":"GE","name":"Genf"},"112":{"code":"GL","name":"Glarus"},"113":{"code":"GR","name":"Graub\u00fcnden"},"114":{"code":"JU","name":"Jura"},"115":{"code":"LU","name":"Luzern"},"116":{"code":"NE","name":"Neuenburg"},"117":{"code":"NW","name":"Nidwalden"},"118":{"code":"OW","name":"Obwalden"},"119":{"code":"SG","name":"St. Gallen"},"120":{"code":"SH","name":"Schaffhausen"},"121":{"code":"SO","name":"Solothurn"},"122":{"code":"SZ","name":"Schwyz"},"123":{"code":"TG","name":"Thurgau"},"124":{"code":"TI","name":"Tessin"},"125":{"code":"UR","name":"Uri"},"126":{"code":"VD","name":"Waadt"},"127":{"code":"VS","name":"Wallis"},"128":{"code":"ZG","name":"Zug"},"129":{"code":"ZH","name":"Z\u00fcrich"}},"ES":{"130":{"code":"A Coru\u0441a","name":"A Coru\u00f1a"},"131":{"code":"Alava","name":"Alava"},"132":{"code":"Albacete","name":"Albacete"},"133":{"code":"Alicante","name":"Alicante"},"134":{"code":"Almeria","name":"Almeria"},"135":{"code":"Asturias","name":"Asturias"},"136":{"code":"Avila","name":"Avila"},"137":{"code":"Badajoz","name":"Badajoz"},"138":{"code":"Baleares","name":"Baleares"},"139":{"code":"Barcelona","name":"Barcelona"},"140":{"code":"Burgos","name":"Burgos"},"141":{"code":"Caceres","name":"Caceres"},"142":{"code":"Cadiz","name":"Cadiz"},"143":{"code":"Cantabria","name":"Cantabria"},"144":{"code":"Castellon","name":"Castellon"},"145":{"code":"Ceuta","name":"Ceuta"},"146":{"code":"Ciudad Real","name":"Ciudad Real"},"147":{"code":"Cordoba","name":"Cordoba"},"148":{"code":"Cuenca","name":"Cuenca"},"149":{"code":"Girona","name":"Girona"},"150":{"code":"Granada","name":"Granada"},"151":{"code":"Guadalajara","name":"Guadalajara"},"152":{"code":"Guipuzcoa","name":"Guipuzcoa"},"153":{"code":"Huelva","name":"Huelva"},"154":{"code":"Huesca","name":"Huesca"},"155":{"code":"Jaen","name":"Jaen"},"156":{"code":"La Rioja","name":"La Rioja"},"157":{"code":"Las Palmas","name":"Las Palmas"},"158":{"code":"Leon","name":"Leon"},"159":{"code":"Lleida","name":"Lleida"},"160":{"code":"Lugo","name":"Lugo"},"161":{"code":"Madrid","name":"Madrid"},"162":{"code":"Malaga","name":"Malaga"},"163":{"code":"Melilla","name":"Melilla"},"164":{"code":"Murcia","name":"Murcia"},"165":{"code":"Navarra","name":"Navarra"},"166":{"code":"Ourense","name":"Ourense"},"167":{"code":"Palencia","name":"Palencia"},"168":{"code":"Pontevedra","name":"Pontevedra"},"169":{"code":"Salamanca","name":"Salamanca"},"170":{"code":"Santa Cruz de Tenerife","name":"Santa Cruz de Tenerife"},"171":{"code":"Segovia","name":"Segovia"},"172":{"code":"Sevilla","name":"Sevilla"},"173":{"code":"Soria","name":"Soria"},"174":{"code":"Tarragona","name":"Tarragona"},"175":{"code":"Teruel","name":"Teruel"},"176":{"code":"Toledo","name":"Toledo"},"177":{"code":"Valencia","name":"Valencia"},"178":{"code":"Valladolid","name":"Valladolid"},"179":{"code":"Vizcaya","name":"Vizcaya"},"180":{"code":"Zamora","name":"Zamora"},"181":{"code":"Zaragoza","name":"Zaragoza"}},"FR":{"182":{"code":"01","name":"Ain"},"183":{"code":"02","name":"Aisne"},"184":{"code":"03","name":"Allier"},"185":{"code":"04","name":"Alpes-de-Haute-Provence"},"186":{"code":"05","name":"Hautes-Alpes"},"187":{"code":"06","name":"Alpes-Maritimes"},"188":{"code":"07","name":"Ard\u00e8che"},"189":{"code":"08","name":"Ardennes"},"190":{"code":"09","name":"Ari\u00e8ge"},"191":{"code":"10","name":"Aube"},"192":{"code":"11","name":"Aude"},"193":{"code":"12","name":"Aveyron"},"194":{"code":"13","name":"Bouches-du-Rh\u00f4ne"},"195":{"code":"14","name":"Calvados"},"196":{"code":"15","name":"Cantal"},"197":{"code":"16","name":"Charente"},"198":{"code":"17","name":"Charente-Maritime"},"199":{"code":"18","name":"Cher"},"200":{"code":"19","name":"Corr\u00e8ze"},"201":{"code":"2A","name":"Corse-du-Sud"},"202":{"code":"2B","name":"Haute-Corse"},"203":{"code":"21","name":"C\u00f4te-d'Or"},"204":{"code":"22","name":"C\u00f4tes-d'Armor"},"205":{"code":"23","name":"Creuse"},"206":{"code":"24","name":"Dordogne"},"207":{"code":"25","name":"Doubs"},"208":{"code":"26","name":"Dr\u00f4me"},"209":{"code":"27","name":"Eure"},"210":{"code":"28","name":"Eure-et-Loir"},"211":{"code":"29","name":"Finist\u00e8re"},"212":{"code":"30","name":"Gard"},"213":{"code":"31","name":"Haute-Garonne"},"214":{"code":"32","name":"Gers"},"215":{"code":"33","name":"Gironde"},"216":{"code":"34","name":"H\u00e9rault"},"217":{"code":"35","name":"Ille-et-Vilaine"},"218":{"code":"36","name":"Indre"},"219":{"code":"37","name":"Indre-et-Loire"},"220":{"code":"38","name":"Is\u00e8re"},"221":{"code":"39","name":"Jura"},"222":{"code":"40","name":"Landes"},"223":{"code":"41","name":"Loir-et-Cher"},"224":{"code":"42","name":"Loire"},"225":{"code":"43","name":"Haute-Loire"},"226":{"code":"44","name":"Loire-Atlantique"},"227":{"code":"45","name":"Loiret"},"228":{"code":"46","name":"Lot"},"229":{"code":"47","name":"Lot-et-Garonne"},"230":{"code":"48","name":"Loz\u00e8re"},"231":{"code":"49","name":"Maine-et-Loire"},"232":{"code":"50","name":"Manche"},"233":{"code":"51","name":"Marne"},"234":{"code":"52","name":"Haute-Marne"},"235":{"code":"53","name":"Mayenne"},"236":{"code":"54","name":"Meurthe-et-Moselle"},"237":{"code":"55","name":"Meuse"},"238":{"code":"56","name":"Morbihan"},"239":{"code":"57","name":"Moselle"},"240":{"code":"58","name":"Ni\u00e8vre"},"241":{"code":"59","name":"Nord"},"242":{"code":"60","name":"Oise"},"243":{"code":"61","name":"Orne"},"244":{"code":"62","name":"Pas-de-Calais"},"245":{"code":"63","name":"Puy-de-D\u00f4me"},"246":{"code":"64","name":"Pyr\u00e9n\u00e9es-Atlantiques"},"247":{"code":"65","name":"Hautes-Pyr\u00e9n\u00e9es"},"248":{"code":"66","name":"Pyr\u00e9n\u00e9es-Orientales"},"249":{"code":"67","name":"Bas-Rhin"},"250":{"code":"68","name":"Haut-Rhin"},"251":{"code":"69","name":"Rh\u00f4ne"},"252":{"code":"70","name":"Haute-Sa\u00f4ne"},"253":{"code":"71","name":"Sa\u00f4ne-et-Loire"},"254":{"code":"72","name":"Sarthe"},"255":{"code":"73","name":"Savoie"},"256":{"code":"74","name":"Haute-Savoie"},"257":{"code":"75","name":"Paris"},"258":{"code":"76","name":"Seine-Maritime"},"259":{"code":"77","name":"Seine-et-Marne"},"260":{"code":"78","name":"Yvelines"},"261":{"code":"79","name":"Deux-S\u00e8vres"},"262":{"code":"80","name":"Somme"},"263":{"code":"81","name":"Tarn"},"264":{"code":"82","name":"Tarn-et-Garonne"},"265":{"code":"83","name":"Var"},"266":{"code":"84","name":"Vaucluse"},"267":{"code":"85","name":"Vend\u00e9e"},"268":{"code":"86","name":"Vienne"},"269":{"code":"87","name":"Haute-Vienne"},"270":{"code":"88","name":"Vosges"},"271":{"code":"89","name":"Yonne"},"272":{"code":"90","name":"Territoire-de-Belfort"},"273":{"code":"91","name":"Essonne"},"274":{"code":"92","name":"Hauts-de-Seine"},"275":{"code":"93","name":"Seine-Saint-Denis"},"276":{"code":"94","name":"Val-de-Marne"},"277":{"code":"95","name":"Val-d'Oise"}},"RO":{"278":{"code":"AB","name":"Alba"},"279":{"code":"AR","name":"Arad"},"280":{"code":"AG","name":"Arge\u015f"},"281":{"code":"BC","name":"Bac\u0103u"},"282":{"code":"BH","name":"Bihor"},"283":{"code":"BN","name":"Bistri\u0163a-N\u0103s\u0103ud"},"284":{"code":"BT","name":"Boto\u015fani"},"285":{"code":"BV","name":"Bra\u015fov"},"286":{"code":"BR","name":"Br\u0103ila"},"287":{"code":"B","name":"Bucure\u015fti"},"288":{"code":"BZ","name":"Buz\u0103u"},"289":{"code":"CS","name":"Cara\u015f-Severin"},"290":{"code":"CL","name":"C\u0103l\u0103ra\u015fi"},"291":{"code":"CJ","name":"Cluj"},"292":{"code":"CT","name":"Constan\u0163a"},"293":{"code":"CV","name":"Covasna"},"294":{"code":"DB","name":"D\u00e2mbovi\u0163a"},"295":{"code":"DJ","name":"Dolj"},"296":{"code":"GL","name":"Gala\u0163i"},"297":{"code":"GR","name":"Giurgiu"},"298":{"code":"GJ","name":"Gorj"},"299":{"code":"HR","name":"Harghita"},"300":{"code":"HD","name":"Hunedoara"},"301":{"code":"IL","name":"Ialomi\u0163a"},"302":{"code":"IS","name":"Ia\u015fi"},"303":{"code":"IF","name":"Ilfov"},"304":{"code":"MM","name":"Maramure\u015f"},"305":{"code":"MH","name":"Mehedin\u0163i"},"306":{"code":"MS","name":"Mure\u015f"},"307":{"code":"NT","name":"Neam\u0163"},"308":{"code":"OT","name":"Olt"},"309":{"code":"PH","name":"Prahova"},"310":{"code":"SM","name":"Satu-Mare"},"311":{"code":"SJ","name":"S\u0103laj"},"312":{"code":"SB","name":"Sibiu"},"313":{"code":"SV","name":"Suceava"},"314":{"code":"TR","name":"Teleorman"},"315":{"code":"TM","name":"Timi\u015f"},"316":{"code":"TL","name":"Tulcea"},"317":{"code":"VS","name":"Vaslui"},"318":{"code":"VL","name":"V\u00e2lcea"},"319":{"code":"VN","name":"Vrancea"}}});
                                                </script>

                                                <script type="text/javascript">
                                                    var coShippingMethodForm = new VarienForm('shipping-zip-form');
                                                    var countriesWithOptionalZip = [];
                                                    coShippingMethodForm.submit = function () {
                                                        var country = $F('country');
                                                        var optionalZip = false;
                                                        for (i=0; i < countriesWithOptionalZip.length; i++) {
                                                            if (countriesWithOptionalZip[i] == country) {
                                                                optionalZip = true;
                                                            }
                                                        }
                                                        if (optionalZip) {
                                                            $('postcode').removeClassName('required-entry');
                                                        }
                                                        else {
                                                            $('postcode').addClassName('required-entry');
                                                        }
                                                        return VarienForm.prototype.submit.bind(coShippingMethodForm)();
                                                    }
                                                </script>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="totals">
                                    <table id="shopping-cart-totals-table">
                                        <col />
                                        <col width="1" />
                                        <tfoot>
                                            <tr>
                                                <td style="" class="a-right" colspan="1">
                                                    <strong>Grand Total</strong>
                                                </td>
                                                <td style="" class="a-right">
                                                    <strong><span class="price">$299.99</span></strong>
                                                </td>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>
                                                <td style="" class="a-right" colspan="1">
                                                    Subtotal    </td>
                                                <td style="" class="a-right">
                                                    <span class="price">$299.99</span>    </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <ul class="checkout-types">
                                        <li>    <button type="button" title="Proceed to Checkout" class="button btn-checkout" onclick="window.location='http://freedemo.templates-master.com/f002/checkout/onepage/';"><span><span>Proceed to Checkout</span></span></button>
                                        </li>
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
    </body>
</html>
