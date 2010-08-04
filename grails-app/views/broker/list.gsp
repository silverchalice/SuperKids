
<%@ page import="com.superkids.domain.Broker" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'broker.id.label', default: 'Id')}" />
                        
                            <th><g:message code="broker.address.label" default="Address" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'broker.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${brokerInstanceList}" status="i" var="brokerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: brokerInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: brokerInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${brokerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
