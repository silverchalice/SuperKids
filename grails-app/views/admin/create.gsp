

<%@ page import="com.superkids.domain.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${adminInstance}">
            <div class="errors">
                <g:renderErrors bean="${adminInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="admin.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${adminInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="admin.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${adminInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountExpired"><g:message code="admin.accountExpired.label" default="Account Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'accountExpired', 'errors')}">
                                    <g:checkBox name="accountExpired" value="${adminInstance?.accountExpired}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountLocked"><g:message code="admin.accountLocked.label" default="Account Locked" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'accountLocked', 'errors')}">
                                    <g:checkBox name="accountLocked" value="${adminInstance?.accountLocked}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastLogin"><g:message code="admin.lastLogin.label" default="Last Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'lastLogin', 'errors')}">
                                    <g:datePicker name="lastLogin" precision="day" value="${adminInstance?.lastLogin}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="admin.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${adminInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwordExpired"><g:message code="admin.passwordExpired.label" default="Password Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adminInstance, field: 'passwordExpired', 'errors')}">
                                    <g:checkBox name="passwordExpired" value="${adminInstance?.passwordExpired}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
