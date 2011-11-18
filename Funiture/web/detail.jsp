<%-- 
    Document   : detail
    Created on : 17 พ.ย. 2554, 10:44:34
    Author     : Achilles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
        <%--<script type="text/javascript" src="jshome/js/jquery-1.6.1.min.js"></script> --%>

        <script>
            //$(document).ready(function() {
             //   $("table td:last").css("border-bottom", "none");
            //    $("table th:last").css("border-bottom", "none");
            //});
            
        </script>
        <script type="text/javascript" src="ajax/myAjaxFramework.js">
            function displayTable(text){
                document.getElementById("table1").innerHTML=text;
           
            }
            function removeQ(idbook,idfield,date){
                var param = "idbook="+idbook+"&idfield="+idfield;
                postDataReturnText("plus.jsp",param,displayTable)

            }
            function addProduct(idfield){
                var count = parseInt(document.getElementById('count'),10); 
                var param = "productID="+
                    postDataReturnText("reservation.do",param,displayText);
                setTimeout("delay()",500);
                postDataReturnText("plus.jsp",field,displayTable);
           
                if(document.getElementById("bla"))
                {
                   //
                }
                else
                {
                   //
                }

            }
            function displayText(text){
                document.getElementById("table2").innerHTML=text;
                alert(text);
            }
            function delay(){

            }
        </script>
    </head>
    <body >


        <br/>
        <div class="main-container col2-right-layout">

            <div class="main">
                <div class="col-main">
                    <div class="page-title">

                        <h3>HTC Touch Diamond</h3>

                    </div>

                    <div id="messages_product_view"></div>
                    <div class="product-view">
                        <div class="product-essential">
                            <form id="product_addtocart_form">
                                <div class="no-display">
                                    <input type="hidden" name="product" value="166" />
                                    <input type="hidden" name="related_product" id="related-products-field" value="" />
                                </div>

                                <div class="product-shop">
                                    <div class="product-name">
                                        <h1>HTC Touch Diamond</h1>
                                    </div>

                                    <p class="email-friend"><a href="#">Email to a Friend</a></p>

                                    <p class="no-rating"><a href="#">Be the first to review this product</a></p>

                                    <p class="availability in-stock">Availability: <span>In stock</span></p>



                                    <div class="price-box">
                                        <span class="regular-price" id="product-price-166">
                                            <span class="price">$750.00</span>                </span>

                                    </div>




                                    <div class="add-to-box">


                                        <div class="add-to-cart">
                                            <label for="qty">Qty:</label>
                                            <input type="text" name="qty" id="qty" maxlength="12" value="" title="Qty" class="input-text qty" />
                                            <a href="#">Add To Cart</a>
                                        </div>

                                    </div>


                                    <div class="short-description">
                                        <h2>Quick Overview</h2>
                                        <div class="std">Re-defining the perception of advanced mobile phones… the HTC Touch Diamond™ signals a giant leap forward in combining hi-tech prowess with intuitive usability and exhilarating design.</div>
                                    </div>



                                </div>

                                <div class="product-img-box">
                                    <p class="product-image product-image-zoom"><a href="images/slideshow/slide-05.jpg" width="848" height="288"  rel="lightbox" >
                                            <img src="jshome/images/thumb/smallpost_thumb2_4.jpg" alt="HTC Touch Diamond" width="339" id="image" title="HTC Touch Diamond" /></a></p>


                                </div>

                                <div class="clearer"></div>
                            </form>

                        </div>

                        <div class="product-collateral">
                            <div class="box-collateral box-description">
                                <h2>Details</h2>
                                <div class="std">
                                    Re-defining the perception of advanced mobile phones… the HTC Touch Diamond™ signals a giant leap forward in combining hi-tech prowess with intuitive usability and exhilarating design.



                                    Featuring a sharp 2.8-inch touch screen housed within a stunning formation of brushed metal and flawless faceted edges, the HTC Touch Diamond is as beautiful to behold as it is to use.



                                    With HTC's vibrant touch-responsive user interface, TouchFLO™ 3D, and ultra-fast HSDPA internet connectivity… the HTC Touch Diamond offers a rich online experience to rival a notebook computer, allowing you to interact with Google, YouTube, and Wikipedia as freely as you would with a broadband connection.



                                    Your contacts, favourite music, videos and photos are no longer an uninspired line of text. With TouchFLO 3D, album artwork, video stills and snapshots of your friends' and family's faces are brought to life for you to interact, play and launch at your fingertips.



                                    A 3.2 megapixel auto-focus camera will help you capture the perfect moment in style and with a massive 4GB of internal storage you can keep all the files you need. The integrated ultra-sensitive GPS will help you find your destination as quickly and efficiently as a dedicated satellite navigation unit.



                                    Style and substance in a phone are no longer mutually exclusive. The HTC Touch Diamond has arrived.    </div>
                            </div>
                            <div class="box-collateral box-additional">
                                <h2>Additional Information</h2>
                                <table class="data-table" id="product-attribute-specs-table">
                                    <col width="25%" />
                                    <col />
                                    <tbody>
                                        <tr>
                                            <th >Model</th>
                                            <td >HTC Touch Diamond</td>
                                        </tr>
                                        <tr>
                                            <th >In Depth</th>
                                            <td >Re-defining the perception of advanced mobile phones… the HTC Touch Diamond™ signals a giant leap forward in combining hi-tech prowess with intuitive usability and exhilarating design.<br />

                                                <br />

                                                Featuring a sharp 2.8-inch touch screen housed within a stunning formation of brushed metal and flawless faceted edges, the HTC Touch Diamond is as beautiful to behold as it is to use.<br />

                                                <br />

                                                With HTC's vibrant touch-responsive user interface, TouchFLO™ 3D, and ultra-fast HSDPA internet connectivity… the HTC Touch Diamond offers a rich online experience to rival a notebook computer, allowing you to interact with Google, YouTube, and Wikipedia as freely as you would with a broadband connection.<br />

                                                <br />

                                                Your contacts, favourite music, videos and photos are no longer an uninspired line of text. With TouchFLO 3D, album artwork, video stills and snapshots of your friends' and family's faces are brought to life for you to interact, play and launch at your fingertips.<br />

                                                <br />

                                                A 3.2 megapixel auto-focus camera will help you capture the perfect moment in style and with a massive 4GB of internal storage you can keep all the files you need. The integrated ultra-sensitive GPS will help you find your destination as quickly and efficiently as a dedicated satellite navigation unit.<br />

                                                <br />

                                                Style and substance in a phone are no longer mutually exclusive. The HTC Touch Diamond has arrived.</td>
                                        </tr>
                                        <tr>
                                            <th >Dimensions</th>
                                            <td >102 mm (L) X 51 mm (W) X 11.35 mm (T)</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>


                        </div>
                    </div>                </div>
                <div class="col-right sidebar"><div class="block block-cart">
                        <div class="block-title">
                            <strong><span>My Cart</span></strong>
                        </div>
                        <input type="hidden" id="count" value="0" />
                        <div class="block-content" id="add_cart">
                            <div class="empty" style="display:inline-block">You have no items in your shopping cart.</div>
                            
                        </div>
                    </div>



                </div>
            </div>

        </div>
    </body>
</html>
