

<%@ page import="com.superkids.domain.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="customer" />
        <title>SuperKids | Welcome</title>
    </head>
    <body>

		<div id="contentInsetInner">
            <h1>Welcome</h1>          <br/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="c_password" method="post" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />

                    <table style="border:0">
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password" style="font-weight:bold;">New password</label>
                                </td>
                                <td valign="top">
                                    <g:passwordField name="password" value="" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmpassword" style="font-weight:bold;">Confirm new password</label>
                                </td>
                                <td valign="top">
                                    <g:passwordField name="confirmpassword" value="" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="buttons">
                                        <br />
                                        <span class="button"><g:submitButton name="create" class="save" value="Submit" /></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
               
            </g:form>
		</div>
    </body>
</html>
