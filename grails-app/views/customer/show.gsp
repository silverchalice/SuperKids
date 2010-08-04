
<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
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
                            <td valign="top" class="name"><g:message code="customer.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${customerInstance?.address?.id}">${customerInstance?.address?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.breakfastsServed.label" default="Breakfasts Served" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "breakfastsServed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.brokerReps.label" default="Broker Reps" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${customerInstance.brokerReps}" var="b">
                                    <li><g:link controller="brokerRepresentative" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.calls.label" default="Calls" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${customerInstance.calls}" var="c">
                                    <li><g:link controller="call" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.cdEmail.label" default="Cd Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "cdEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.cdName.label" default="Cd Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "cdName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.cdTitle.label" default="Cd Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "cdTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.deliveryAddress.label" default="Delivery Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${customerInstance?.deliveryAddress?.id}">${customerInstance?.deliveryAddress?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.district.label" default="District" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "district")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.doesPrepareBreadFromMix.label" default="Does Prepare Bread From Mix" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.doesPrepareBreadFromMix}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.doesPrepareBreadFromScratch.label" default="Does Prepare Bread From Scratch" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.doesPrepareBreadFromScratch}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.doesPurchaseBakedFood.label" default="Does Purchase Baked Food" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.doesPurchaseBakedFood}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.doesPurchaseFrozenFood.label" default="Does Purchase Frozen Food" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.doesPurchaseFrozenFood}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.doesPurchasePreparedFood.label" default="Does Purchase Prepared Food" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.doesPurchasePreparedFood}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.facilities.label" default="Facilities" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "facilities")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fsdEmail.label" default="Fsd Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fsdName.label" default="Fsd Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fsdTitle.label" default="Fsd Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.lunchesServed.label" default="Lunches Served" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "lunchesServed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.ndEmail.label" default="Nd Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "ndEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.ndName.label" default="Nd Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "ndName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.ndTitle.label" default="Nd Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "ndTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.orders.label" default="Orders" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${customerInstance.orders}" var="o">
                                    <li><g:link controller="order" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.primaryFoodServiceDistributor.label" default="Primary Food Service Distributor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "primaryFoodServiceDistributor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.snacksServed.label" default="Snacks Served" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "snacksServed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.studentsInDistrict.label" default="Students In District" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "studentsInDistrict")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.website.label" default="Website" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "website")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${customerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
