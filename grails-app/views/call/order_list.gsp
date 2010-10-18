
<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="caller" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="callerNavBar">

			<g:render template="caller_nav"/> 	
		</div>
        <div class="body" style="width:90%">
            <h1>Customers Ready for Order Call</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table style="width:100%">
                    <thead>
                        <tr>

                            <g:sortableColumn property="district" title="${message(code: 'customer.district.label', default: 'District')}" />

                            <th><g:message code="customer.address.label" default="Address" /></th>

                            <th><g:message code="customer.email.label" default="Email" /></th>

                            <g:sortableColumn property="phone" title="${message(code: 'customer.phone.label', default: 'Phone')}" />

							<th>In Call</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:if test="${customerInstance.inCall == null}"><g:link action="get_order_call" params="[id:customerInstance?.id]">${fieldValue(bean: customerInstance, field: "district")}</g:link></td>
							    </g:if>
								<g:else>
									${fieldValue(bean: customerInstance, field: "district")}
								</g:else>
                            <td>
								<g:if test="${customerInstance.address == 'null'}">
									${fieldValue(bean: customerInstance, field: "address")}
								</g:if>
								<g:else>
									${fieldValue(bean: customerInstance, field: "deliveryAddress")}
								</g:else>
							</td>

                            <td>${fieldValue(bean: customerInstance, field: "email")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "phone")}</td>

							<td style="width:85px"><g:if test="${customerInstance.inCall == null}">
								    <strong style="color:green">False</strong>
								</g:if>
								<g:else>
									<strong style="color:red">True </strong>  |<g:link action="unlock_customer" id="${customerInstance.id}" params="[type:'order']"> Unlock</g:link>
								</g:else>
							</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" max="35"/>
            </div>
        </div>
    </body>
</html>
