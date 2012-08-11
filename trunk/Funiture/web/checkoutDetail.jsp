<%--
    Document   : jshome_CheckoutDetail
    Created on : 8 ส.ค. 2555, 10:36
    Author     : Sarawut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html  >

    <title>jshome</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
    <script type="text/javascript" src="js/mage/centinel.js"></script> <!-- ไม่มี -->
    <script type="text/javascript" src="js/varien/weee.js"></script>
    <script type="text/javascript">   
        optionalZipCountries = [];  
    </script>

    <script type="text/javascript">var Translator = new Translate({"Credit card number doesn't match credit card type":"Credit card number does not match credit card type","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Please use only letters (a-z or A-Z), numbers (0-9) or underscores (_) in this field, first character must be a letter."});</script></head>

<body class=" checkout-onepage-index">
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
            <div class="main-container col2-right-layout">
                <div class="main">
                    <div class="col-main">
                        <div class="page-title">
                            <h1>Checkout</h1>
                        </div>
                        <script type="text/javascript" src="http://freedemo.templates-master.com/js/varien/accordion.js"></script>
                        <script type="text/javascript" src="http://freedemo.templates-master.com/skin/frontend/base/default/js/opcheckout.js"></script>
                        <script type="text/javascript">countryRegions = {"US":{"1":{"code":"AL","name":"Alabama"},"2":{"code":"AK","name":"Alaska"},"3":{"code":"AS","name":"American Samoa"},"4":{"code":"AZ","name":"Arizona"},"5":{"code":"AR","name":"Arkansas"},"6":{"code":"AF","name":"Armed Forces Africa"},"7":{"code":"AA","name":"Armed Forces Americas"},"8":{"code":"AC","name":"Armed Forces Canada"},"9":{"code":"AE","name":"Armed Forces Europe"},"10":{"code":"AM","name":"Armed Forces Middle East"},"11":{"code":"AP","name":"Armed Forces Pacific"},"12":{"code":"CA","name":"California"},"13":{"code":"CO","name":"Colorado"},"14":{"code":"CT","name":"Connecticut"},"15":{"code":"DE","name":"Delaware"},"16":{"code":"DC","name":"District of Columbia"},"17":{"code":"FM","name":"Federated States Of Micronesia"},"18":{"code":"FL","name":"Florida"},"19":{"code":"GA","name":"Georgia"},"20":{"code":"GU","name":"Guam"},"21":{"code":"HI","name":"Hawaii"},"22":{"code":"ID","name":"Idaho"},"23":{"code":"IL","name":"Illinois"},"24":{"code":"IN","name":"Indiana"},"25":{"code":"IA","name":"Iowa"},"26":{"code":"KS","name":"Kansas"},"27":{"code":"KY","name":"Kentucky"},"28":{"code":"LA","name":"Louisiana"},"29":{"code":"ME","name":"Maine"},"30":{"code":"MH","name":"Marshall Islands"},"31":{"code":"MD","name":"Maryland"},"32":{"code":"MA","name":"Massachusetts"},"33":{"code":"MI","name":"Michigan"},"34":{"code":"MN","name":"Minnesota"},"35":{"code":"MS","name":"Mississippi"},"36":{"code":"MO","name":"Missouri"},"37":{"code":"MT","name":"Montana"},"38":{"code":"NE","name":"Nebraska"},"39":{"code":"NV","name":"Nevada"},"40":{"code":"NH","name":"New Hampshire"},"41":{"code":"NJ","name":"New Jersey"},"42":{"code":"NM","name":"New Mexico"},"43":{"code":"NY","name":"New York"},"44":{"code":"NC","name":"North Carolina"},"45":{"code":"ND","name":"North Dakota"},"46":{"code":"MP","name":"Northern Mariana Islands"},"47":{"code":"OH","name":"Ohio"},"48":{"code":"OK","name":"Oklahoma"},"49":{"code":"OR","name":"Oregon"},"50":{"code":"PW","name":"Palau"},"51":{"code":"PA","name":"Pennsylvania"},"52":{"code":"PR","name":"Puerto Rico"},"53":{"code":"RI","name":"Rhode Island"},"54":{"code":"SC","name":"South Carolina"},"55":{"code":"SD","name":"South Dakota"},"56":{"code":"TN","name":"Tennessee"},"57":{"code":"TX","name":"Texas"},"58":{"code":"UT","name":"Utah"},"59":{"code":"VT","name":"Vermont"},"60":{"code":"VI","name":"Virgin Islands"},"61":{"code":"VA","name":"Virginia"},"62":{"code":"WA","name":"Washington"},"63":{"code":"WV","name":"West Virginia"},"64":{"code":"WI","name":"Wisconsin"},"65":{"code":"WY","name":"Wyoming"}},"CA":{"66":{"code":"AB","name":"Alberta"},"67":{"code":"BC","name":"British Columbia"},"68":{"code":"MB","name":"Manitoba"},"69":{"code":"NL","name":"Newfoundland and Labrador"},"70":{"code":"NB","name":"New Brunswick"},"71":{"code":"NS","name":"Nova Scotia"},"72":{"code":"NT","name":"Northwest Territories"},"73":{"code":"NU","name":"Nunavut"},"74":{"code":"ON","name":"Ontario"},"75":{"code":"PE","name":"Prince Edward Island"},"76":{"code":"QC","name":"Quebec"},"77":{"code":"SK","name":"Saskatchewan"},"78":{"code":"YT","name":"Yukon Territory"}},"DE":{"79":{"code":"NDS","name":"Niedersachsen"},"80":{"code":"BAW","name":"Baden-W\u00fcrttemberg"},"81":{"code":"BAY","name":"Bayern"},"82":{"code":"BER","name":"Berlin"},"83":{"code":"BRG","name":"Brandenburg"},"84":{"code":"BRE","name":"Bremen"},"85":{"code":"HAM","name":"Hamburg"},"86":{"code":"HES","name":"Hessen"},"87":{"code":"MEC","name":"Mecklenburg-Vorpommern"},"88":{"code":"NRW","name":"Nordrhein-Westfalen"},"89":{"code":"RHE","name":"Rheinland-Pfalz"},"90":{"code":"SAR","name":"Saarland"},"91":{"code":"SAS","name":"Sachsen"},"92":{"code":"SAC","name":"Sachsen-Anhalt"},"93":{"code":"SCN","name":"Schleswig-Holstein"},"94":{"code":"THE","name":"Th\u00fcringen"}},"AT":{"95":{"code":"WI","name":"Wien"},"96":{"code":"NO","name":"Nieder\u00f6sterreich"},"97":{"code":"OO","name":"Ober\u00f6sterreich"},"98":{"code":"SB","name":"Salzburg"},"99":{"code":"KN","name":"K\u00e4rnten"},"100":{"code":"ST","name":"Steiermark"},"101":{"code":"TI","name":"Tirol"},"102":{"code":"BL","name":"Burgenland"},"103":{"code":"VB","name":"Voralberg"}},"CH":{"104":{"code":"AG","name":"Aargau"},"105":{"code":"AI","name":"Appenzell Innerrhoden"},"106":{"code":"AR","name":"Appenzell Ausserrhoden"},"107":{"code":"BE","name":"Bern"},"108":{"code":"BL","name":"Basel-Landschaft"},"109":{"code":"BS","name":"Basel-Stadt"},"110":{"code":"FR","name":"Freiburg"},"111":{"code":"GE","name":"Genf"},"112":{"code":"GL","name":"Glarus"},"113":{"code":"GR","name":"Graub\u00fcnden"},"114":{"code":"JU","name":"Jura"},"115":{"code":"LU","name":"Luzern"},"116":{"code":"NE","name":"Neuenburg"},"117":{"code":"NW","name":"Nidwalden"},"118":{"code":"OW","name":"Obwalden"},"119":{"code":"SG","name":"St. Gallen"},"120":{"code":"SH","name":"Schaffhausen"},"121":{"code":"SO","name":"Solothurn"},"122":{"code":"SZ","name":"Schwyz"},"123":{"code":"TG","name":"Thurgau"},"124":{"code":"TI","name":"Tessin"},"125":{"code":"UR","name":"Uri"},"126":{"code":"VD","name":"Waadt"},"127":{"code":"VS","name":"Wallis"},"128":{"code":"ZG","name":"Zug"},"129":{"code":"ZH","name":"Z\u00fcrich"}},"ES":{"130":{"code":"A Coru\u0441a","name":"A Coru\u00f1a"},"131":{"code":"Alava","name":"Alava"},"132":{"code":"Albacete","name":"Albacete"},"133":{"code":"Alicante","name":"Alicante"},"134":{"code":"Almeria","name":"Almeria"},"135":{"code":"Asturias","name":"Asturias"},"136":{"code":"Avila","name":"Avila"},"137":{"code":"Badajoz","name":"Badajoz"},"138":{"code":"Baleares","name":"Baleares"},"139":{"code":"Barcelona","name":"Barcelona"},"140":{"code":"Burgos","name":"Burgos"},"141":{"code":"Caceres","name":"Caceres"},"142":{"code":"Cadiz","name":"Cadiz"},"143":{"code":"Cantabria","name":"Cantabria"},"144":{"code":"Castellon","name":"Castellon"},"145":{"code":"Ceuta","name":"Ceuta"},"146":{"code":"Ciudad Real","name":"Ciudad Real"},"147":{"code":"Cordoba","name":"Cordoba"},"148":{"code":"Cuenca","name":"Cuenca"},"149":{"code":"Girona","name":"Girona"},"150":{"code":"Granada","name":"Granada"},"151":{"code":"Guadalajara","name":"Guadalajara"},"152":{"code":"Guipuzcoa","name":"Guipuzcoa"},"153":{"code":"Huelva","name":"Huelva"},"154":{"code":"Huesca","name":"Huesca"},"155":{"code":"Jaen","name":"Jaen"},"156":{"code":"La Rioja","name":"La Rioja"},"157":{"code":"Las Palmas","name":"Las Palmas"},"158":{"code":"Leon","name":"Leon"},"159":{"code":"Lleida","name":"Lleida"},"160":{"code":"Lugo","name":"Lugo"},"161":{"code":"Madrid","name":"Madrid"},"162":{"code":"Malaga","name":"Malaga"},"163":{"code":"Melilla","name":"Melilla"},"164":{"code":"Murcia","name":"Murcia"},"165":{"code":"Navarra","name":"Navarra"},"166":{"code":"Ourense","name":"Ourense"},"167":{"code":"Palencia","name":"Palencia"},"168":{"code":"Pontevedra","name":"Pontevedra"},"169":{"code":"Salamanca","name":"Salamanca"},"170":{"code":"Santa Cruz de Tenerife","name":"Santa Cruz de Tenerife"},"171":{"code":"Segovia","name":"Segovia"},"172":{"code":"Sevilla","name":"Sevilla"},"173":{"code":"Soria","name":"Soria"},"174":{"code":"Tarragona","name":"Tarragona"},"175":{"code":"Teruel","name":"Teruel"},"176":{"code":"Toledo","name":"Toledo"},"177":{"code":"Valencia","name":"Valencia"},"178":{"code":"Valladolid","name":"Valladolid"},"179":{"code":"Vizcaya","name":"Vizcaya"},"180":{"code":"Zamora","name":"Zamora"},"181":{"code":"Zaragoza","name":"Zaragoza"}},"FR":{"182":{"code":"01","name":"Ain"},"183":{"code":"02","name":"Aisne"},"184":{"code":"03","name":"Allier"},"185":{"code":"04","name":"Alpes-de-Haute-Provence"},"186":{"code":"05","name":"Hautes-Alpes"},"187":{"code":"06","name":"Alpes-Maritimes"},"188":{"code":"07","name":"Ard\u00e8che"},"189":{"code":"08","name":"Ardennes"},"190":{"code":"09","name":"Ari\u00e8ge"},"191":{"code":"10","name":"Aube"},"192":{"code":"11","name":"Aude"},"193":{"code":"12","name":"Aveyron"},"194":{"code":"13","name":"Bouches-du-Rh\u00f4ne"},"195":{"code":"14","name":"Calvados"},"196":{"code":"15","name":"Cantal"},"197":{"code":"16","name":"Charente"},"198":{"code":"17","name":"Charente-Maritime"},"199":{"code":"18","name":"Cher"},"200":{"code":"19","name":"Corr\u00e8ze"},"201":{"code":"2A","name":"Corse-du-Sud"},"202":{"code":"2B","name":"Haute-Corse"},"203":{"code":"21","name":"C\u00f4te-d'Or"},"204":{"code":"22","name":"C\u00f4tes-d'Armor"},"205":{"code":"23","name":"Creuse"},"206":{"code":"24","name":"Dordogne"},"207":{"code":"25","name":"Doubs"},"208":{"code":"26","name":"Dr\u00f4me"},"209":{"code":"27","name":"Eure"},"210":{"code":"28","name":"Eure-et-Loir"},"211":{"code":"29","name":"Finist\u00e8re"},"212":{"code":"30","name":"Gard"},"213":{"code":"31","name":"Haute-Garonne"},"214":{"code":"32","name":"Gers"},"215":{"code":"33","name":"Gironde"},"216":{"code":"34","name":"H\u00e9rault"},"217":{"code":"35","name":"Ille-et-Vilaine"},"218":{"code":"36","name":"Indre"},"219":{"code":"37","name":"Indre-et-Loire"},"220":{"code":"38","name":"Is\u00e8re"},"221":{"code":"39","name":"Jura"},"222":{"code":"40","name":"Landes"},"223":{"code":"41","name":"Loir-et-Cher"},"224":{"code":"42","name":"Loire"},"225":{"code":"43","name":"Haute-Loire"},"226":{"code":"44","name":"Loire-Atlantique"},"227":{"code":"45","name":"Loiret"},"228":{"code":"46","name":"Lot"},"229":{"code":"47","name":"Lot-et-Garonne"},"230":{"code":"48","name":"Loz\u00e8re"},"231":{"code":"49","name":"Maine-et-Loire"},"232":{"code":"50","name":"Manche"},"233":{"code":"51","name":"Marne"},"234":{"code":"52","name":"Haute-Marne"},"235":{"code":"53","name":"Mayenne"},"236":{"code":"54","name":"Meurthe-et-Moselle"},"237":{"code":"55","name":"Meuse"},"238":{"code":"56","name":"Morbihan"},"239":{"code":"57","name":"Moselle"},"240":{"code":"58","name":"Ni\u00e8vre"},"241":{"code":"59","name":"Nord"},"242":{"code":"60","name":"Oise"},"243":{"code":"61","name":"Orne"},"244":{"code":"62","name":"Pas-de-Calais"},"245":{"code":"63","name":"Puy-de-D\u00f4me"},"246":{"code":"64","name":"Pyr\u00e9n\u00e9es-Atlantiques"},"247":{"code":"65","name":"Hautes-Pyr\u00e9n\u00e9es"},"248":{"code":"66","name":"Pyr\u00e9n\u00e9es-Orientales"},"249":{"code":"67","name":"Bas-Rhin"},"250":{"code":"68","name":"Haut-Rhin"},"251":{"code":"69","name":"Rh\u00f4ne"},"252":{"code":"70","name":"Haute-Sa\u00f4ne"},"253":{"code":"71","name":"Sa\u00f4ne-et-Loire"},"254":{"code":"72","name":"Sarthe"},"255":{"code":"73","name":"Savoie"},"256":{"code":"74","name":"Haute-Savoie"},"257":{"code":"75","name":"Paris"},"258":{"code":"76","name":"Seine-Maritime"},"259":{"code":"77","name":"Seine-et-Marne"},"260":{"code":"78","name":"Yvelines"},"261":{"code":"79","name":"Deux-S\u00e8vres"},"262":{"code":"80","name":"Somme"},"263":{"code":"81","name":"Tarn"},"264":{"code":"82","name":"Tarn-et-Garonne"},"265":{"code":"83","name":"Var"},"266":{"code":"84","name":"Vaucluse"},"267":{"code":"85","name":"Vend\u00e9e"},"268":{"code":"86","name":"Vienne"},"269":{"code":"87","name":"Haute-Vienne"},"270":{"code":"88","name":"Vosges"},"271":{"code":"89","name":"Yonne"},"272":{"code":"90","name":"Territoire-de-Belfort"},"273":{"code":"91","name":"Essonne"},"274":{"code":"92","name":"Hauts-de-Seine"},"275":{"code":"93","name":"Seine-Saint-Denis"},"276":{"code":"94","name":"Val-de-Marne"},"277":{"code":"95","name":"Val-d'Oise"}},"RO":{"278":{"code":"AB","name":"Alba"},"279":{"code":"AR","name":"Arad"},"280":{"code":"AG","name":"Arge\u015f"},"281":{"code":"BC","name":"Bac\u0103u"},"282":{"code":"BH","name":"Bihor"},"283":{"code":"BN","name":"Bistri\u0163a-N\u0103s\u0103ud"},"284":{"code":"BT","name":"Boto\u015fani"},"285":{"code":"BV","name":"Bra\u015fov"},"286":{"code":"BR","name":"Br\u0103ila"},"287":{"code":"B","name":"Bucure\u015fti"},"288":{"code":"BZ","name":"Buz\u0103u"},"289":{"code":"CS","name":"Cara\u015f-Severin"},"290":{"code":"CL","name":"C\u0103l\u0103ra\u015fi"},"291":{"code":"CJ","name":"Cluj"},"292":{"code":"CT","name":"Constan\u0163a"},"293":{"code":"CV","name":"Covasna"},"294":{"code":"DB","name":"D\u00e2mbovi\u0163a"},"295":{"code":"DJ","name":"Dolj"},"296":{"code":"GL","name":"Gala\u0163i"},"297":{"code":"GR","name":"Giurgiu"},"298":{"code":"GJ","name":"Gorj"},"299":{"code":"HR","name":"Harghita"},"300":{"code":"HD","name":"Hunedoara"},"301":{"code":"IL","name":"Ialomi\u0163a"},"302":{"code":"IS","name":"Ia\u015fi"},"303":{"code":"IF","name":"Ilfov"},"304":{"code":"MM","name":"Maramure\u015f"},"305":{"code":"MH","name":"Mehedin\u0163i"},"306":{"code":"MS","name":"Mure\u015f"},"307":{"code":"NT","name":"Neam\u0163"},"308":{"code":"OT","name":"Olt"},"309":{"code":"PH","name":"Prahova"},"310":{"code":"SM","name":"Satu-Mare"},"311":{"code":"SJ","name":"S\u0103laj"},"312":{"code":"SB","name":"Sibiu"},"313":{"code":"SV","name":"Suceava"},"314":{"code":"TR","name":"Teleorman"},"315":{"code":"TM","name":"Timi\u015f"},"316":{"code":"TL","name":"Tulcea"},"317":{"code":"VS","name":"Vaslui"},"318":{"code":"VL","name":"V\u00e2lcea"},"319":{"code":"VN","name":"Vrancea"}}}</script>
                        <ol class="opc" id="checkoutSteps">
                            <li id="opc-login" class="section allow">
                                <div class="step-title">
                                    <span class="number">1</span>
                                    <h2>Checkout Method</h2>
                                    <a href="#">Edit</a>
                                </div>
                                <div id="checkout-step-login" class="step a-item" style="display:none;">
                                    <div class="col2-set">
                                        <div class="col-1">
                                            <h3>Checkout as a Guest or Register</h3>
                                            <p>Register with us for future convenience:</p>
                                            <ul class="form-list">
                                                <li class="control">
                                                    <input type="radio" name="checkout_method" id="login:guest" value="guest" class="radio" /><label for="login:guest">Checkout as Guest</label>
                                                </li>
                                                <li class="control">
                                                    <input type="radio" name="checkout_method" id="login:register" value="register" class="radio" /><label for="login:register">Register</label>
                                                </li>
                                            </ul>
                                            <h4>Register and save time!</h4>
                                            <p>Register with us for future convenience:</p>
                                            <ul class="ul">
                                                <li>Fast and easy check out</li>
                                                <li>Easy access to your order history and status</li>
                                            </ul>
                                        </div>
                                        <div class="col-2">
                                            <h3>Login</h3>
                                            <form id="login-form" action="http://freedemo.templates-master.com/f002/customer/account/loginPost/" method="post">
                                                <fieldset>
                                                    <h4>Already registered?</h4>
                                                    <p>Please log in below:</p>
                                                    <ul class="form-list">
                                                        <li>
                                                            <label for="login-email" class="required"><em>*</em>Email Address</label>
                                                            <div class="input-box">
                                                                <input type="text" class="input-text required-entry validate-email" id="login-email" name="login[username]" value="" />
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <label for="login-password" class="required"><em>*</em>Password</label>
                                                            <div class="input-box">
                                                                <input type="password" class="input-text required-entry" id="login-password" name="login[password]" />
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col2-set">
                                        <div class="col-1">
                                            <div class="buttons-set">
                                                <p class="required">&nbsp;</p>
                                                <button type="button" class="button" onclick="checkout.setMethod();"><span><span>Continue</span></span></button>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="buttons-set">
                                                <p class="required">* Required Fields</p>
                                                <a href="http://freedemo.templates-master.com/f002/customer/account/forgotpassword/" class="f-left">Forgot your password?</a>
                                                <button type="submit" class="button" onclick="onepageLogin(this)"><span><span>Login</span></span></button>
                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        //<![CDATA[
                                        var loginForm = new VarienForm('login-form', true);
                                        $('login-email').observe('keypress', bindLoginPost);
                                        $('login-password').observe('keypress', bindLoginPost);
                                        function bindLoginPost(evt){
                                            if (evt.keyCode == Event.KEY_RETURN) {
                                                loginForm.submit();
                                            }
                                        }
                                        function onepageLogin(button)
                                        {
                                            if(loginForm.validator && loginForm.validator.validate()){
                                                button.disabled = true;
                                                loginForm.submit();
                                            }
                                        }
                                        //]]>
                                    </script>
                                </div>
                            </li>
                            <li id="opc-billing" class="section">
                                <div class="step-title">
                                    <span class="number">2</span>
                                    <h2>Billing Information</h2>
                                    <a href="#">Edit</a>
                                </div>
                                <div id="checkout-step-billing" class="step a-item" style="display:none;">
                                    <form id="co-billing-form" action="">
                                        <fieldset>
                                            <ul class="form-list">
                                                <li id="billing-new-address-form">
                                                    <fieldset>
                                                        <input type="hidden" name="billing[address_id]" value="" id="billing:address_id" />
                                                        <ul>
                                                            <li class="fields"><div class="customer-name">
                                                                    <div class="field name-firstname">
                                                                        <label for="billing:firstname" class="required"><em>*</em>First Name</label>
                                                                        <div class="input-box">
                                                                            <input type="text" id="billing:firstname" name="billing[firstname]" value="" title="First Name" class="input-text required-entry"  />
                                                                        </div>
                                                                    </div>
                                                                    <div class="field name-lastname">
                                                                        <label for="billing:lastname" class="required"><em>*</em>Last Name</label>
                                                                        <div class="input-box">
                                                                            <input type="text" id="billing:lastname" name="billing[lastname]" value="" title="Last Name" class="input-text required-entry"  />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field">
                                                                    <label for="billing:company">Company</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="billing:company" name="billing[company]" value="" title="Company" class="input-text" />
                                                                    </div>
                                                                </div>
                                                                <div class="field">
                                                                    <label for="billing:email" class="required"><em>*</em>Email Address</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="billing[email]" id="billing:email" value="" title="Email Address" class="input-text validate-email required-entry" />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="wide">
                                                                <label for="billing:street1" class="required"><em>*</em>Address</label>
                                                                <div class="input-box">
                                                                    <input type="text" title="Street Address" name="billing[street][]" id="billing:street1" value="" class="input-text required-entry" />
                                                                </div>
                                                            </li>
                                                            <li class="wide">
                                                                <div class="input-box">
                                                                    <input type="text" title="Street Address 2" name="billing[street][]" id="billing:street2" value="" class="input-text" />
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field">
                                                                    <label for="billing:city" class="required"><em>*</em>City</label>
                                                                    <div class="input-box">
                                                                        <input type="text" title="City" name="billing[city]" value="" class="input-text required-entry" id="billing:city" />
                                                                    </div>
                                                                </div>
                                                                <div class="field">
                                                                    <label for="billing:region_id" class="required"><em>*</em>State/Province</label>
                                                                    <div class="input-box">
                                                                        <select id="billing:region_id" name="billing[region_id]" title="State/Province" class="validate-select" style="display:none;">
                                                                            <option value="">Please select region, state or province</option>
                                                                        </select>
                                                                        <script type="text/javascript">
                                                                            //<![CDATA[
                                                                            $('billing:region_id').setAttribute('defaultValue',  "");
                                                                            //]]>
                                                                        </script>
                                                                        <input type="text" id="billing:region" name="billing[region]" value=""  title="State/Province" class="input-text" style="display:none;" />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="fields">
                                                                <div class="field">
                                                                    <label for="billing:postcode" class="required"><em>*</em>Zip/Postal Code</label>
                                                                    <div class="input-box">
                                                                        <input type="text" title="Zip/Postal Code" name="billing[postcode]" id="billing:postcode" value="" class="input-text validate-zip-international required-entry" />
                                                                    </div>
                                                                </div>
                                                                <div class="field">
                                                                    <label for="billing:country_id" class="required"><em>*</em>Country</label>
                                                                    <div class="input-box">
                                                                        <select name="billing[country_id]" id="billing:country_id" class="validate-select" title="Country" ><option value=""> </option><option value="AF">Afghanistan</option><option value="AL">Albania</option><option value="DZ">Algeria</option><option value="AS">American Samoa</option><option value="AD">Andorra</option><option value="AO">Angola</option><option value="AI">Anguilla</option><option value="AQ">Antarctica</option><option value="AG">Antigua and Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AW">Aruba</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BS">Bahamas</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BM">Bermuda</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BA">Bosnia and Herzegovina</option><option value="BW">Botswana</option><option value="BV">Bouvet Island</option><option value="BR">Brazil</option><option value="IO">British Indian Ocean Territory</option><option value="VG">British Virgin Islands</option><option value="BN">Brunei</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="KY">Cayman Islands</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN">China</option><option value="CX">Christmas Island</option><option value="CC">Cocos [Keeling] Islands</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CG">Congo - Brazzaville</option><option value="CD">Congo - Kinshasa</option><option value="CK">Cook Islands</option><option value="CR">Costa Rica</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="CI">Côte d'Ivoire</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="ET">Ethiopia</option><option value="FK">Falkland Islands</option><option value="FO">Faroe Islands</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="FR">France</option><option value="GF">French Guiana</option><option value="PF">French Polynesia</option><option value="TF">French Southern Territories</option><option value="GA">Gabon</option><option value="GM">Gambia</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GI">Gibraltar</option><option value="GR">Greece</option><option value="GL">Greenland</option><option value="GD">Grenada</option><option value="GP">Guadeloupe</option><option value="GU">Guam</option><option value="GT">Guatemala</option><option value="GG">Guernsey</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HM">Heard Island and McDonald Islands</option><option value="HN">Honduras</option><option value="HK">Hong Kong SAR China</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN">India</option><option value="ID">Indonesia</option><option value="IR">Iran</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IM">Isle of Man</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JE">Jersey</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Laos</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MO">Macau SAR China</option><option value="MK">Macedonia</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MQ">Martinique</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="YT">Mayotte</option><option value="MX">Mexico</option><option value="FM">Micronesia</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="ME">Montenegro</option><option value="MS">Montserrat</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar [Burma]</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="AN">Netherlands Antilles</option><option value="NC">New Caledonia</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NU">Niue</option><option value="NF">Norfolk Island</option><option value="KP">North Korea</option><option value="MP">Northern Mariana Islands</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PW">Palau</option><option value="PS">Palestinian Territories</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PN">Pitcairn Islands</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="PR">Puerto Rico</option><option value="QA">Qatar</option><option value="RO">Romania</option><option value="RU">Russia</option><option value="RW">Rwanda</option><option value="RE">Réunion</option><option value="BL">Saint Barthélemy</option><option value="SH">Saint Helena</option><option value="KN">Saint Kitts and Nevis</option><option value="LC">Saint Lucia</option><option value="MF">Saint Martin</option><option value="PM">Saint Pierre and Miquelon</option><option value="VC">Saint Vincent and the Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="RS">Serbia</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="GS">South Georgia and the South Sandwich Islands</option><option value="KR">South Korea</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SJ">Svalbard and Jan Mayen</option><option value="SZ">Swaziland</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syria</option><option value="ST">São Tomé and Príncipe</option><option value="TW">Taiwan</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="TL">Timor-Leste</option><option value="TG">Togo</option><option value="TK">Tokelau</option><option value="TO">Tonga</option><option value="TT">Trinidad and Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TC">Turks and Caicos Islands</option><option value="TV">Tuvalu</option><option value="UM">U.S. Minor Outlying Islands</option><option value="VI">U.S. Virgin Islands</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom</option><option value="US" selected="selected">United States</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VA">Vatican City</option><option value="VE">Venezuela</option><option value="VN">Vietnam</option><option value="WF">Wallis and Futuna</option><option value="EH">Western Sahara</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option><option value="AX">Åland Islands</option></select>                        </div>
                                                                </div>
                                                            </li>
                                                            <li lang="fields">
                                                                <div class="field">
                                                                    <label for="billing:telephone" class="required"><em>*</em>Telephone</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="billing[telephone]" value="" title="Telephone" class="input-text required-entry" id="billing:telephone" />
                                                                    </div>
                                                                </div>
                                                                <div class="field">
                                                                    <label for="billing:fax">Fax</label>
                                                                    <div class="input-box">
                                                                        <input type="text" name="billing[fax]" value="" title="Fax" class="input-text" id="billing:fax" />
                                                                    </div>
                                                                </div>
                                                            </li>



                                                            <li class="fields" id="register-customer-password">
                                                                <div class="field">
                                                                    <label for="billing:customer_password" class="required"><em>*</em>Password</label>
                                                                    <div class="input-box">
                                                                        <input type="password" name="billing[customer_password]" id="billing:customer_password" title="Password" class="input-text required-entry validate-password" />
                                                                    </div>
                                                                </div>
                                                                <div class="field">
                                                                    <label for="billing:confirm_password" class="required"><em>*</em>Confirm Password</label>
                                                                    <div class="input-box">
                                                                        <input type="password" name="billing[confirm_password]" title="Confirm Password" id="billing:confirm_password" class="input-text required-entry validate-cpassword" />
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="no-display"><input type="hidden" name="billing[save_in_address_book]" value="1" /></li>
                                                        </ul>
                                                    </fieldset>
                                                </li>
                                                <li class="control">
                                                    <input type="radio" name="billing[use_for_shipping]" id="billing:use_for_shipping_yes" value="1" title="Ship to this address" onclick="$('shipping:same_as_billing').checked = true;" class="radio" /><label for="billing:use_for_shipping_yes">Ship to this address</label></li>
                                                <li class="control">
                                                    <input type="radio" name="billing[use_for_shipping]" id="billing:use_for_shipping_no" value="0" checked="checked" title="Ship to different address" onclick="$('shipping:same_as_billing').checked = false;" class="radio" /><label for="billing:use_for_shipping_no">Ship to different address</label>
                                                </li>
                                            </ul>
                                            <div class="buttons-set" id="billing-buttons-container">
                                                <p class="required">* Required Fields</p>
                                                <button type="button" title="Continue" class="button" onclick="billing.save()"><span><span>Continue</span></span></button>
                                                <span class="please-wait" id="billing-please-wait" style="display:none;">
                                                    <img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step...        </span>
                                            </div>
                                        </fieldset>
                                    </form>
                                    <script type="text/javascript">
                                        //<![CDATA[
                                        var billing = new Billing('co-billing-form', 'http://freedemo.templates-master.com/f002/checkout/onepage/getAddress/address/', 'http://freedemo.templates-master.com/f002/checkout/onepage/saveBilling/');
                                        var billingForm = new VarienForm('co-billing-form');

                                        //billingForm.setElementsRelation('billing:country_id', 'billing:region', 'http://freedemo.templates-master.com/f002/directory/json/childRegion/', 'Select State/Province...');
                                        $('billing-address-select') && billing.newAddress(!$('billing-address-select').value);

                                        var billingRegionUpdater = new RegionUpdater('billing:country_id', 'billing:region', 'billing:region_id', countryRegions, undefined, 'billing:postcode');
                                        //]]>
                                    </script>
                                </div>
                            </li>
                            <li id="opc-shipping" class="section">
                                <div class="step-title">
                                    <span class="number">3</span>
                                    <h2>Shipping Information</h2>
                                    <a href="#">Edit</a>
                                </div>
                                <div id="checkout-step-shipping" class="step a-item" style="display:none;">
                                    <form action="" id="co-shipping-form">
                                        <ul class="form-list">
                                            <li id="shipping-new-address-form">
                                                <fieldset>
                                                    <input type="hidden" name="shipping[address_id]" value="22654" id="shipping:address_id" />
                                                    <ul>
                                                        <li class="fields"><div class="customer-name">
                                                                <div class="field name-firstname">
                                                                    <label for="shipping:firstname" class="required"><em>*</em>First Name</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="shipping:firstname" name="shipping[firstname]" value="" title="First Name" class="input-text required-entry" onchange="shipping.setSameAsBilling(false)" />
                                                                    </div>
                                                                </div>
                                                                <div class="field name-lastname">
                                                                    <label for="shipping:lastname" class="required"><em>*</em>Last Name</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="shipping:lastname" name="shipping[lastname]" value="" title="Last Name" class="input-text required-entry" onchange="shipping.setSameAsBilling(false)" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="fields">
                                                                <label for="shipping:company">Company</label>
                                                                <div class="input-box">
                                                                    <input type="text" id="shipping:company" name="shipping[company]" value="" title="Company" class="input-text" onchange="shipping.setSameAsBilling(false);" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="wide">
                                                            <label for="shipping:street1" class="required"><em>*</em>Address</label>
                                                            <div class="input-box">
                                                                <input type="text" title="Street Address" name="shipping[street][]" id="shipping:street1" value="" class="input-text required-entry" onchange="shipping.setSameAsBilling(false);" />
                                                            </div>
                                                        </li>
                                                        <li class="wide">
                                                            <div class="input-box">
                                                                <input type="text" title="Street Address 2" name="shipping[street][]" id="shipping:street2" value="" class="input-text" onchange="shipping.setSameAsBilling(false);" />
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="field">
                                                                <label for="shipping:city" class="required"><em>*</em>City</label>
                                                                <div class="input-box">
                                                                    <input type="text" title="City" name="shipping[city]" value="" class="input-text required-entry" id="shipping:city" onchange="shipping.setSameAsBilling(false);" />
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="shipping:region" class="required"><em>*</em>State/Province</label>
                                                                <div class="input-box">
                                                                    <select id="shipping:region_id" name="shipping[region_id]" title="State/Province" class="validate-select" style="display:none;">
                                                                        <option value="">Please select region, state or province</option>
                                                                    </select>
                                                                    <script type="text/javascript">
                                                                        //<![CDATA[
                                                                        $('shipping:region_id').setAttribute('defaultValue',  "");
                                                                        //]]>
                                                                    </script>
                                                                    <input type="text" id="shipping:region" name="shipping[region]" value="" title="State/Province" class="input-text" style="display:none;" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="field">
                                                                <label for="shipping:postcode" class="required"><em>*</em>Zip/Postal Code</label>
                                                                <div class="input-box">
                                                                    <input type="text" title="Zip/Postal Code" name="shipping[postcode]" id="shipping:postcode" value="" class="input-text validate-zip-international required-entry" onchange="shipping.setSameAsBilling(false);" />
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="shipping:country_id" class="required"><em>*</em>Country</label>
                                                                <div class="input-box">
                                                                    <select name="shipping[country_id]" id="shipping:country_id" class="validate-select" title="Country" onchange="shipping.setSameAsBilling(false);"><option value=""> </option><option value="AF">Afghanistan</option><option value="AL">Albania</option><option value="DZ">Algeria</option><option value="AS">American Samoa</option><option value="AD">Andorra</option><option value="AO">Angola</option><option value="AI">Anguilla</option><option value="AQ">Antarctica</option><option value="AG">Antigua and Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AW">Aruba</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BS">Bahamas</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BM">Bermuda</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BA">Bosnia and Herzegovina</option><option value="BW">Botswana</option><option value="BV">Bouvet Island</option><option value="BR">Brazil</option><option value="IO">British Indian Ocean Territory</option><option value="VG">British Virgin Islands</option><option value="BN">Brunei</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="KY">Cayman Islands</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN">China</option><option value="CX">Christmas Island</option><option value="CC">Cocos [Keeling] Islands</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CG">Congo - Brazzaville</option><option value="CD">Congo - Kinshasa</option><option value="CK">Cook Islands</option><option value="CR">Costa Rica</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="CI">Côte d'Ivoire</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="ET">Ethiopia</option><option value="FK">Falkland Islands</option><option value="FO">Faroe Islands</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="FR">France</option><option value="GF">French Guiana</option><option value="PF">French Polynesia</option><option value="TF">French Southern Territories</option><option value="GA">Gabon</option><option value="GM">Gambia</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GI">Gibraltar</option><option value="GR">Greece</option><option value="GL">Greenland</option><option value="GD">Grenada</option><option value="GP">Guadeloupe</option><option value="GU">Guam</option><option value="GT">Guatemala</option><option value="GG">Guernsey</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HM">Heard Island and McDonald Islands</option><option value="HN">Honduras</option><option value="HK">Hong Kong SAR China</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN">India</option><option value="ID">Indonesia</option><option value="IR">Iran</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IM">Isle of Man</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JE">Jersey</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Laos</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MO">Macau SAR China</option><option value="MK">Macedonia</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MQ">Martinique</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="YT">Mayotte</option><option value="MX">Mexico</option><option value="FM">Micronesia</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="ME">Montenegro</option><option value="MS">Montserrat</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar [Burma]</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="AN">Netherlands Antilles</option><option value="NC">New Caledonia</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NU">Niue</option><option value="NF">Norfolk Island</option><option value="KP">North Korea</option><option value="MP">Northern Mariana Islands</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PW">Palau</option><option value="PS">Palestinian Territories</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PN">Pitcairn Islands</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="PR">Puerto Rico</option><option value="QA">Qatar</option><option value="RO">Romania</option><option value="RU">Russia</option><option value="RW">Rwanda</option><option value="RE">Réunion</option><option value="BL">Saint Barthélemy</option><option value="SH">Saint Helena</option><option value="KN">Saint Kitts and Nevis</option><option value="LC">Saint Lucia</option><option value="MF">Saint Martin</option><option value="PM">Saint Pierre and Miquelon</option><option value="VC">Saint Vincent and the Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="RS">Serbia</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="GS">South Georgia and the South Sandwich Islands</option><option value="KR">South Korea</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SJ">Svalbard and Jan Mayen</option><option value="SZ">Swaziland</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syria</option><option value="ST">São Tomé and Príncipe</option><option value="TW">Taiwan</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="TL">Timor-Leste</option><option value="TG">Togo</option><option value="TK">Tokelau</option><option value="TO">Tonga</option><option value="TT">Trinidad and Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TC">Turks and Caicos Islands</option><option value="TV">Tuvalu</option><option value="UM">U.S. Minor Outlying Islands</option><option value="VI">U.S. Virgin Islands</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom</option><option value="US" selected="selected">United States</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VA">Vatican City</option><option value="VE">Venezuela</option><option value="VN">Vietnam</option><option value="WF">Wallis and Futuna</option><option value="EH">Western Sahara</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option><option value="AX">Åland Islands</option></select>                            </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="field">
                                                                <label for="shipping:telephone" class="required"><em>*</em>Telephone</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="shipping[telephone]" value="" title="Telephone" class="input-text required-entry" id="shipping:telephone" onchange="shipping.setSameAsBilling(false);" />
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="shipping:fax">Fax</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="shipping[fax]" value="" title="Fax" class="input-text" id="shipping:fax" onchange="shipping.setSameAsBilling(false);" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="no-display"><input type="hidden" name="shipping[save_in_address_book]" value="1" /></li>
                                                    </ul>
                                                </fieldset>
                                            </li>
                                            <li class="control">
                                                <input type="checkbox" name="shipping[same_as_billing]" id="shipping:same_as_billing" value="1" title="Use Billing Address" onclick="shipping.setSameAsBilling(this.checked)" class="checkbox" /><label for="shipping:same_as_billing">Use Billing Address</label>
                                            </li>
                                        </ul>
                                        <div class="buttons-set" id="shipping-buttons-container">
                                            <p class="required">* Required Fields</p>
                                            <p class="back-link"><a href="#" onclick="checkout.back(); return false;"><small>&laquo; </small>Back</a></p>
                                            <button type="button" class="button" title="Continue" onclick="shipping.save()"><span><span>Continue</span></span></button>
                                            <span id="shipping-please-wait" class="please-wait" style="display:none;">
                                                <img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step...        </span>
                                        </div>
                                    </form>
                                    <script type="text/javascript">
                                        //<![CDATA[
                                        var shipping = new Shipping('co-shipping-form', 'http://freedemo.templates-master.com/f002/checkout/onepage/getAddress/address/', 'http://freedemo.templates-master.com/f002/checkout/onepage/saveShipping/',
                                        'http://freedemo.templates-master.com/f002/checkout/onepage/shippingMethod/');
                                        var shippingForm = new VarienForm('co-shipping-form');
                                        shippingForm.extraChildParams = ' onchange="shipping.setSameAsBilling(false);"';
                                        //shippingForm.setElementsRelation('shipping:country_id', 'shipping:region', 'http://freedemo.templates-master.com/f002/directory/json/childRegion/', 'Select State/Province...');
                                        $('shipping-address-select') && shipping.newAddress(!$('shipping-address-select').value);

                                        var shippingRegionUpdater = new RegionUpdater('shipping:country_id', 'shipping:region', 'shipping:region_id', countryRegions, undefined, 'shipping:postcode');
                                        //]]>
                                    </script>
                                </div>
                            </li>
                            <li id="opc-shipping_method" class="section">
                                <div class="step-title">
                                    <span class="number">4</span>
                                    <h2>Shipping Method</h2>
                                    <a href="#">Edit</a>
                                </div>
                                <div id="checkout-step-shipping_method" class="step a-item" style="display:none;">
                                    <form id="co-shipping-method-form" action="">
                                        <div id="checkout-shipping-method-load">
                                            <p>Sorry, no quotes are available for this order at this time.</p>
                                        </div>
                                        <script type="text/javascript">
                                            //<![CDATA[
                                            var shippingMethod = new ShippingMethod('co-shipping-method-form', "http://freedemo.templates-master.com/f002/checkout/onepage/saveShippingMethod/");
                                            //]]>
                                        </script>
                                        <div id="onepage-checkout-shipping-method-additional-load">
                                        </div>
                                        <div class="buttons-set" id="shipping-method-buttons-container">
                                            <p class="back-link"><a href="#" onclick="checkout.back(); return false;"><small>&laquo; </small>Back</a></p>
                                            <button type="button" class="button" onclick="shippingMethod.save()"><span><span>Continue</span></span></button>
                                            <span id="shipping-method-please-wait" class="please-wait" style="display:none;">
                                                <img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step...        </span>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <li id="opc-payment" class="section">
                                <div class="step-title">
                                    <span class="number">5</span>
                                    <h2>Payment Information</h2>
                                    <a href="#">Edit</a>
                                </div>
                                <div id="checkout-step-payment" class="step a-item" style="display:none;">
                                    <script type="text/javascript">
                                        //<![CDATA[
                                        var payment = new Payment('co-payment-form', 'http://freedemo.templates-master.com/f002/checkout/onepage/savePayment/');
                                        //]]>
                                    </script>
                                    <form action="" id="co-payment-form">
                                        <fieldset>
                                            <dl class="sp-methods" id="checkout-payment-method-load">
                                                <dt>
                                                    <input id="p_method_checkmo" value="checkmo" type="radio" name="payment[method]" title="Check / Money order" onclick="payment.switchMethod('checkmo')" class="radio" />
                                                    <label for="p_method_checkmo">Check / Money order </label>
                                                </dt>
                                                <dt>
                                                    <input id="p_method_ccsave" value="ccsave" type="radio" name="payment[method]" title="Credit Card (saved)" onclick="payment.switchMethod('ccsave')" class="radio" />
                                                    <label for="p_method_ccsave">Credit Card (saved) </label>
                                                </dt>
                                                <dd>
                                                    <ul class="form-list" id="payment_form_ccsave" style="display:none;">
                                                        <li>
                                                            <label for="ccsave_cc_owner" class="required"><em>*</em>Name on Card</label>
                                                            <div class="input-box">
                                                                <input type="text" title="Name on Card" class="input-text required-entry" id="ccsave_cc_owner" name="payment[cc_owner]" value="" />
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <label for="ccsave_cc_type" class="required"><em>*</em>Credit Card Type</label>
                                                            <div class="input-box">
                                                                <select id="ccsave_cc_type" name="payment[cc_type]" title="Credit Card Type" class="required-entry validate-cc-type-select">
                                                                    <option value="">--Please Select--</option>
                                                                    <option value="AE">American Express</option>
                                                                    <option value="VI">Visa</option>
                                                                    <option value="MC">MasterCard</option>
                                                                    <option value="DI">Discover</option>
                                                                </select>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <label for="ccsave_cc_number" class="required"><em>*</em>Credit Card Number</label>
                                                            <div class="input-box">
                                                                <input type="text" id="ccsave_cc_number" name="payment[cc_number]" title="Credit Card Number" class="input-text validate-cc-number validate-cc-type" value="" />
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <label for="ccsave_expiration" class="required"><em>*</em>Expiration Date</label>
                                                            <div class="input-box">
                                                                <div class="v-fix">
                                                                    <select id="ccsave_expiration" name="payment[cc_exp_month]" class="month validate-cc-exp required-entry">
                                                                        <option value="" selected="selected">Month</option>
                                                                        <option value="1">01 - January</option>
                                                                        <option value="2">02 - February</option>
                                                                        <option value="3">03 - March</option>
                                                                        <option value="4">04 - April</option>
                                                                        <option value="5">05 - May</option>
                                                                        <option value="6">06 - June</option>
                                                                        <option value="7">07 - July</option>
                                                                        <option value="8">08 - August</option>
                                                                        <option value="9">09 - September</option>
                                                                        <option value="10">10 - October</option>
                                                                        <option value="11">11 - November</option>
                                                                        <option value="12">12 - December</option>
                                                                    </select>
                                                                </div>
                                                                <div class="v-fix">
                                                                    <select id="ccsave_expiration_yr" name="payment[cc_exp_year]" class="year required-entry">
                                                                        <option value="" selected="selected">Year</option>
                                                                        <option value="2011">2011</option>
                                                                        <option value="2012">2012</option>
                                                                        <option value="2013">2013</option>
                                                                        <option value="2014">2014</option>
                                                                        <option value="2015">2015</option>
                                                                        <option value="2016">2016</option>
                                                                        <option value="2017">2017</option>
                                                                        <option value="2018">2018</option>
                                                                        <option value="2019">2019</option>
                                                                        <option value="2020">2020</option>
                                                                        <option value="2021">2021</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <label for="ccsave_cc_cid" class="required"><em>*</em>Card Verification Number</label>
                                                            <div class="input-box">
                                                                <div class="v-fix">
                                                                    <input type="text" title="Card Verification Number" class="input-text cvv required-entry validate-cc-cvn" id="ccsave_cc_cid" name="payment[cc_cid]" value="" />
                                                                </div>
                                                                <a href="#" class="cvv-what-is-this">What is this?</a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </dd>
                                            </dl>
                                            <script type="text/javascript">
                                                //<![CDATA[
                                                payment.init();
                                                //]]>
                                            </script>
                                        </fieldset>
                                    </form>
                                    <div class="tool-tip" id="payment-tool-tip" style="display:none;">
                                        <div class="btn-close"><a href="#" id="payment-tool-tip-close" title="Close">Close</a></div>
                                        <div class="tool-tip-content"><img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/cvv.gif" alt="Card Verification Number Visual Reference" title="Card Verification Number Visual Reference" /></div>
                                    </div>
                                    <div class="buttons-set" id="payment-buttons-container">
                                        <p class="required">* Required Fields</p>
                                        <p class="back-link"><a href="#" onclick="checkout.back(); return false;"><small>&laquo; </small>Back</a></p>
                                        <button type="button" class="button" onclick="payment.save()"><span><span>Continue</span></span></button>
                                        <span class="please-wait" id="payment-please-wait" style="display:none;">
                                            <img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step...    </span>
                                    </div>
                                    <script type="text/javascript">
                                        //<![CDATA[
                                        function toggleToolTip(event){
                                            if($('payment-tool-tip')){
                                                $('payment-tool-tip').setStyle({
                                                    top: (Event.pointerY(event)-560)+'px'//,
                                                    //left: (Event.pointerX(event)+100)+'px'
                                                })
                                                $('payment-tool-tip').toggle();
                                            }
                                            Event.stop(event);
                                        }
                                        if($('payment-tool-tip-close')){
                                            Event.observe($('payment-tool-tip-close'), 'click', toggleToolTip);
                                        }
                                        //]]>
                                    </script>
                                    <script type="text/javascript">
                                        //<![CDATA[
                                        payment.currentMethod = "";
                                        //]]>
                                    </script>
                                </div>
                            </li>
                            <li id="opc-review" class="section">
                                <div class="step-title">
                                    <span class="number">6</span>
                                    <h2>Order Review</h2>
                                    <a href="#">Edit</a>
                                </div>
                                <div id="checkout-step-review" class="step a-item" style="display:none;">
                                    <div id="checkout-review-load">
                                    </div>
                                    <div id="checkout-review-submit">

                                        <div class="buttons-set" id="review-buttons-container">
                                            <p class="f-left">Forgot an Item? <a href="http://freedemo.templates-master.com/f002/checkout/cart/">Edit Your Cart</a></p>
                                            <button type="submit" title="Place Order" class="button btn-checkout" onclick="review.save();"><span><span>Place Order</span></span></button>
                                            <span class="please-wait" id="review-please-wait" style="display:none;">
                                                <img src="http://freedemo.templates-master.com/skin/frontend/default/f002/images/opc-ajax-loader.gif" alt="Submitting order information..." title="Submitting order information..." class="v-middle" /> Submitting order information...        </span>
                                        </div>
                                        <script type="text/javascript">
                                            //<![CDATA[
                                            var review = new Review('http://freedemo.templates-master.com/f002/checkout/onepage/saveOrder/', 'http://freedemo.templates-master.com/f002/checkout/onepage/success/', $('checkout-agreements'));
                                            //]]>
                                        </script>
                                    </div>
                                </div>
                            </li>
                        </ol>
                        <script type="text/javascript">
                            //<![CDATA[
                            var accordion = new Accordion('checkoutSteps', '.step-title', true);
                            accordion.openSection('opc-login');
                            var checkout = new Checkout(accordion,{
                                progress: 'http://freedemo.templates-master.com/f002/checkout/onepage/progress/',
                                review: 'http://freedemo.templates-master.com/f002/checkout/onepage/review/',
                                saveMethod: 'http://freedemo.templates-master.com/f002/checkout/onepage/saveMethod/',
                                failure: 'http://freedemo.templates-master.com/f002/checkout/cart/'}
                        );
                            //]]>
                        </script>
                    </div>
                    <div class="col-right sidebar"><div id="checkout-progress-wrapper"><div class="block block-progress">
                                <div class="block-title">
                                    <strong><span>Your Checkout Progress</span></strong>
                                </div>
                                <div class="block-content">
                                    <dl>
                                        <dt>
                                            Billing Address            </dt>

                                        <dt>
                                            Shipping Address            </dt>

                                        <dt>
                                            Shipping Method            </dt>

                                        <dt>
                                            Payment Method            </dt>
                                    </dl>
                                </div>
                            </div></div></div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>