
<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <g:javascript library="prototype" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Product Administration</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div><br />
            </g:if>
            <p>Please choose a product to edit:</p><br />
            <div class="list">

                <g:form action="admin">
                    <label for="query">Search: </label><g:textField name="query" /> <g:submitButton name="submit" value="Search" />
                </g:form>

                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="liveProduct" title="Live" />

                            <g:sortableColumn property="name" title="Product Name" />

                            <g:sortableColumn property="bake" title="Bake" />

                            <th>&nbsp;Delete</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInstanceList}" status="i" var="productInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td width="25px">&nbsp;<g:checkBox name='isLive'
                                        value="${productInstance.liveProduct}"
                                        onclick="${remoteFunction(action:'toggleLive', id:productInstance.id, params:'\'liveProduct=\' + this.checked')}" /></td>

                            <td width="550px">&nbsp;<g:link action="edit" id="${productInstance.id}">${productInstance.name}</g:link></td>

                            <td width="520px">&nbsp;<sks:bakeCheckbox name="bake"
                                                  id="bake"
                                                  id="${productInstance.id}" /></td>

                            <td width="70px">&nbsp;&nbsp;<g:link action="other_delete" id="${productInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
