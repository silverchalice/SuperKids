
<%@ page import="com.superkids.domain.Ecard" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ecard.label', default: 'Ecard')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ecard.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'ecard.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="company" title="${message(code: 'ecard.company.label', default: 'Company')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'ecard.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="recipient" title="${message(code: 'ecard.recipient.label', default: 'Recipient')}" />
                        
                            <g:sortableColumn property="recipientEmail" title="${message(code: 'ecard.recipientEmail.label', default: 'Recipient Email')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ecardInstanceList}" status="i" var="ecardInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ecardInstance.id}">${fieldValue(bean: ecardInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ecardInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: ecardInstance, field: "company")}</td>
                        
                            <td>${fieldValue(bean: ecardInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: ecardInstance, field: "recipient")}</td>
                        
                            <td>${fieldValue(bean: ecardInstance, field: "recipientEmail")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ecardInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
