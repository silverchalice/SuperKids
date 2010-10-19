
<%@ page import="com.superkids.domain.CustomerStatus; com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
							<th>Customer</th>
							<th>Contact Time</th>
							<th>Products Assessed</th>
                            <th>Completed</th>
							<th>View</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<td>${customerInstance.district}</td>
							<td style="width:200px;">
								<g:if test="${customerInstance.fall}"> Fall</g:if>
								<g:if test="${customerInstance.spring}"> Spring,</g:if> 
								<g:if test="${customerInstance.am}"> AM</g:if>
								<g:if test="${customerInstance.pm}"> PM</g:if>

							</td>
							<td style="width:120px;">
								<sks:customerAssessmentTotal id="${customerInstance.id}"/>
							</td>
							<td style="width:100px;">
                                                            <sks:completedAssessmentCheckbox name="completedAssessment" id="${customerInstance.id}" />
							</td>
							<td style="width:100px;"><g:link action="viewAssessment" id="${customerInstance.id}">View</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
