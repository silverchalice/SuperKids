
<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="products" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <g:javascript library="prototype" />
        <g:javascript library="scriptaculous" />
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
              <sks:hasNotPlacedCurrentOrder>
                <div id="shoppingCartContent">
                    <g:if test="${foo}">
                        <g:render template="/shopping/contained" model="[productInstance:productInstance]" />
                    </g:if>
                    <g:else>
                        <g:render template="/shopping/initial" model="[productInstance:productInstance]" />
                    </g:else>
                </div>
                </sks:hasNotPlacedCurrentOrder>
                <p><g:link controller="testShoppingCart" action="show">View Cart</g:link></p>
               </div>
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.id.label" default="Id" /></td>

                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "id")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.name.label" default="Name" /></td>

                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "name")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.description.label" default="Description" /></td>

                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "description")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.details.label" default="Details" /></td>

                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "details")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.nutrition.label" default="Nutrition" /></td>

                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "nutrition")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.image.label" default="Image" /></td>

                            <td valign="top" class="value"><img src="${createLink(action:'displayImage', id:productInstance.id)}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.summary.label" default="Summary" /></td>

                            <td valign="top" class="value"><g:link action="downloadSummary" id="${productInstance.id}">Summary PDF</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.sponsor.label" default="Sponsor" /></td>

                            <td valign="top" class="value"><g:link controller="sponsor" action="show" id="${productInstance?.sponsor?.id}">${productInstance?.sponsor?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.parent" default="Parent ( if part of a Sample Pack)" /></td>

                            <td valign="top" class="value">
								<g:if test="${customerInstance?.parent}">${customerInstance?.parent.name}</g:if>
							    <g:else>None</g:else>
							</td>

                        </tr>

                    </tbody>
                </table>
            </div>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <div class="buttons">
                    <g:form>
                        <g:hiddenField name="id" value="${productInstance?.id}" />
                        <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                        <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:form>
                </div>
            </sec:ifAnyGranted>
        </div>
    </body>
</html>
