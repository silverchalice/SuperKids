
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
        <div class="body" style="width:90%">
            <h1>Search Results</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table style="width:100%">
                    <thead>
                        <tr>

                            <g:sortableColumn property="district" title="${message(code: 'customer.district.label', default: 'District')}" />

                            <th><g:message code="customer.fsdName.label" default="FSD Name" /></th>

                            <th><g:message code="customer.address.label" default="Address" /></th>

                            <th><g:message code="customer.email.label" default="Email" /></th>

                            <g:sortableColumn property="phone" title="${message(code: 'customer.phone.label', default: 'Phone')}" />

							<th>In Call</th>



                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

							<td >
								<g:if test="${customerInstance.inCall == null}">
								    <g:link action="get_order_call" id="${customerInstance?.id}" params="[search:'true', query: query]" >${customerInstance?.district}</g:link>
								</g:if>
								<g:else>
									${customerInstance?.district}
								</g:else>
							</td>
                            <td>${customerInstance?.fsdName}</td>
                            <td>${fieldValue(bean: customerInstance, field: "address")}</td>
                            <td>${fieldValue(bean: customerInstance, field: "email")}</td>
                            <td>${customerInstance.phone}</td>
						    <td style="width:100px"><g:if test="${customerInstance.inCall == null}">
								    <strong style="color:green">False</strong>
								</g:if>
								<g:else>
									<strong style="color:red">True </strong>  |<g:link action="unlock_customer" id="${customerInstance.id}" params="[query: query, search:'true' ]"> Unlock</g:link>
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
