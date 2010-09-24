
<%@ page import="com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <g:javascript library="prototype" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <div style="margin:20px 0px; border:1px solid; padding:15px;">
                <g:form method="post" action="findSchoolDistrict">
                    School District: <input type="text" name="query" />
                    <input type="submit" value="Search" />
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

                            <g:sortableColumn property="district" title="${message(code: 'customer.district.label', default: 'District')}" />

                            <g:sortableColumn property="fsdName" title="Name" />

                            <th>EntryDate</th>

                            <th>Placed Order</th>

                            <th>Assessment</th>

                            <g:sortableColumn property="isNew" title="New" />

                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "district")}</g:link></td>

                            <td>${fieldValue(bean: customerInstance, field: "fsdName")}</td>

                            <td><g:formatDate format="MM/dd/yyyy" date="${customerInstance.dateCreated}" /></td>

                            <td>
                            <sks:orderCheckbox name="placedOrder"
                                               id="placedOrder"
                                               id="${customerInstance.id}" />
                            </td>

                            <td>
                            <sks:assessmentCheckbox name="assessment"
                                               id="assessment"
                                               id="${customerInstance.id}" />
                            </td>

                            <td>
                            <g:checkBox name='isNew'
                                        value="${customerInstance.isNew}"
                                        onclick="${remoteFunction(action:'toggleNew', id:customerInstance.id, params:'\'isNew=\' + this.checked')}" />
                            </td>

                            <td width="120px">
                            <g:link controller="customer" action="other_delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" id="${customerInstance.id}">Delete</g:link> | 
                            <g:link controller="customer" action="edit" id="${customerInstance.id}">Edit</g:link> | 
                            <g:link controller="customer" action="show" id="${customerInstance.id}">View</g:link>
                            </td>

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
