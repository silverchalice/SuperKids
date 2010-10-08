
<%@ page import="com.superkids.domain.CustomerStatus; com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="caller" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
			<g:render template="caller_nav"/>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>     
                    <thead>
                        <tr>

                            <th><g:message code='customer.district.label' default='District' />

                            <th><g:message code="customer.fsd.name" default="Name" /></th>

                            <th><g:message code="customer.address" default="Address" /></th>

                            <th><g:message code="customer.phone.label" default="Phone" />

                            <th><g:message code="customer.dateCalled.label" default="Date Called" />

							<th><g:message code="customer.callback.date.label"  default="Call Back Date & Time" /></th>

							<th><g:message code="customer.callback.caller.label"  default="Caller" /></th>

							

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

							<g:if test="${caller?.username == customerInstance.calls[-1].caller.username}"><span class="currentCaller"></g:if>

                            <td><g:if test="${customerInstance.inCall == null}">
									<g:if test="${customerInstance.status == CustomerStatus.HAS_ORDERED}">
										<g:link action="get_assess_call" params="[id:customerInstance?.id]">${fieldValue(bean: customerInstance, field: "district")}</g:link>
							    	</g:if>
									<g:else>
										<g:link action="get_order_call" params="[id:customerInstance?.id]">${fieldValue(bean: customerInstance, field: "district")}</g:link>
									</g:else>
								</g:if>
								<g:else>
									${fieldValue(bean: customerInstance, field: "district")}
								</g:else></td>

                            <td>${customerInstance.fsdName}</td>

                            <td>${fieldValue(bean: customerInstance, field: "address")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "phone")}</td>
							
                            <td><g:formatDate format="MM/dd/yyyy" date="${customerInstance.calls[-1].dateCreated}" /></td>

							<td><g:formatDate format="MM/dd/yyyy" date="${customerInstance.calls[-1].callbackDate}" /> - ${customerInstance.calls[-1].callbackTime}</td>

						    <td>${customerInstance.calls[-1].caller}</td>

							<g:if test="${caller?.username == customerInstance.calls[-1].caller}"></span></g:if>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" max="35" />
            </div>
        </div>
    </body>
</html>
