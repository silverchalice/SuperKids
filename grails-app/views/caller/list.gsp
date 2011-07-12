
<%@ page import="com.superkids.domain.CallResult; com.superkids.domain.Caller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caller.label', default: 'Caller')}" />
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
                        
                            <th>Username</th>
                        
                            <th>Calls</th>

                            <th>QUALIFIED</th>

                            <th>Account Expired</th>
                        
                            <th>Account Locked</th>
                        
                            <th>Enabled</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${callerInstanceList}" status="i" var="callerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${callerInstance.id}">${fieldValue(bean: callerInstance, field: "username")}</g:link></td>
                        
                            <td>${callerInstance?.calls?.size()}</td>


                            <td><% def size = 0%>
								<g:each in="${callerInstance?.calls}" var="call">

								<% if(call.result == CallResult.QUALIFIED){ size++ } %>
                            </g:each>
							    <% println size %>
							</td>

                            <td><g:formatBoolean boolean="${callerInstance.accountExpired}" /></td>
                        
                            <td><g:formatBoolean boolean="${callerInstance.accountLocked}" /></td>
                        
                            <td><g:formatBoolean boolean="${callerInstance.enabled}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${callerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
