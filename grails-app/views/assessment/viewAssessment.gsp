
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
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

						<tr valign="top">
							<td colspan="2"><h2 style="margin: 0 2px 2px 0">FSD Contact Info</h2></td>
						</tr>

                        <tr class="prop">
                            <td valign="top" class="name">Name</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customer, field: "fsdName")}</td>
                            
                        </tr>
					<tr class="prop">
						<td valign="top" class="name">Email</td>

						<td valign="top" class="value">${fieldValue(bean: customer, field: "fsdEmail")}</td>

					</tr>
					<tr class="prop">
						<td valign="top" class="name">Phone</td>

						<td valign="top" class="value">${fieldValue(bean: customer, field: "phone")}</td>

					</tr>



					
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.address" default="Address" /></td>

                            <td valign="top" class="value">
								${customer?.deliveryAddress.street}
							    <g:if test="${customer?.deliveryAddress.street2}">${customer?.deliveryAddress.street2}</g:if>
							</td>

                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.deliveryAddress" default="City/State/Zip" /></td>

                            <td valign="top" class="value">${customer?.deliveryAddress.city} ${customer?.deliveryAddress.state}, ${customer?.deliveryAddress.zip}</td>

                        </tr>
                    </tbody>
                </table>


				<h2 style="margin: 10px 2px 5px 2">Assessments</h2>

				<g:each in="${assessments}" var="assessment">
					<g:render template="view_product_assessment" model="[assessment: assessment]" />
				</g:each>




            </div>
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
