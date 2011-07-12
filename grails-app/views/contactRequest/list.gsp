
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
        </div>
        <div class="body">
            <h1>Contact Requests - Click To View</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th>Name</th>
                        
                            <g:sortableColumn property="email" title="${message(code: 'contactRequest.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="phone" title="EntryDate" />
                        
                            <g:sortableColumn property="districtName" title="Company/District" />

                            <th>Delete</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactRequestInstanceList}" status="i" var="contactRequestInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactRequestInstance.id}">${contactRequestInstance.firstName} ${contactRequestInstance.lastName}</g:link></td>
                        
                            <td>${fieldValue(bean: contactRequestInstance, field: "email")}</td>
                        
                            <td><g:formatDate format="MM/dd/yyyy" date="${contactRequestInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: contactRequestInstance, field: "districtName")}</td>

                            <td><g:link controller="contactRequest" action="other_delete" id="${contactRequestInstance.id}">Delete</g:link></td>
                        
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
