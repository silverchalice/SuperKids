

<%@ page import="com.superkids.domain.Sponsor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
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
            <g:hasErrors bean="${sponsorInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="sponsor.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${sponsorInstance?.name}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="sponsor.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${sponsorInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address"><g:message code="address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${sponsorInstance?.address}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="sponsor.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${sponsorInstance?.phone}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website"><g:message code="sponsor.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${sponsorInstance?.website}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logo"><g:message code="sponsor.logo.label" default="Logo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'logo', 'errors')}">
                                    <input type="file" id="logo" name="logo" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="salesContact"><g:message code="sponsor.salesContact.label" default="Sales Contact" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'salesContact', 'errors')}">
                                    <g:textField name="salesContact" value="${sponsorInstance?.salesContact}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sampleContact"><g:message code="sponsor.sampleContact.label" default="Sample Contact" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'sampleContact', 'errors')}">
                                    <g:textField name="sampleContact" value="${sponsorInstance?.sampleContact}" />
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
