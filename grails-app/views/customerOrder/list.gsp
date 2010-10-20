
<%@ page import="com.superkids.domain.CustomerOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customerOrder.label', default: 'CustomerOrder')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1>Customer Orders</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'customerOrder.id.label', default: 'Order ID')}" />

							<th>Items Ordered</th>

							<th><g:message code="customerOrder.customer.label" default="Customer" /></th>

							<th>Assessment Completed</th>

							<th>Order Date</th>

							 <th><g:message code="customerOrder.shippingDate.label" default="Req'd Ship Date" /></th>

							<th>Ordered From</th>
                        
							<th>Actions</th>
                        

                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerOrderInstanceList}" status="i" var="customerOrderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td style="width:100px;">${fieldValue(bean: customerOrderInstance, field: "id")}</td>

							<td>${customerOrderInstance?.products?.size()}</td>


                        
                            <td>${fieldValue(bean: customerOrderInstance, field: "customer")}</td>

							<td><sks:assessmentCheckbox id="${customerOrderInstance?.customer?.id}"/></td>
                        
                            <td><g:formatDate date="${customerOrderInstance.dateCreated}" format="M/d/yyyy" /></td>

							<td>${fieldValue(bean: customerOrderInstance, field: "shippingDate")}</td>
                        
                            <td>${fieldValue(bean: customerOrderInstance, field: "orderType")}</td>


							<td style="width:120px;">
								<g:link action="show" id="${customerOrderInstance.id}">View</g:link>&nbsp;|&nbsp;
								<g:link action="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" id="${customerOrderInstance.id}">Delete</g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerOrderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
