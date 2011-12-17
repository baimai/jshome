
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Create New Customer Account</title>
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
<script type="text/javascript" src="jshome/js/varien/js.js"></script>
<script type="text/javascript" src="jshome/js/varien/form.js"></script>
<script type="text/javascript" src="jshome/js/varien/menu.js"></script>
<script type="text/javascript" src="jshome/js/mage/translate.js"></script>
<script type="text/javascript" src="jshome/js/mage/cookies.js"></script>
<!--[if lt IE 8]>
<link rel="stylesheet" type="text/css" href="http://freedemo.templates-master.com/skin/frontend/default/f002/css/styles-ie.css" media="all" />
<![endif]-->
<!--[if lt IE 7]>
<script type="text/javascript" src="http://freedemo.templates-master.com/js/lib/ds-sleight.js"></script>
<script type="text/javascript" src="http://freedemo.templates-master.com/skin/frontend/base/default/js/ie6.js"></script>
<![endif]-->

<script type="text/javascript">
//<![CDATA[
optionalZipCountries = [];
//]]>
</script>
<script type="text/javascript">var Translator = new Translate({"Credit card number doesn't match credit card type":"Credit card number does not match credit card type","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Please use only letters (a-z or A-Z), numbers (0-9) or underscores (_) in this field, first character must be a letter."});</script></head>
<body class=" customer-account-create">
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
        

</div>        <div class="main-container col1-layout">
                        <div class="main">
                <div class="col-main">
                                        <div class="account-create">
    <div class="page-title">
        <h1>Create an Account</h1>
    </div>
            <form action="http://freedemo.templates-master.com/f002/customer/account/createpost/" method="post" id="form-validate">
            <div class="fieldset">
            <h2 class="legend">Login Information</h2>
            <ul class="form-list">
             <li>
                        <label for="login" class="required"><em>*</em>login</label>
                        <div class="input-box">
                            <input type="text" name="Member_Login" id="member_login" title="member_login" class="input-text required-entry validate-Login" />
                        </div>
                    </li>
                <li class="fields">
                    <div class="field">
                        <label for="password" class="required"><em>*</em>Password</label>
                        <div class="input-box">
                            <input type="password" name="password" id="password" title="Password" class="input-text required-entry validate-password" />
                        </div>
                    </div>
                    <div class="field">
                        <label for="confirmation" class="required"><em>*</em>Confirm Password</label>
                        <div class="input-box">
                            <input type="password" name="confirmation" title="Confirm Password" id="confirmation" class="input-text required-entry validate-cpassword" />
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="fieldset">
            <input type="hidden" name="success_url" value="" />
            <input type="hidden" name="error_url" value="" />
            <h2 class="legend">Personal Information</h2>
            <ul class="form-list">
                <li class="fields">
                    <div class="customer-name">
    <div class="field name-firstname">
        <label for="firstname" >First Name</label>
        <div class="input-box">
            <input type="text" id="firstname" name="firstname" value="" title="First Name" class="input-text required-entry"  />
        </div>
    </div>
    <div class="field name-lastname">
        <label for="lastname" >Last Name</label>
        <div class="input-box">
            <input type="text" id="lastname" name="lastname" value="" title="Last Name" class="input-text required-entry"  />
        </div>
    </div>
</div>
                </li>
                <li class="fields">
                 <div class="field name-lastname">
                    <label for="email_address" class="required"><em>*</em>Email Address</label>
                    <div class="input-box">
                        <input type="text" name="email" id="email_address" value="" title="Email Address" class="input-text validate-email required-entry" />
                    </div>
                    </div>
                
                <div class="field name-lastname">
                    <label for="email_address">Company Name</label>
                    <div class="input-box">
                        <input type="text" name="Member_Com_name" id="email_address" value="" title="Email Address" class="input-text validate-email required-entry" />
                    </div>
                    </div>
                </li>                 
                <li class="fields">
                <div class="field name-lastname">
                    <label for="Adress1" >Adress1</label>
                    <div class="input-box">
                        <input type="text" name="Member_Addr1" id="Adress1" value="" title="Adress1" class="input-text validate-Adress1 required-entry" />
                    </div>
                </div>
                  <div class="field name-lastname">
                    <label for="Adress2" >Adress2</label>
                    <div class="input-box">
                        <input type="text" name="Member_Addr1" id="Adress2" value="" title="Adress2" class="input-text validate-Adress2 required-entry" />
                    </div>
                      </div>
                </li>                  
                <li class="fields">
                 <div class="field name-lastname">
                    <label for="Distinct" >Distinct</label>
                    <div class="input-box">
                        <input type="text" name="Member_Distinct" id="Distinct" value="" title="Distinct" class="input-text validate-Distinct required-entry" />
                    </div>
                     </div>
                
                <div class="field name-lastname">
                    <label for="Amphur" >Amphur</label>
                    <div class="input-box">
                        <input type="text" name="Member_Amphur" id="Amphur" value="" title="Amphur" class="input-text validate-Amphur required-entry" />
                    </div>
                     </div>
                </li><li class="fields">
                 <div class="field name-lastname">
                    <label for="Province" >Province</label>
                    <div class="input-box">
                        <input type="text" name="Member_Province" id="Province" value="" title="Province" class="input-text validate-Province required-entry" />
                    </div>
                </div>
                 <div class="field name-lastname">
                    <label for="Postcode" >Postcode</label>
                    <div class="input-box">
                        <input type="text" name="Member_Pstcode" id="Postcode" value="" title="Postcode" class="input-text validate-Postcode required-entry" />
                    </div>
                    </div>
                </li>   
                 <li class="fields">
                  <div class="field name-lastname">
                    <label for="Tel1" >Tel1</label>
                    <div class="input-box">
                        <input type="text" name="Member_Tel1" id="Tel1" value="" title="Tel1" class="input-text validate-Tel1 required-entry" />
                    </div>
                     </div>
               <div class="field name-lastname">
                    <label for="Tel2" >Tel2</label>
                    <div class="input-box">
                        <input type="text" name="Member_Tel2" id="Tel2" value="" title="Tel2" class="input-text validate-Tel2 required-entry" />
                    </div>
                     </div>
                </li>  
                <li>
                 <div class="field name-lastname">
                    <label for="Mobile1" >Mobile</label>
                    <div class="input-box">
                        <input type="text" name="Member_Mobile1" id="Mobile1" value="" title="Mobile1" class="input-text validate-Mobile1 required-entry" />
                    </div>
                     </div>
                <div class="field name-lastname">
                    <label for="Mobile2" >Mobile2</label>
                    <div class="input-box">
                        <input type="text" name="Member_Mobile2" id="Mobile2" value="" title="Mobile2" class="input-text validate-Mobile2 required-entry" />
                    </div>
                     </div>
                </li>    
                 <li>
                 
                    <label for="Fax" >Fax</label>
                    <div class="input-box">
                        <input type="text" name="Member_Fax" id="Fax" value="" title="Fax" class="input-text validate-Fax required-entry" />
                    </div>
                </li>     
                 
                                                  </ul>
        </div>
            
        <div class="buttons-set">
            <p class="required">* Required Fields</p>
            <p class="back-link"><a href="http://freedemo.templates-master.com/f002/customer/account/login/" class="back-link"><small>&laquo; </small>Back</a></p>
            <button type="submit" title="Submit" class="button"><span><span>Submit</span></span></button>
        </div>
    </form>
    <script type="text/javascript">
    //<![CDATA[
        var dataForm = new VarienForm('form-validate', true);
            //]]>
    </script>
</div>
                </div>
            </div>
        </div>
       
</div>         
</div>
</body>
</html>
