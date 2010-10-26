
<%@ page import="com.superkids.domain.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
        <g:set var="loggedInAdmin" value="${Admin.get(sec.loggedInUserInfo(field:'id').toLong())}" />
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

                            <g:sortableColumn property="username" title="${message(code: 'admin.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="lastName" title="Name" />
                        
                            <g:sortableColumn property="lastLogin" title="${message(code: 'admin.lastLogin.label', default: 'Last Login')}" />

                            <g:sortableColumn property="lastUpdated" title="${message(code: 'admin.lastUpdated.label', default: 'Last Update')}" />

                            <th>Delete</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${adminInstanceList}" status="i" var="adminInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${adminInstance.id}">${fieldValue(bean: adminInstance, field: "username")}</g:link>
                            <g:if test="${adminInstance.id == loggedInAdmin?.id}">
                                <strong> [you]</strong>
                            </g:if>
                            </td>
                        
                            <td><g:link action="edit" id="${adminInstance.id}">${adminInstance.firstName} ${adminInstance.lastName}</g:link></td>
                        
                            <td>
                                <g:if test="${adminInstance.lastLogin}">
                                    <g:formatDate format="MMMM dd, yyyy" date="${adminInstance.lastLogin}" /> at <g:formatDate format="h:mm a" date="${adminInstance.lastLogin}" />
                                </g:if>
                                <g:else>
                                    <strong>[user has not logged in yet]</strong>
                                </g:else>
                            </td>

                            <td>
                                <g:if test="${adminInstance.lastUpdated}">
                                    <g:formatDate format="MMMM dd, yyyy" date="${adminInstance.lastUpdated}" /> at <g:formatDate format="h:mm a" date="${adminInstance.lastUpdated}" />
                                </g:if>
                            </td>

                            <td><g:link action="other_delete" id="${adminInstance.id}">[Delete]</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${adminInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
