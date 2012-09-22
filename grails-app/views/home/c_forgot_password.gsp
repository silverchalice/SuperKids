

<%@ page import="com.superkids.domain.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="customer" />
        <title>SuperKids | Forgot Password</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#submitLoginButton").click(function () {
                    $("#passwordForm").submit();
                });
            })

        </script>


    </head>
    <body>

    <div id="auth" style="width:640px; margin: 0 auto; height: 400px">
            <h1>Password Reset</h1>
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
            <g:form action="c_passwd_reset" method="post" name="passwordForm">
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                <p>
                    <label for="username"><strong style="font-size: 24px">Email Address:</strong> </label>
                    <g:textField name="username" value=""  style="font-size: 24px;" size="35"/>
                </p>
                <br />
                <a id="submitLoginButton" href="#" class="btn arrow"><span>Reset My Password</span></a>
            </g:form>
		</div>
    </body>
</html>
