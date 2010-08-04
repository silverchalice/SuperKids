

<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productInstance?.id}" />
                <g:hiddenField name="version" value="${productInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="assessments"><g:message code="product.assessments.label" default="Assessments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'assessments', 'errors')}">
                                    
<ul>
<g:each in="${productInstance?.assessments?}" var="a">
    <li><g:link controller="assessment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="assessment" action="create" params="['product.id': productInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'assessment.label', default: 'Assessment')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="brochure"><g:message code="product.brochure.label" default="Brochure" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'brochure', 'errors')}">
                                    <g:textField name="brochure" value="${fieldValue(bean: productInstance, field: 'brochure')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="product.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${productInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="details"><g:message code="product.details.label" default="Details" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'details', 'errors')}">
                                    <g:textField name="details" value="${productInstance?.details}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imageAd"><g:message code="product.imageAd.label" default="Image Ad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'imageAd', 'errors')}">
                                    <g:textField name="imageAd" value="${fieldValue(bean: productInstance, field: 'imageAd')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="product.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${productInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nutrition"><g:message code="product.nutrition.label" default="Nutrition" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'nutrition', 'errors')}">
                                    <g:textField name="nutrition" value="${productInstance?.nutrition}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sponsor"><g:message code="product.sponsor.label" default="Sponsor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'sponsor', 'errors')}">
                                    <g:select name="sponsor.id" from="${com.superkids.domain.Sponsor.list()}" optionKey="id" value="${productInstance?.sponsor?.id}"  />
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
