
<%@ page import="com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources/>
        <title><g:message code="default.list.label" args="[entityName]" /></title>

		<script type="text/javascript" src="${resource(dir:'js', file:'sks.js')}">
		</script>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <div style="margin:20px 0 0 0; padding:15px;">
                <g:form method="post" action="findSchoolDistrict">
                    <strong>School District:</strong> <input type="text" name="query" />
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

                            <g:sortableColumn property="district" title="${message(code: 'customer.district.label', default: 'District')}" />

                            <g:sortableColumn property="fsdName" title="Name" />

                            <th>EntryDate</th>

                            <th>Placed Order</th>

                            <th>Assessment</th>

                            <g:sortableColumn property="newCustomer" title="New" />

                            <th>Previous Participant</th>

                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td style="width:36px;">${customerInstance?.seq}</td>

                            <td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "district")}</g:link></td>

                            <td>${fieldValue(bean: customerInstance, field: "fsdName")}</td>

                            <td style="width:80px"><g:formatDate format="MM/dd/yyyy" date="${customerInstance.dateCreated}" /></td>

                            <td style="width:80px">
                          	    <sks:orderCheckbox name="placedOrder" id="${customerInstance.id}" />
                            </td>

                            <td style="width:80px">
                        	    <sks:assessmentCheckbox name="assessment" id="${customerInstance.id}" />
                            </td>

                            <td width="40px">
                                    <g:if test="${customerInstance.newCustomer}">
                                        <g:link controller="customer" action="toggleNew" id="${customerInstance.id}" params="[newCustomer:'false', rController:'customer', rAction:'list']"><img src="/SuperKids/images/true-g.gif" height="18" width="18"></g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="customer" action="toggleNew" id="${customerInstance.id}" params="[newCustomer:'true', rController:'customer', rAction:'list']"><img src="/SuperKids/images/false.gif" height="18" width="18"></g:link>
                                    </g:else>
                            </td>

                            <td width="20px">
                        	    <sks:propertyCheckbox id="${customerInstance.id}" name="pastParticipant" property="pastParticipant" />
                            </td>

                            <td width="180px">
                            <g:link controller="customer" class="button" action="other_delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" id="${customerInstance.id}">Delete</g:link>
                            <g:link controller="customer" class="button" action="edit" id="${customerInstance.id}">Edit</g:link>
                            <g:link controller="customer" class="button" action="show" id="${customerInstance.id}">View</g:link>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" maxsteps="20" />
            </div>
        </div>
    </body>
</html>
