
<%@ page import="com.superkids.domain.CustomerStatus; com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="caller" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

		<script type="text/javascript" src="${resource(dir:'js', file:'sks.js')}">
		</script>
        <div class="callerNavBar">
			<g:render template="caller_nav"/>
        </div>
        <div class="body" style="width:90%">
            <h1>Callback List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table style="width: 960px">
                    <thead>
                        <tr>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
                            <th><g:message code='customer.district.label' default='District' />

                            <th><g:message code="customer.fsd.name" default="Name" /></th>

                            <th><g:message code="customer.address" default="Address" /></th>

							<th><g:message code="customer.callback.date.label"  default="Call Back Date" /></th>

							<th><g:message code="customer.callback.caller.label"  default="Caller" /></th>

							<th>In Call</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

 							<td class="buttonCell" style="width:100px"><g:link controller="call" action="get_order_call" id="${customerInstance?.id}" params="[cb:'true']" >Order Form</g:link></td>

							<td class="buttonCell" style="width:100px">
								<g:if test="${customerInstance?.customerOrder}">
									<g:link controller="call" action="get_assess_call" id="${customerInstance?.id}" params="[cb:'true']" >Assess Form</g:link>
								</g:if>
							</td>

                            <td>
								${fieldValue(bean: customerInstance, field: "district")}
							</td>

                            <td>${customerInstance.fsdName}</td>

                            <td>${fieldValue(bean: customerInstance, field: "address")}</td>

							<td>
								<g:if test="${customerInstance.calls[-1].callbackDate < new Date()}">
									<span style="color:#cc0000; font-weight:bold">
										<g:formatDate format="MM/dd/yyyy" date="${customerInstance.calls[-1].callbackDate}" /> - ${customerInstance.calls[-1].callbackTime}
									</span>
								</g:if>
								<g:else>
									<g:formatDate format="MM/dd/yyyy" date="${customerInstance.calls[-1].callbackDate}" /> - ${customerInstance.calls[-1].callbackTime}
								</g:else>
							</td>

						    <td>
								<g:if test="${caller?.username == customerInstance.calls[-1].caller.username}"><strong style="color:green">${customerInstance.calls[-1].caller}</strong></g:if>
								<g:else>${customerInstance.calls[-1].caller}</g:else>
							</td>

 							<td style="width:100px"><g:if test="${customerInstance.inCall == null}">
								    <strong style="color:green">False</strong>
								</g:if>
								<g:else>
									<strong style="color:red">True</strong> <g:link action="unlock_customer" class="unlockCustomer" id="${customerInstance.id}" params="[type:'cb']">(Unlock)</g:link>
								</g:else>
							</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
