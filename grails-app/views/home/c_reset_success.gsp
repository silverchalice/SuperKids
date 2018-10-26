<%@ page import="com.superkids.domain.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="auth"/>
    <title>SuperKids | Password Reset</title>
</head>

<body>

<div id="auth" style="width:800px; margin: 0 auto">
    <h1 style="margin-left: 0">Your Password Has Been Reset</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if><br/>

    <p>Your password has been reset. You will receive an email with your new password and you will be required to change your password again once you have logged in.</p>

    <span style="text-align:center;"><h2>For Assistance</h2></span>

    <p style="text-align:center;"><a href="mailto:mchambers@stealthcreative.com">mchambers@stealthcreative.com</a><br/>
        Toll Free: 1-877-862-8828<br/>
        P.O. Box 16170 <br/>
        St. Louis, MO 63105-9713
    </p>
</div>

<div style="clear: both; width: 800px; margin: 0 auto; padding-bottom: 30px">
    <hr/>
    <a style="margin-left: 500px" href="${createLink(controller: 'home', action: 'index')}" title="Home page"
       class="btn arrow"><span>Return to the Home Page</span></a>
</div>
</body>
</html>
