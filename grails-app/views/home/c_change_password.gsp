

<%@ page import="com.superkids.domain.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="auth" />
        <title>SuperKids | Welcome</title>


        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#submitLoginButton").click(function () {
                    $("#c_password").submit();
                });
            })
        </script>

        <style type="text/css">
            #main-container {
                background: none;
            }
        </style>

    </head>
    <body>

		<div id="auth" style="width:900px; margin: 0 auto; height: 400px">
            <h1 style="margin-left: 0">Please enter your new password</h1>
            <g:form name="c_password" action="c_password" method="post" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />

                    <table style="border:0">
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password" style="font-size: 20px">New password</label>
                                </td>
                                <td valign="top">
                                    <g:passwordField name="password" value="" style="font-size: 20px" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmpassword" style="font-size: 20px">Confirm new password</label>
                                </td>
                                <td valign="top">
                                    <g:passwordField name="confirmpassword" value="" style="font-size: 20px" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br />
                                    <a id="submitLoginButton" href="#" class="btn arrow"><span>Save New Password</span></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
               
            </g:form>
		</div>
    </body>
</html>
