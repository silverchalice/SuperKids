

<%@ page import="com.superkids.domain.Call" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'call.label', default: 'Call')}" />
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
            <g:hasErrors bean="${callInstance}">
            <div class="errors">
                <g:renderErrors bean="${callInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${callInstance?.id}" />
                <g:hiddenField name="version" value="${callInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="result"><g:message code="call.result.label" default="Result" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: callInstance, field: 'result', 'errors')}">
                                    <g:select name="result" from="${com.superkids.domain.CallResult?.values()}" value="${callInstance?.result}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="customer"><g:message code="call.customer.label" default="Customer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: callInstance, field: 'customer', 'errors')}">
                                    <g:select name="customer.id" from="${com.superkids.domain.Customer.list()}" optionKey="id" value="${callInstance?.customer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="caller"><g:message code="call.caller.label" default="Caller" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: callInstance, field: 'caller', 'errors')}">
                                    <g:select name="caller.id" from="${com.superkids.domain.Caller.list()}" optionKey="id" value="${callInstance?.caller?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="callbackDate"><g:message code="call.callbackDate.label" default="Callback Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: callInstance, field: 'callbackDate', 'errors')}">
                                    <g:datePicker name="callbackDate" precision="day" value="${callInstance?.callbackDate}" noSelection="['': '']" />
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