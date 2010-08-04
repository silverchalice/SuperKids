

<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
