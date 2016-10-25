<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login | SuperKids</title>
    <meta name="layout" content="auth"/>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <script type="text/javascript">

        (function () {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
    </script>

</head>

<body>


<div id="login">

    <div style="float:left; width: 600px; height: 400px">


        <h2>Please Enter your Username and Password</h2>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>   <br/>
        </g:if>
        <p>Your username is the email address you used to register - if you have not yet set your password, you should use the default password you received by email when you registered.</p>


        <form action='${postUrl}' method='post' id='loginForm' class='cssform'>
            <div>
                <label style="font-size: 24px" for='username'>Username</label> <input style="font-size: 24px" type='text'
                                                                                      class='text_' name='j_username'
                                                                                      id='username'/><br/><br/>
                <label style="font-size: 24px" for='password'>Password</label> <input style="font-size: 24px"
                                                                                      type='password' class='text_'
                                                                                      name='j_password'
                                                                                      id='password'/> <br/> <br/>
                <input type="submit" class="btn arrow" value="Login" />
                <a href="${createLink(controller: 'home', action: 'c_forgot_password')}">(Forgot your Password?)</a>

            </div>

        </form>

    </div>

    <div id="register" style="width: 240px; float: right; padding: 25px 0; margin-right: 100px">
        <strong>If you are a <strong>Foodservice Director</strong> who has not received a username and password, click Register.
        </strong>
        <a href="${createLink(controller: 'home', action: 'register')}" class="btn arrow"><span>Register</span></a>
    </div>

    <div class="clear" style="padding: 100px">&nbsp;</div>
</div>


</body>
</html>
