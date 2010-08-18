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
	        <span style="padding:15px 0 5px 0;"><strong>Enter the user name and password that you have received by email to begin the order/assessment process.</strong> </span>

			<div id='login' style="width:275px; margin-left:50px;">

				<g:if test='${flash.message}'>
				<div class='login_message'>${flash.message}</div>
				</g:if>
				<form action='${postUrl}' method='post' id='loginForm' class='cssform'>
                        <div style="float:left; text-align:right; width:50px">
                            <label for='username'>Email Address</label><br/><br/>
                            <label for='password'>Password</label>
                        </div>
						<div style="float:right">
						  <input type='text' class='text_' name='j_username' id='username' /><br/><br/>
						  <input type='password' class='text_' name='j_password' id='password' />
						</div>
						<div class="clear" style="clear:both"></div>
	                    <input type="image" class="fancyButton" name="submit" value="Login"src="${request.contextPath}/images/EnterButton-Blue.png"/>
	                    <input type="image" class="fancyButton" src="${request.contextPath}/images/EnterButton-Blue.png"/>

				</form>
			</div>

			<script type='text/javascript'>
			<!--
			(function(){
				document.forms['loginForm'].elements['j_username'].focus();
			})();
			// -->
			</script>

			<div style="width:600px;padding-top: 10px;clear:both;">
				<strong>If you are a foodservice director that has not received a user name and password, click Register. </strong>
				<form method="post" action="register.cfm" name="Register">
					<div style="padding-left:60px;"><input class="fancyButton" type="image" name="Submit" src="${request.contextPath}/images/RegisterButton-Green.png" /></div>
				</form>
			</div>

		    <span style="padding:5px 0 5px 0;"><strong>If you are not a foodservice director, let us know who you are:</strong> </span>
            <br/>
            <br/>
            <div style="padding-left:20px;">
			    <g:form controller="home" action="enter_site" method="post">
					<input type="radio" name="job" value="B" />Foodservice Broker or Distributor?<br/>
					<input type="radio" name="job" value="C" />Parent?<br/>
					<input type="radio" name="job" value="D" />School Official?<br/>
					<input type="radio" name="job" value="E" />Other?<br/>
					<input type="hidden" name="position" value="1" />
					<input type="image" value="Enter" style="padding-left:35px; padding-top:10px" name="Enter" src="${request.contextPath}/images/EnterButton-Blue.png" class="fancyButton" />

		       </g:form>
	       </div>

      </div>

      <div id="contentFooter">
         <img id="contentFooterBL" src="${resource(dir:'images',file:'layout/contentFooter-bl-bg.gif')}"/>
       <img id="contentFooterBR" src="${resource(dir:'images',file:'layout/contentFooter-br-bg.gif')}"/>
      </div>


    </div>

  </body>
</html>
