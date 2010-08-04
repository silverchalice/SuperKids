

<%@ page import="com.superkids.domain.Broker" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
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
            <g:hasErrors bean="${brokerInstance}">
            <div class="errors">
                <g:renderErrors bean="${brokerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${brokerInstance?.id}" />
                <g:hiddenField name="version" value="${brokerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="broker.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'address', 'errors')}">
                                    <g:select name="address.id" from="${com.superkids.domain.Address.list()}" optionKey="id" value="${brokerInstance?.address?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="broker.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${brokerInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="representatives"><g:message code="broker.representatives.label" default="Representatives" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'representatives', 'errors')}">
                                    
<ul>
<g:each in="${brokerInstance?.representatives?}" var="r">
    <li><g:link controller="brokerRepresentative" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="brokerRepresentative" action="create" params="['broker.id': brokerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative')])}</g:link>

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
