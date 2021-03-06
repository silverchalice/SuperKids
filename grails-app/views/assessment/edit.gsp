

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assessmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${assessmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="likeRating"><g:message code="assessment.likeRating.label" default="Like Rating" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'likeRating', 'errors')}">
                                    <g:textField name="likeRating" value="${fieldValue(bean: assessmentInstance, field: 'likeRating')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="changeComment"><g:message code="assessment.changeComment.label" default="Change Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'changeComment', 'errors')}">
                                    <g:textField name="changeComment" value="${assessmentInstance?.changeComment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="product"><g:message code="assessment.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${com.superkids.domain.Product.list()}" optionKey="id" value="${assessmentInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="customer"><g:message code="assessment.customer.label" default="Customer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'customer', 'errors')}">
                                    <g:select name="customer.id" from="${com.superkids.domain.Customer.list()}" optionKey="id" value="${assessmentInstance?.customer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="iRating"><g:message code="assessment.iRating.label" default="Interest Rating" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'iRating', 'errors')}">
                                    <g:textField name="iRating" value="${fieldValue(bean: assessmentInstance, field: 'iRating')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="likeComment"><g:message code="assessment.likeComment.label" default="Like Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'likeComment', 'errors')}">
                                    <g:textField name="likeComment" value="${assessmentInstance?.likeComment}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
