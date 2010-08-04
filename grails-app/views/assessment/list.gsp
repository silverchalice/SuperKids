
<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'assessment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="commentsChange" title="${message(code: 'assessment.commentsChange.label', default: 'Comments Change')}" />
                        
                            <g:sortableColumn property="commentsLike" title="${message(code: 'assessment.commentsLike.label', default: 'Comments Like')}" />
                        
                            <th><g:message code="assessment.customer.label" default="Customer" /></th>
                        
                            <g:sortableColumn property="interest" title="${message(code: 'assessment.interest.label', default: 'Interest')}" />
                        
                            <th><g:message code="assessment.product.label" default="Product" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${assessmentInstanceList}" status="i" var="assessmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${assessmentInstance.id}">${fieldValue(bean: assessmentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: assessmentInstance, field: "commentsChange")}</td>
                        
                            <td>${fieldValue(bean: assessmentInstance, field: "commentsLike")}</td>
                        
                            <td>${fieldValue(bean: assessmentInstance, field: "customer")}</td>
                        
                            <td>${fieldValue(bean: assessmentInstance, field: "interest")}</td>
                        
                            <td>${fieldValue(bean: assessmentInstance, field: "product")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${assessmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
