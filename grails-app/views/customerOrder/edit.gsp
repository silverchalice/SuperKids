

<%@ page import="com.superkids.domain.CustomerOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customerOrder.label', default: 'CustomerOrder')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list">Order List</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerOrderInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerOrderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${customerOrderInstance?.id}" />
                <g:hiddenField name="version" value="${customerOrderInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shippingDate"><g:message code="customerOrder.shippingDate.label" default="Shipping Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerOrderInstance, field: 'shippingDate', 'errors')}">
                                    <g:select name="shippingDate.id" from="${com.superkids.domain.ShippingDate.list()}" optionKey="id" value="${customerOrderInstance?.shippingDate?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="customer"><g:message code="customerOrder.customer.label" default="Customer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerOrderInstance, field: 'customer', 'errors')}">
                                    <g:select name="customer.id" from="${com.superkids.domain.Customer.list()}" optionKey="id" value="${customerOrderInstance?.customer?.id}"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateCreated"><g:message code="customerOrder.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerOrderInstance, field: 'customer', 'errors')}">
                                 <g:datePicker name="dateCreated" value="${customerOrderInstance.dateCreated}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderType"><g:message code="customerOrder.orderType.label" default="Order Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerOrderInstance, field: 'orderType', 'errors')}">
                                    <g:select name="orderType" from="${com.superkids.domain.OrderType?.values()}" value="${customerOrderInstance?.orderType}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="products"><g:message code="customerOrder.products.label" default="Products" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerOrderInstance, field: 'products', 'errors')}">
                                    <g:select name="products" from="${com.superkids.domain.Product.list()}" multiple="yes" optionKey="id" size="5" value="${customerOrderInstance?.products*.id}" />
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
