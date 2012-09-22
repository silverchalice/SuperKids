

<%@ page import="com.superkids.domain.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="customer" />
        <title>SuperKids | Change Password</title>

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#submitLoginButton").click(function () {
                    $("#changePassword").submit();
                });
            })
        </script>
    </head>
    <body>

    <div id="auth" style="width:640px; margin: 0 auto; height: 400px">
        <h1 style="margin-left: 0">Please enter your new password</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="c_2_password" method="post" name="changePassword" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                    <br />
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="oldpassword" style="font-size: 20px">Current password </label>
                                </td>
                                <td valign="top">
                                    <g:passwordField  style="font-size: 20px" name="oldpassword" value="" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password" style="font-size: 20px">New password </label>
                                </td>
                                <td valign="top">
                                    <g:passwordField  style="font-size: 20px" name="password" value="" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmpassword" style="font-size: 20px">Confirm new password </label>
                                </td>
                                <td valign="top">
                                    <g:passwordField style="font-size: 20px" name="confirmpassword" value="" />
                                </td>
                            </tr>
                        </tbody>
                    </table>

                <div class="buttons">
                    <a id="submitLoginButton" style="margin-left:200px"  href="#" class="btn arrow"><span>Update My Password</span></a>
                </div>
            </g:form>
		</div>
    </body>
</html>
