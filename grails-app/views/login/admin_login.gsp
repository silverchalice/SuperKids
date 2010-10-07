<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login | SuperKids</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'public.css')}" media="screen" />
     <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<meta name="layout" content="nonexistent" />

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<style type='text/css' media='screen'>
#login {
	margin:15px 0px; padding:0px;
	text-align:center;
}
#login .inner {
	width:260px;
	margin:0px auto;
	text-align:left;
	padding:10px;
	border-top:1px dashed #499ede;
	border-bottom:1px dashed #499ede;
	background-color:#EEF;
}
#login .inner .fheader {
	padding:4px;margin:3px 0px 3px 0;color:#2e3741;font-size:14px;font-weight:bold;
}
#login .inner .cssform p {
	clear: left;
	margin: 0;
	padding: 5px 0 8px 0;
	padding-left: 105px;
	border-top: 1px dashed gray;
	margin-bottom: 10px;
	height: 1%;
}
#login .inner .cssform input[type='text'] {
	width: 120px;
}
#login .inner .cssform label {
	font-weight: bold;
	float: left;
	margin-left: -105px;
	width: 100px;
}
#login .inner .login_message {color:red;}
#login .inner .text_ {width:350px;}
#login .inner .chk {height:12px;}

.login_message {
    background:none repeat scroll 0 0 #FFF3F3;
    border:1px solid red;
    color:#CC0000;
    margin:10px 0 20px;
    padding:5px 8px;
    width:395px;
}

body { background-color:white; }
</style>

</head>
  <body>
    <div style="width:500px; height:300px; margin:50px 220px; padding:0px 30px; border:1px solid gray;">
            <br/>
            <p>&nbsp;</p>
	        <span style="padding:15px 0 5px 0;"><strong>Enter your admin user name and password.</strong><p>&nbsp;</p> </span>
				<g:if test='${flash.message}'>
				<div class='login_message'>${flash.message}</div>
				</g:if>
			<div id='login' style="width:275px; margin-left:25px;">
				<form action='${postUrl}' method='post' id='loginForm' class='cssform'>
                        <div style="float:left; text-align:right; width:80px">
                            <label for='username'>Email Address</label><br/><br/>
                            <label for='password'>Password</label>
                        </div>
						<div style="float:right">
						  <input type='text' class='text_' name='j_username' id='username' /><br/><br/>
						  <input type='password' class='text_' name='j_password' id='password' />
						</div>
						<div class="clear" style="clear:both"><br /></div>
	                    <input type="image" class="fancyButton" name="submit" value="Login"src="${request.contextPath}/images/EnterButton-Blue.png"/>
	                    <input type="image" class="fancyButton" src="${request.contextPath}/images/ForgotPasswordButton.png"/>

				</form>
			</div>
         </div>
			<script type='text/javascript'>
			<!--
			(function(){
				document.forms['loginForm'].elements['j_username'].focus();
			})();
			// -->
			</script>
  </body>
</html>
