
<%@ page import="com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<jqui:resources/>
        <title><g:message code="default.list.label" args="[entityName]" /></title>

		<script type="text/javascript" src="${resource(dir:'js', file:'sks.js')}">
		</script>

		<g:javascript library="jquery"/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <div style="margin:20px 0 0 0; padding:15px;">
                <g:form method="post" action="findSchoolDistrict">
                    <strong>School District:</strong> <input  style="width:300px" type="text" name="query" />
                    <input type="submit" value="Search" id="customerSearchButton" />
                </g:form>
            </div>
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="seq" title="${message(code: 'customer.seq.label', default: 'Seq')}" />

                            <g:sortableColumn property="source" title="${message(code: 'customer.source.label', default: 'Source')}" />

                            <g:sortableColumn property="district" title="${message(code: 'customer.district.label', default: 'District')}" />

                            <g:sortableColumn property="fsdName" title="Name" />

                            <g:sortableColumn property="dateCreated" title="Entry Date" />

                            <g:sortableColumn property="hasPlacedCurrentOrder" title="Ordered" />

                            <g:sortableColumn property="hasCompletedCurrentAssessment" title="Assessed" />

                            <g:sortableColumn property="newCustomer" title="New" />

							<g:sortableColumn property="duplicate" title="Dup." />

                            <g:sortableColumn property="topCustomer" title="Top 100" />

                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td style="width:32px;">${customerInstance?.seq}</td>

                            <td style="width:32px;">${customerInstance?.source}</td>

                            <td><g:link action="show" id="${customerInstance.id}">
								<g:if test="${customerInstance.deleted}">
									<span class="deleted">
									    ${fieldValue(bean: customerInstance, field: "district")}
									</span>
								</g:if>
								<g:else>
									${fieldValue(bean: customerInstance, field: "district")}
								</g:else>
							</g:link></td>

                            <td>
								<g:if test="${customerInstance.deleted}">
									<span class="deleted">
									    ${fieldValue(bean: customerInstance, field: "fsdName")}
									</span>
								</g:if>
								<g:else>
									${fieldValue(bean: customerInstance, field: "fsdName")}
								</g:else>
								</td>

                            <td style="width:80px"><g:formatDate format="MM/dd/yyyy" date="${customerInstance.dateCreated}" /></td>

                            <td style="width:50px">
                          	    <sks:orderCheckbox name="placedOrder" id="${customerInstance.id}" />
                            </td>

                            <td style="width:55px">
                        	    <sks:assessmentCheckbox name="assessment" id="${customerInstance.id}" />
                            </td>

                            <td width="25px">
                                    <g:if test="${customerInstance.newCustomer}">
                                        <g:link controller="customer" action="toggleNew" id="${customerInstance.id}" params='[newCustomer:"false", rController:"customer", rAction:"list", sort: "${sort}", offset: "${offset}"]'><img src="/SuperKids/images/true-g.png" height="18" width="18"></g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="customer" action="toggleNew" id="${customerInstance.id}" params='[newCustomer:"true", rController:"customer", rAction:"list", sort: "${sort}", offset: "${offset}"]'><img src="/SuperKids/images/false.png" height="18" width="18"></g:link>
                                    </g:else>
                            </td>
							<td width="50px">
                          	    <g:if test="${customerInstance.duplicate}">
									<g:link controller="customer" action="toggleDuplicate" id="${customerInstance.id}" params='[duplicate:"false", rController:"customer", rAction:"list", sort: "${sort}", offset: "${offset}"]'><img src="/SuperKids/images/true-r.png" height="18" width="18"></g:link>
								</g:if>
								<g:else>
									<g:link controller="customer" action="toggleDuplicate" id="${customerInstance.id}" params='[duplicate:"true", rController:"customer", rAction:"list", sort: "${sort}", offset: "${offset}"]'><img src="/SuperKids/images/false.png" height="18" width="18"></g:link>
								</g:else>

                            </td>
                            <td width="50px">
                        	    <sks:propertyCheckbox id="${customerInstance.id}" name="topCustomer" property="topCustomer" />
                            </td>

                            <td width="110px">

                            <g:link controller="customer" class="button" action="edit" id="${customerInstance.id}" params='[sort:"${sort}", offset:"${offset}", rController:"customer", rAction:"list"]'>Edit</g:link>
                            <g:link controller="customer" class="button" action="show" id="${customerInstance.id}" params='[sort:"${sort}", offset:"${offset}", rController:"customer", rAction:"list"]' >View</g:link>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" maxsteps="32" />
            </div>
        </div>
    </body>
</html>
