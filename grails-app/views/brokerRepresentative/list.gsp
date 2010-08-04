
<%@ page import="com.superkids.domain.BrokerRepresentative" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'brokerRepresentative.id.label', default: 'Id')}" />
                        
                            <th><g:message code="brokerRepresentative.broker.label" default="Broker" /></th>
                        
                            <g:sortableColumn property="email" title="${message(code: 'brokerRepresentative.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'brokerRepresentative.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="phone" title="${message(code: 'brokerRepresentative.phone.label', default: 'Phone')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'brokerRepresentative.title.label', default: 'Title')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${brokerRepresentativeInstanceList}" status="i" var="brokerRepresentativeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${brokerRepresentativeInstance.id}">${fieldValue(bean: brokerRepresentativeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: brokerRepresentativeInstance, field: "broker")}</td>
                        
                            <td>${fieldValue(bean: brokerRepresentativeInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: brokerRepresentativeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: brokerRepresentativeInstance, field: "phone")}</td>
                        
                            <td>${fieldValue(bean: brokerRepresentativeInstance, field: "title")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${brokerRepresentativeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
