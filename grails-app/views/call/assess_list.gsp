
<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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

                            <g:sortableColumn property="district" title="${message(code: 'customer.district.label', default: 'District')}" />

                            <th><g:message code="customer.address.label" default="Address" /></th>

                            <th><g:message code="customer.email.label" default="Email" /></th>

                            <g:sortableColumn property="phone" title="${message(code: 'customer.phone.label', default: 'Phone')}" />

                            <g:sortableColumn property="fax" title="${message(code: 'customer.fax.label', default: 'Fax')}" />

                            <g:sortableColumn property="studentsInDistrict" title="${message(code: 'customer.studentsInDistrict.label', default: 'Students')}" />

                            <g:sortableColumn property="fax" title="${message(code: 'customer.dateCreated.label', default: 'Date Created')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "district")}</g:link></td>

                            <td>${fieldValue(bean: customerInstance, field: "address")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "email")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "phone")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "fax")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "studentsInDistrict")}</td>

                            <td><g:formatDate format="MM/dd/yyyy" date="${customerInstance.dateCreated}" /></td>

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
