
<%@ page import="com.superkids.domain.ContactRequest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactRequest.label', default: 'ContactRequest')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'contactRequest.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'contactRequest.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'contactRequest.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'contactRequest.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="phone" title="${message(code: 'contactRequest.phone.label', default: 'Phone')}" />
                        
                            <g:sortableColumn property="districtName" title="${message(code: 'contactRequest.districtName.label', default: 'District Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactRequestInstanceList}" status="i" var="contactRequestInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactRequestInstance.id}">${fieldValue(bean: contactRequestInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: contactRequestInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: contactRequestInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: contactRequestInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: contactRequestInstance, field: "phone")}</td>
                        
                            <td>${fieldValue(bean: contactRequestInstance, field: "districtName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactRequestInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
