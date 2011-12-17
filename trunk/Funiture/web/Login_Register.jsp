
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>Customer Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="Default Description" />
<meta name="keywords" content="Magento, Varien, E-commerce" />
<meta name="robots" content="*" />
<link rel="icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://freedemo.templates-master.com/skin/frontend/default/default/favicon.ico" type="image/x-icon" />

<link rel="stylesheet" type="text/css" href="jshome/css/widgets.css" media="all" />
<link rel="stylesheet" type="text/css" href="jshome/css/styles.css" media="all" />
<link rel="stylesheet" type="text/css" href="jshome/css/custom.css" media="all" />
<script type="text/javascript" src="jshome/js/varien/form.js"></script>


</head>
<body class=" customer-account-login">
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
</div>        <div class="main-container col1-layout">
                        <div class="main">
                <div class="col-main">
                                        <div class="account-login">
    <div class="page-title">
        <h1>Login or Create an Account</h1>
    </div>
        <form action="http://freedemo.templates-master.com/f002/customer/account/loginPost/" method="post" id="login-form">
        <div class="col2-set">
            <div class="col-1 new-users">
                <div class="content">
                    <h2>New Customers</h2>
                    <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                </div>
            </div>
            <div class="col-2 registered-users">
                <div class="content">
                    <h2>Registered Customers</h2>
                    <p>If you have an account with us, please log in.</p>
                    <ul class="form-list">
                        <li>
                            <label for="email" class="required"><em>*</em>Email Address</label>
                            <div class="input-box">
                                <input type="text" name="login[username]" value="" id="email" class="input-text required-entry validate-email" title="Email Address" />
                            </div>
                        </li>
                        <li>
                            <label for="pass" class="required"><em>*</em>Password</label>
                            <div class="input-box">
                                <input type="password" name="login[password]" class="input-text required-entry validate-password" id="pass" title="Password" />
                            </div>
                        </li>
                    </ul>
                    <p class="required">* Required Fields</p>
                </div>
            </div>
        </div>
        <div class="col2-set">
            <div class="col-1 new-users">
                <div class="buttons-set">
                    <button type="button" title="Create an Account" class="button" onclick="window.location='register.jsp';"><span><span>Create an Account</span></span></button>
                </div>
            </div>
            <div class="col-2 registered-users">
                <div class="buttons-set">
                    <a href="http://freedemo.templates-master.com/f002/customer/account/forgotpassword/" class="f-left">Forgot Your Password?</a>
                    <button type="submit" class="button" title="Login" name="send" id="send2"><span><span>Login</span></span></button>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
    //<![CDATA[
        var dataForm = new VarienForm('login-form', true);
    //]]>
    </script>
</div>
                </div>
            </div>
        </div>
        
	

</body>
</html>
