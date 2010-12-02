
<%@ page import="com.superkids.domain.Admin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="admin.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value"><g:link controller="home" action="change_password" id="${adminInstance?.id}">Change Password</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.accountExpired.label" default="Account Expired" /></td>
                            
                            <td valign="top" class="value"><span style="color:${adminInstance?.accountExpired ? 'red' : 'green'}"><strong><g:formatBoolean boolean="${adminInstance?.accountExpired}" true="Yes" false="No" /></strong></span></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.accountLocked.label" default="Account Locked" /></td>
                            
                            <td valign="top" class="value"><span style="color:${adminInstance?.accountLocked ? 'red' : 'green'}"><strong><g:formatBoolean boolean="${adminInstance?.accountLocked}" true="Yes" false="No" /></strong></span></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.passwordExpired.label" default="Password Expired" /></td>
 
                            <td valign="top" class="value"><span style="color:${adminInstance?.passwordExpired ? 'red' : 'green'}"><strong><g:formatBoolean boolean="${adminInstance?.passwordExpired}" true="Yes" false="No" /></strong></span></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MMMM dd, yyyy" date="${adminInstance?.dateCreated}" /> at <g:formatDate format="h:mm a" date="${adminInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.enabled.label" default="Enabled" /></td>
                            
                            <td valign="top" class="value"><span style="color:${adminInstance?.enabled ? 'green' : 'red'}"><strong><g:formatBoolean boolean="${adminInstance?.enabled}" true="Yes" false="No" /></strong></span></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.lastLogin.label" default="Last Login" /></td>
                            
                            <td valign="top" class="value">
                                <g:if test="${adminInstance?.lastLogin}">
                                    <g:formatDate format="MMMM dd, yyyy" date="${adminInstance?.lastLogin}" /> at <g:formatDate format="h:mm a" date="${adminInstance?.lastLogin}" />
                                </g:if>
                                <g:else>
                                    <strong>[user has not logged in yet]</strong>
                                </g:else>
                            </td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="admin.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value">
                                <g:if test="${adminInstance?.lastUpdated}">
                                    <g:formatDate format="MMMM dd, yyyy" date="${adminInstance?.lastUpdated}" /> at <g:formatDate format="h:mm a" date="${adminInstance?.lastUpdated}" />
                                </g:if>
                                <g:else>
                                    <strong>[account has not been updated since created]</strong>
                                </g:else>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: adminInstance, field: "firstName")} ${fieldValue(bean: adminInstance, field: "lastName")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${adminInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
