
<%@ page import="com.superkids.domain.PageText" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pageText.label', default: 'PageText')}" />
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

                <g:form action="list">
                    <label for="query">Search: </label><g:textField name="query" /> <g:submitButton name="submit" value="Search" />
                </g:form>

                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'pageText.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'pageText.name.label', default: 'Name')}" />
                        

                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pageTextInstanceList}" status="i" var="pageTextInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pageTextInstance.id}">${fieldValue(bean: pageTextInstance, field: "id")}</g:link></td>
                        
                            <td><g:link action="show" id="${pageTextInstance.id}">${fieldValue(bean: pageTextInstance, field: "name")}</g:link></td>

                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pageTextInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
