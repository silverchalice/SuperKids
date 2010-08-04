
<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'customer.id.label', default: 'Id')}" />
                        
                            <th><g:message code="customer.address.label" default="Address" /></th>
                        
                            <g:sortableColumn property="breakfastsServed" title="${message(code: 'customer.breakfastsServed.label', default: 'Breakfasts Served')}" />
                        
                            <g:sortableColumn property="cdEmail" title="${message(code: 'customer.cdEmail.label', default: 'Cd Email')}" />
                        
                            <g:sortableColumn property="cdName" title="${message(code: 'customer.cdName.label', default: 'Cd Name')}" />
                        
                            <g:sortableColumn property="cdTitle" title="${message(code: 'customer.cdTitle.label', default: 'Cd Title')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "breakfastsServed")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "cdEmail")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "cdName")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "cdTitle")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
