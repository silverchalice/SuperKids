
<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
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
                            <td valign="top" class="name"><g:message code="assessment.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assessmentInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="assessment.commentsChange.label" default="Comments Change" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assessmentInstance, field: "commentsChange")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="assessment.commentsLike.label" default="Comments Like" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assessmentInstance, field: "commentsLike")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="assessment.customer.label" default="Customer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="customer" action="show" id="${assessmentInstance?.customer?.id}">${assessmentInstance?.customer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="assessment.interest.label" default="Interest" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assessmentInstance, field: "interest")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="assessment.product.label" default="Product" /></td>
                            
                            <td valign="top" class="value"><g:link controller="product" action="show" id="${assessmentInstance?.product?.id}">${assessmentInstance?.product?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="assessment.rating.label" default="Rating" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assessmentInstance, field: "rating")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
