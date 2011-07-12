

<%@ page import="com.superkids.domain.Ecard" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ecard.label', default: 'Ecard')}" />
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
            <g:hasErrors bean="${ecardInstance}">
            <div class="errors">
                <g:renderErrors bean="${ecardInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ecardInstance?.id}" />
                <g:hiddenField name="version" value="${ecardInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="ecard.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ecardInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${ecardInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="company"><g:message code="ecard.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ecardInstance, field: 'company', 'errors')}">
                                    <g:textField name="company" value="${ecardInstance?.company}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="ecard.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ecardInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${ecardInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recipient"><g:message code="ecard.recipient.label" default="Recipient" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ecardInstance, field: 'recipient', 'errors')}">
                                    <g:textField name="recipient" value="${ecardInstance?.recipient}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recipientEmail"><g:message code="ecard.recipientEmail.label" default="Recipient Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ecardInstance, field: 'recipientEmail', 'errors')}">
                                    <g:textField name="recipientEmail" value="${ecardInstance?.recipientEmail}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="message"><g:message code="ecard.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ecardInstance, field: 'message', 'errors')}">
                                    <g:textArea name="message" cols="40" rows="5" value="${ecardInstance?.message}" />
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
