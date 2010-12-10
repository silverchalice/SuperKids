
<%@ page import="com.superkids.domain.Caller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caller.label', default: 'Caller')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>${fieldValue(bean: callerInstance, field: "username")}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">

				<div class="buttons">
					<g:form>
						<g:hiddenField name="id" value="${callerInstance?.id}" />
						<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</g:form>
           		</div>
				<br/>
				<g:if test="${callerInstance?.calls}">
					<h2>Call Log</h2>
					<table>
						<tbody>
							<th>Customer</th>
							<th>Date</th>
							<th>Result</th>
						</tbody>

						<g:each in="${callerInstance?.calls}" var="call">

                        <tr>
							 <td><g:link controller="customer" action="show" id="${call?.customer?.id}">${call?.customer}</g:link> </td>

							<td>${call?.dateCreated}</td>

                            <td>${call?.result}</td>

                        </tr>
						</g:each>


					</table>

				</g:if>


            </div>

        </div>
    </body>
</html>
