
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
                        
                            <g:sortableColumn property="name" title="${message(code: 'ecard.name.label', default: 'Sender Name')}" />

                            <g:sortableColumn property="email" title="${message(code: 'ecard.email.label', default: 'Sender Email')}" />

                            <g:sortableColumn property="recipient" title="${message(code: 'ecard.recipient.label', default: 'Recipient')}" />
                        
                            <g:sortableColumn property="recipientEmail" title="${message(code: 'ecard.recipientEmail.label', default: 'Recipient Email')}" />

							<th>Ecard Sent</th>
							
							<th>Send Date</th>

							<th>Delete</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ecardInstanceList}" status="i" var="ecardInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ecardInstance.id}">${fieldValue(bean: ecardInstance, field: "name")}</g:link></td>
                        
                            <td>${fieldValue(bean: ecardInstance, field: "email")}</td>
                        
                            <td><g:link action="show" id="${ecardInstance.id}">${fieldValue(bean: ecardInstance, field: "recipient")}</g:link></td>
                        
                            <td>${fieldValue(bean: ecardInstance, field: "recipientEmail")}</td>

							<td>${ecardInstance?.cardType}</td>

							<td><g:formatDate date="${ecardInstance?.dateCreated}" format="MM/dd/yyyy" /> </td>

							<td><g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                			</td>

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
