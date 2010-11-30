

<%@ page import="com.superkids.domain.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="customer" />
        <title>SuperKids | Password Reset</title>
    </head>
    <body>

		<div id="contentInsetInner">
            <h1>Password Successfully Reset</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if><br />
            <p>Your password has been reset. You will receive an email with your new password and you will be required to change your password again once you have logged in.</p><br />

<br /><span style="text-align:center;"><h2>For Assistance</h2></span>
<p>&nbsp;</p>
<p style="text-align:center;"><strong><a href="mailto:melissac@sdastl.com">melissac@sdastl.com</a><br /><br />
<span style="font-size:larger;">Toll Free: 1-877-862-8828</span><br />
Fax: 314-862-8829<br />
P.O. Box 16170 <br />
St. Louis, MO 63105-9713 <br />
</p>
		</div>
    </body>
</html>
