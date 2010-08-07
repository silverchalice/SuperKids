
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

                            <g:sortableColumn property="name" title="${message(code: 'sponsor.name.label', default: 'Name')}" />

                            <th><g:message code="sponsor.address.label" default="Address" /></th>

                            <g:sortableColumn property="phone" title="${message(code: 'sponsor.phone.label', default: 'Phone')}" />

                            <g:sortableColumn property="website" title="${message(code: 'sponsor.website.label', default: 'Website')}" />

                            <g:sortableColumn property="salesContact" title="${message(code: 'sponsor.salesContact.label', default: 'Sales Contact')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorInstanceList}" status="i" var="sponsorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${sponsorInstance.id}">${fieldValue(bean: sponsorInstance, field: "name")}</g:link></td>

                            <td>${fieldValue(bean: sponsorInstance, field: "address")}</td>

                            <td>${fieldValue(bean: sponsorInstance, field: "phone")}</td>

                            <td>${fieldValue(bean: sponsorInstance, field: "website")}</td>

                            <td>${fieldValue(bean: sponsorInstance, field: "salesContact")}</td>

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
