
<%@ page import="com.superkids.domain.Sponsor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'sponsor.id.label', default: 'Id')}" />
                        
                            <th><g:message code="sponsor.address.label" default="Address" /></th>
                        
                            <g:sortableColumn property="logo" title="${message(code: 'sponsor.logo.label', default: 'Logo')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'sponsor.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="salesContact" title="${message(code: 'sponsor.salesContact.label', default: 'Sales Contact')}" />
                        
                            <g:sortableColumn property="sampleContact" title="${message(code: 'sponsor.sampleContact.label', default: 'Sample Contact')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorInstanceList}" status="i" var="sponsorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sponsorInstance.id}">${fieldValue(bean: sponsorInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sponsorInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: sponsorInstance, field: "logo")}</td>
                        
                            <td>${fieldValue(bean: sponsorInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: sponsorInstance, field: "salesContact")}</td>
                        
                            <td>${fieldValue(bean: sponsorInstance, field: "sampleContact")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sponsorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
