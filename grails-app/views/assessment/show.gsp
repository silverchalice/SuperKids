
<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>


    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body" style="max-width:800px">

            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<table>
			   <tbody>

				   <tr class="prop">
					   <td valign="top" class="name">District</td>

					   <td valign="top" class="value">${assessmentInstance?.customer?.district}</td>

				   </tr>
				   <tr class="prop">
					   <td valign="top" class="name">FSD Name</td>

					   <td valign="top" class="value">${assessmentInstance?.customer?.fsdName}</td>

				   </tr>
				   <tr class="prop">
					   <td valign="top" class="name">Product</td>

					   <td valign="top" class="value">${assessmentInstance?.product?.name}</td>

				   </tr>
               <tr class="prop">
                   <td valign="top" class="name">Origin</td>

                   <td valign="top" class="value">${assessmentInstance?.type}</td>

               </tr>
			   </tbody>
			</table>

			<g:render template="view_product_assessment" model="[assessment: assessmentInstance]" />
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>

        </div>
    </body>
</html>
