
<%@ page import="com.superkids.domain.Factoid" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'factoid.label', default: 'Factoid')}" />
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
                        
                            <g:sortableColumn property="liveFactoid" title="Live" />
                        
                            <g:sortableColumn property="content" title="${message(code: 'factoid.content.label', default: 'Content')}" />

                            <th>Delete</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${factoidInstanceList}" status="i" var="factoidInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            <g:checkBox name='liveFactoid'
                                        value="${factoidInstance.liveFactoid}"
                                        onclick="${remoteFunction(action:'toggleLive', id:factoidInstance.id, params:'\'liveFactoid=\' + this.checked')}" />
                            </td>
                        
                            <td><g:link controller="factoid" action="edit" id="${factoidInstance.id}">${fieldValue(bean: factoidInstance, field: "content")}</g:link></td>

                            <td><g:link controller="factoid" action="other_delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" id="${factoidInstance.id}">Delete</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${factoidInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
