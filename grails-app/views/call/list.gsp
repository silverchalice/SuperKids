
<%@ page import="com.superkids.domain.Call" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'call.label', default: 'Call')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'call.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="result" title="${message(code: 'call.result.label', default: 'Result')}" />
                        
                            <th><g:message code="call.customer.label" default="Customer" /></th>
                        
                            <th><g:message code="call.caller.label" default="Caller" /></th>
                        
                            <g:sortableColumn property="callbackDate" title="${message(code: 'call.callbackDate.label', default: 'Callback Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${callInstanceList}" status="i" var="callInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${callInstance.id}">${fieldValue(bean: callInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: callInstance, field: "result")}</td>
                        
                            <td>${fieldValue(bean: callInstance, field: "customer")}</td>
                        
                            <td>${fieldValue(bean: callInstance, field: "caller")}</td>
                        
                            <td><g:formatDate date="${callInstance.callbackDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${callInstanceTotal}" />
            </div>
        </div>
    </body>
</html>