<<<<<<< HEAD:grails-app/views/login/auth.gsp
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Superkids Sampling</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'public.css')}" media="screen" />
     <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<meta name="layout" content="public" />

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script type="text/javascript" src="script.js"></script>
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
#login .inner .text_ {width:120px;}
#login .inner .chk {height:12px;}
</style>

</head>
  <body>


    <div id="content">
      <div id="contentInset">
<div STYLE="padding:10px;"> 
    <div STYLE="padding:5px 0 5px 0;"><strong>Enter the user name and password that you have received by email to begin the order/assessment process.</strong> </div> 
<div STYLE="width: 460px;padding-left: 15px;" > 
	<table width="290" border="0" cellspacing="5" cellpadding="0" align="left">
	<div id='login'>
		<div class='inner'>
			<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
			</g:if>
			<div class='fheader'>Please Login..</div>
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<p>
					<label for='username'>Login ID</label>
					<input type='text' class='text_' name='j_username' id='username' />
				</p>
				<p>
					<label for='password'>Password</label>
					<input type='password' class='text_' name='j_password' id='password' />
				</p>
				<p>
					<label for='remember_me'>Remember me</label>
					<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
					<g:if test='${hasCookie}'>checked='checked'</g:if> />
				</p>
				<p>
                                    <input TYPE="Image" NAME="submit" VALUE="Login"SRC="${request.contextPath}/images/EnterButton-Blue.png" WIDTH="136" HEIGHT="40"> 
				</p>
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
<div STYLE="width:600px;padding-top: 10px;clear:both;"> 
	<strong>If you are a foodservice director that has not received a user name and password, click Register. </strong> 
	<form method="post" action="register.cfm" NAME="Register"> 
		<div STYLE="padding-left:60px;"><input TYPE="Image" NAME="Submit" SRC="${request.contextPath}/images/RegisterButton-Green.png" WIDTH="135" HEIGHT="40" ></div> 
	</form> 
</div>						
<div STYLE="clear:both;"></div> 
<div STYLE="padding:5px 0 5px 0;"><strong>If you are not a foodservice director, let us know who you are:</strong> </div> 
<div> 
        <g:form controller="home" action="enter_site" method="post" >
	<table width="340" border="0" cellspacing="5" cellpadding="0"> 
		
		<tr> 			
			<td ALIGN="right"><input TYPE="Radio" NAME="job" VALUE="B"></td> 
			<td align="left">Foodservice Broker or Distributor?</td> 
		</tr> 

		<tr> 			
			<td ALIGN="right"><input TYPE="Radio" NAME="job" VALUE="C"></td> 
			<td align="left">Parent?</td> 
		</tr> 
		<tr> 			
			<td ALIGN="right"><input TYPE="Radio" NAME="job" VALUE="D"></td> 
			<td align="left">School Official?</td> 
		</tr> 
		<tr> 			
			<td ALIGN="right"><input TYPE="Radio" NAME="job" VALUE="E"></td> 
			<td align="left">Other?</td> 
		</tr> 
		<tr> 
			<td align="left" COLSPAN="2"> 
				<input type="Hidden" name="position" value="1"> 
				<div STYLE="padding-left:60px;"><input TYPE="Image" VALUE="Enter" NAME="Enter" SRC="${request.contextPath}/images/EnterButton-Blue.png" WIDTH="136" HEIGHT="40"></div></td> 
		</tr>
	</table> 
       </g:form>
</div> 
      </div>
      <div id="contentRightEdge">
        <img src="${resource(dir:'images',file:'layout/kid.jpg')}" id="kid"/>
      </div>

      <div id="contentFooter">
      <img id="contentFooterBL" src="${resource(dir:'images',file:'layout/contentFooter-bl-bg.gif')}"/>
      <img id="contentFooterBR" src="${resource(dir:'images',file:'layout/contentFooter-br-bg.gif')}"/>
      </div>

    </div>


  </body>
</html>
