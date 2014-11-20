
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

						<td valign="top" class="value">${fieldValue(bean: customer, field: "email")}</td>

					</tr>
					<tr class="prop">
						<td valign="top" class="name">Phone</td>

						<td valign="top" class="value">${fieldValue(bean: customer, field: "phone")}</td>

					</tr>



					
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.address" default="Address" /></td>

                            <td valign="top" class="value">
								${customer?.deliveryAddress?.street}
							    <g:if test="${customer?.deliveryAddress?.street2}">${customer?.deliveryAddress?.street2}</g:if>
							</td>

                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.deliveryAddress" default="City/State/Zip" /></td>

                            <td valign="top" class="value">${customer?.deliveryAddress?.city} ${customer?.deliveryAddress?.state}, ${customer?.deliveryAddress?.zip}</td>

                        </tr>
                    </tbody>
                </table>


				<h2 style="margin: 10px 2px 5px 2">Assessments</h2>

				<g:each in="${assessments}" var="assessment">
					<g:render template="view_product_assessment" model="[assessment: assessment]" />
				</g:each>
				<g:each in="${dnrProducts}" var="productOrder">
					<g:render template="view_dnr_product" model="[productOrder: productOrder]" />
				</g:each>
				<h2 style="margin: 10px 2px 5px 2">Final Questions</h2>
				 <h3>Are there any whole grain-rich foods on your menu that aren&#8217;t meeting your or students&#8217; expectations, and if so, why not?</h3>
				<p style="margin:2px; padding:5px; border:1px solid gray; height:150px; background:#F7F7F7">${customer?.expectationsNotMetFeedback} </p>  <br/>
				<h3>Program Feedback</h3>
				<p style="margin:2px; padding:5px; border:1px solid gray; height:150px; background:#F7F7F7">${customer?.programFeedback}</p>  <br/>
				<h3>If you've participated in the SuperKids Program in the past, did you add any of the items you've sampled to your menu?</h3>
				<p style="margin:2px; padding:5px; border:1px solid gray; height:150px; background:#F7F7F7">${g.formatBoolean(boolean: customer?.addedPastItemsToMenu, true: 'Yes', false: 'No')}</p>  <br/>




            </div>
        </div>
    </body>
</html>
