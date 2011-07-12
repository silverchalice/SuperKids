

<%@ page import="com.superkids.domain.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${adminInstance}">
            <div class="errors">
                <g:renderErrors bean="${adminInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${adminInstance?.id}" />
                <g:hiddenField name="version" value="${adminInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><strong>Username:</strong></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'username', 'errors')}">
                                  ${adminInstance.username}
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="admin.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${adminInstance?.email}" />
                                </td>
                            </tr>                        

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><strong>First Name:</strong></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${adminInstance?.firstName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><strong>Last Name:</strong></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${adminInstance?.lastName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><strong>Password:</strong></label>
                                </td>
                                <td valign="top">
                                    <g:link controller="home" action="change_password" id="${adminInstance.id}">Create New Password</g:link>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="admin.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${adminInstance?.enabled}" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
