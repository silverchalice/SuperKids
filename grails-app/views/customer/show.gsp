
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
            <div style="margin:20px 0px; border:1px solid; padding:15px;">
                <g:form method="post" action="findSchoolDistrict">
                    School District: <input type="text" name="district" />
                    <input type="submit" value="Search" />
                </g:form>
            </div>
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
                            <td valign="top" class="name"><g:message code="customer.district.label" default="District" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "district")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${customerInstance?.address?.id}">${customerInstance?.address?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.deliveryAddress.label" default="Delivery Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${customerInstance?.deliveryAddress?.id}">${customerInstance?.deliveryAddress?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.phone.label" default="Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "phone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fax.label" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fsdName.label" default="Fsd Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fsdEmail.label" default="Fsd Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fsdTitle.label" default="Fsd Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.ndName.label" default="Nd Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "ndName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.ndEmail.label" default="Nd Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "ndEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.ndTitle.label" default="Nd Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "ndTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.cdName.label" default="Cd Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "cdName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.cdEmail.label" default="Cd Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "cdEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.cdTitle.label" default="Cd Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "cdTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.studentsInDistrict.label" default="Students In District" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "studentsInDistrict")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.facilities.label" default="Facilities" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "facilities")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.breakfastsServed.label" default="Breakfasts Served" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "breakfastsServed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.lunchesServed.label" default="Lunches Served" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "lunchesServed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.snacksServed.label" default="Snacks Served" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "snacksServed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.hasBakery.label" default="Has Bakery" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.hasBakery}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.purchaseFreshBread.label" default="Purchase Fresh Bread" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.purchaseFreshBread}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.purchaseFrozenBread.label" default="Purchase Frozen Bread" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.purchaseFrozenBread}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.purchaseFrozenFood.label" default="Purchase Frozen Food" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.purchaseFrozenFood}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.purchasePreparedFood.label" default="Purchase Prepared Food" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.purchasePreparedFood}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.receivedCurrentMailing.label" default="Received Current Mailing" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${customerInstance?.receivedCurrentMailing}" /></td>
                            
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
