
<%@ page import="com.superkids.domain.ShippingDate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shippingDate.label', default: 'ShippingDate')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'shippingDate.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="shipDate" title="${message(code: 'shippingDate.shipDate.label', default: 'Ship Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shippingDateInstanceList}" status="i" var="shippingDateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${shippingDateInstance.id}">${fieldValue(bean: shippingDateInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${shippingDateInstance?.shipDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shippingDateInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
