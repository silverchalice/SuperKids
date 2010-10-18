
<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="caller" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" style="padding:0; height:30px; line-height:30px;">
    	<g:render template="caller_nav"/>
		<strong style="margin-left:200px;">Welcome Back <sec:loggedInUserInfo field="username"/></strong>
		<span class="callerButton"><g:link controller="logout">Logout</g:link></span>
        </div>
        <div class="body">
            <h1>Search Results</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table style="width:100%">
                    <thead>
                        <tr>

                            <g:sortableColumn property="district" title="${message(code: 'customer.district.label', default: 'District')}" />

                            <th><g:message code="customer.address.label" default="Address" /></th>

							<th><g:message code="customer.fsdName.label" default="FSD Name" /></th>

							<th><g:message code="customer.ndName.label" default="ND Name" /></th>

							<th><g:message code="customer.cdName.label" default="CD Name" /></th>

                            <th><g:message code="customer.email.label" default="Email" /></th>


			    <th>In Call</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                            <td><sks:linkToCall id="${customerInstance.id}" /></td>
                            <td>
								<g:if test="${customerInstance.address == 'null'}">
									${fieldValue(bean: customerInstance, field: "address")}
								</g:if>
								<g:else>
									${fieldValue(bean: customerInstance, field: "deliveryAddress")}
								</g:else>
							</td>

							<td><g:if test="${customerInstance.fsdName}">${customerInstance.fsdName}</g:if> </td>

							<td><g:if test="${customerInstance.ndName}">${customerInstance.ndName}</g:if> </td>

							<td><g:if test="${customerInstance.cdName}">${customerInstance.cdName}</g:if> </td>

                            <td>${fieldValue(bean: customerInstance, field: "email")}</td>


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
        </div>
    </body>
</html>
