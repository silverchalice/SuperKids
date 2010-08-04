

<%@ page import="com.superkids.domain.Order" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
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
            <g:hasErrors bean="${orderInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="customer"><g:message code="order.customer.label" default="Customer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'customer', 'errors')}">
                                    <g:select name="customer.id" from="${com.superkids.domain.Customer.list()}" optionKey="id" value="${orderInstance?.customer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orderedDate"><g:message code="order.orderedDate.label" default="Ordered Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderedDate', 'errors')}">
                                    <g:datePicker name="orderedDate" precision="day" value="${orderInstance?.orderedDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shippingDate"><g:message code="order.shippingDate.label" default="Shipping Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shippingDate', 'errors')}">
                                    <g:datePicker name="shippingDate" precision="day" value="${orderInstance?.shippingDate}"  />
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
