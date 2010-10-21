

<%@ page import="com.superkids.domain.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="customer" />
        <title>SuperKids | Forgot Password</title>
    </head>
    <body>

           <div id="contentInsetInner">
            <h1>Password Reset</h1><br />
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <p>&nbsp;</p>
            <p>Please enter your username in the box and click the reset password button. A new password will be emailed to you and you will be required to change that password upon entering the site.</p><br />
            <g:form action="c_passwd_reset" method="post" style="border:0;">
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                <p>
                    <label for="username"><strong>Email Address:</strong></label>
                    <g:textField name="username" value="" />
                </p>
                <br />
                <input type="image" class="fancyButton" src="${request.contextPath}/images/ForgotPasswordButton.png"/>
            </g:form>
		</div>
    </body>
</html>
