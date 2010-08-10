

<%@ page import="com.superkids.domain.ContactRequest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactRequest.label', default: 'ContactRequest')}" />
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
            <g:hasErrors bean="${contactRequestInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactRequestInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName"><g:message code="contactRequest.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${contactRequestInstance?.firstName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName"><g:message code="contactRequest.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${contactRequestInstance?.lastName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="contactRequest.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${contactRequestInstance?.email}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="contactRequest.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${contactRequestInstance?.phone}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="districtName"><g:message code="contactRequest.districtName.label" default="District Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'districtName', 'errors')}">
                                    <g:textField name="districtName" value="${contactRequestInstance?.districtName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="street"><g:message code="address.street.label" default="Street" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'street', 'errors')}">
                                    <g:textField name="street" value="${contactRequestInstance?.address?.street}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="address.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${contactRequestInstance?.address?.city}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state"><g:message code="address.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'state', 'errors')}">
                                    <g:textField name="state" value="${contactRequestInstance?.address?.state}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip"><g:message code="address.zip.label" default="Zip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'zip', 'errors')}">
                                    <g:textField name="zip" value="${fieldValue(bean: contactRequestInstance?.address, field: 'zip')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message"><g:message code="contactRequest.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'message', 'errors')}">
                                    <g:textField name="message" value="${contactRequestInstance?.message}" />
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
