<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login | SuperKids</title>
    <meta name="layout" content="auth"/>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitLoginButton").click(function () {
                $("#loginForm").submit();
            });
        })

        (function () {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
    </script>

</head>

<body>
<div id="auth" style="width:720px; margin: 0 auto; height: 400px">
    <div style="width: 550px; float: left">
        <h2>Please Enter your Username and Password</h2>

        <p>Your Username should be the email address you used to register - if you have not yet set your password, you should use the default password you received by email when you registered.</p>
        <g:if test="${flash.message}">
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action='${postUrl}' method='post' id='loginForm' class='cssform'>
            <div style="text-align: right; padding-right: 100px">
                <label style="font-size: 24px" for='username'>Username</label><input style="font-size: 24px" type='text'
                                                                                     class='text_' name='j_username'
                                                                                     id='username'/><br/><br/>
                <label style="font-size: 24px" for='password'>Password</label><input style="font-size: 24px"
                                                                                     type='password' class='text_'
                                                                                     name='j_password'
                                                                                     id='password'/> <br/> <br/>
                <a id="submitLoginButton" href="#" class="btn arrow"><span>Login</span></a>
                <a href="${createLink(controller: 'home', action: 'c_forgot_password')}">(Forgot your Password?)</a>

            </div>

        </form>

    </div>

    <div id="register" style="width: 140px; float: right; padding: 25px 0">
        <strong>If you are a <strong>Foodservice Director</strong> that has not received a user name and password, click Register.
        </strong>
        <a href="${createLink(controller: 'home', action: 'register')}" class="btn arrow"><span>Register</span></a>
    </div>

    <!--
        <strong>If you are not a foodservice director, let us know who you are:</strong>
        <br/>
        <br/>
        <div style="padding-left:20px;">
            <g:form controller="home" action="enter_site" method="post">
        <label><input type="radio" name="job" value="B" >Foodservice Broker or Distributor?</label><br/>
  <label><input type="radio" name="job" value="C" >Parent?</label><br/>
  <label><input type="radio" name="job" value="D" >School Official?</label><br/>
  <label><input type="radio" name="job" value="D" >Influencer?</label><br/>
  <label><input type="radio" name="job" value="E" >Other?</label><br/>
  <input type="hidden" name="position" value="1" />
  <input type="image" value="Enter" style="padding-left:40px; padding-top:10px" name="Enter" src="${request.contextPath}/images/EnterButton-Blue.png" class="fancyButton" />

    </g:form>-->

    <div class="clear" style="padding: 100px">&nbsp;</div>
</div>

</body>
</html>
