
<%@ page import="com.superkids.domain.Call" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'call.label', default: 'Call')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
		<g:render template="caller_nav"/>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>

        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="call.result.label" default="Result" /></td>
                            
                            <td valign="top" class="value">${callInstance?.result?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="call.customer.label" default="Customer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="customer" action="show" id="${callInstance?.customer?.id}">${callInstance?.customer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
						<tr class="prop">
                            <td valign="top" class="name"><g:message code="call.fsdName.label" default="Contact Name" /></td>

                            <td valign="top" class="value">${callInstance?.customer?.fsdName} - ${callInstance?.customer?.phone}</td>

                        </tr>
						<tr class="prop">
                            <td valign="top" class="name"><g:message code="call.caller.label" default="Caller" /></td>
                            
                            <td valign="top" class="value"><g:link controller="caller" action="show" id="${callInstance?.caller?.id}">${callInstance?.caller?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
					    <tr class="prop">
                            <td valign="top" class="name"><g:message code="call.dateCreated.label" default="Date/Time" /></td>

                            <td valign="top" class="value"><g:formatDate date="${callInstance?.dateCreated}" format="EEEE, MMM dd yyyy - h:mm a zz" /></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="call.callbackDate.label" default="Callback Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${callInstance?.callbackDate}" /></td>
                            
                        </tr>
						<tr class="prop">
							<td valign="top" class="name"><label>Operator Notes</label></td>
							<td valign="top" class="value" style="margin:2px; padding:5px; border:1px solid gray; height:150px; background:#F7F7F7">${customerInstance?.notes}</td>
						</tr>


                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${callInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
