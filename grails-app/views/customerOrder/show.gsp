
<%@ page import="com.superkids.domain.CustomerStatus; com.superkids.domain.CustomerOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customerOrder.label', default: 'CustomerOrder')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list">Order List</g:link></span>
        </div>
        <div class="body" style="width:800px;">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" colspan="2" class="name" style="float:left"><h2 style="margin: 0 2px 2px 0">Order Information</h2></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customerOrder.dateCreated.label" default="Date Created" /></td>

                            <td valign="top" class="value"><g:formatDate date="${customerOrderInstance?.dateCreated}" format="M/d/yyyy" /></td>

                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customerOrder.shippingDate.label" default="Shipping Date" /></td>

                            <td valign="top" class="value"><g:link controller="shippingDate" action="show" id="${customerOrderInstance?.shippingDate?.id}">${customerOrderInstance?.shippingDate?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customerOrder.orderType.label" default="Order Placed" /></td>

                            <td valign="top" class="value">${customerOrderInstance?.orderType?.encodeAsHTML()}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" colspan="2" class="name" style="float:left"><h2 style="margin: 0 2px 2px 0">FSD Contact Info</h2></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fsdName" default="Name" /></td>
                            
                            <td valign="top" class="value">${customerOrderInstance?.customer?.fsdName}</td>
                            
                        </tr>
					
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.phone.label" default="Phone" /></td>

                            <td valign="top" class="value">${customerOrderInstance?.customer?.phone}</td>

                        </tr>
                    
                         <tr class="prop">
                            <td valign="top" colspan="2" class="name" style="float:left"><h2 style="margin: 0 2px 2px 0">Delivery Address</h2></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.district" default="School District" /></td>

                            <td valign="top" class="value">${customerOrderInstance?.customer?.district}</td>

                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.address" default="Address" /></td>

                            <td valign="top" class="value">
								${customerOrderInstance?.customer?.deliveryAddress.street}
							    <g:if test="${customerOrderInstance?.customer?.deliveryAddress.street2}">${customerOrderInstance?.customer?.deliveryAddress.street2}</g:if> 
							</td>

                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.deliveryAddress" default="City/State/Zip" /></td>

                            <td valign="top" class="value">${customerOrderInstance?.customer?.deliveryAddress.city} ${customerOrderInstance?.customer?.deliveryAddress.state}, ${customerOrderInstance?.customer?.deliveryAddress.zip}</td>

                        </tr>					

					<tr class="prop">
					   <td valign="top" colspan="2" class="name" style="float:left"><h2 style="margin: 0 2px 2px 0">Products</h2></td>
				   </tr>
                    
                    </tbody>
                </table>

				<table>
						<tr>
							<th>&nbsp;</th>
							<th>Product</th>
							<th>Assessment</th>
						</tr>
					<g:each in="${products}" var="p">

							<tr>
							<td style="width:80px">
								<img src="${createLink(controller:'product', action:'displayImage', id: p?.product.id)}" alt="" style="height:50px" />&nbsp;
							</td>
							<td>
								<g:link controller="product" action="show" id="${p.id}">${p?.product.name}</g:link>
							</td>
							<td style="width:70px">
							    <sks:viewAssessment customer="${customerOrderInstance?.customer?.id}" product="${p.product.id}" />
							</td>
						</tr>



					</g:each>
				</table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${customerOrderInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
