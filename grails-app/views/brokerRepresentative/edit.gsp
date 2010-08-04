

<%@ page import="com.superkids.domain.BrokerRepresentative" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative')}" />
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
            <g:hasErrors bean="${brokerRepresentativeInstance}">
            <div class="errors">
                <g:renderErrors bean="${brokerRepresentativeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${brokerRepresentativeInstance?.id}" />
                <g:hiddenField name="version" value="${brokerRepresentativeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="broker"><g:message code="brokerRepresentative.broker.label" default="Broker" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerRepresentativeInstance, field: 'broker', 'errors')}">
                                    <g:select name="broker.id" from="${com.superkids.domain.Broker.list()}" optionKey="id" value="${brokerRepresentativeInstance?.broker?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="brokerRepresentative.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerRepresentativeInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${brokerRepresentativeInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="brokerRepresentative.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerRepresentativeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${brokerRepresentativeInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone"><g:message code="brokerRepresentative.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerRepresentativeInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${brokerRepresentativeInstance?.phone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="brokerRepresentative.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerRepresentativeInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${brokerRepresentativeInstance?.title}" />
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
