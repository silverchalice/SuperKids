<%@ page import="com.superkids.domain.CustomerStatus; com.superkids.domain.Product" %>
<%@ page import="com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.ShippingDate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
 		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources/>
		<script type="text/javascript" src="${resource(dir:'js', file:'sks.js')}">
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#assessForm').dialog({ autoOpen: false, width:500, modal:true });
				$('#completeAssessmentForm').dialog({ autoOpen: false, width:500, modal:true });
				$('#submitAssessment').button();
				$('#addBrokerButton').button();
			});

			function showAssessForm(poId) {
				$('#productOrderId').val(poId) ;
				$('#assessForm').dialog("open");
			}

            function showCompleteAssessForm() {
              $('#completeAssessmentForm').dialog("open")
            }

		</script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
			<div style="margin:20px 0px; padding:15px; clear:both;">
                <g:form method="post" action="findSchoolDistrict">
                    <strong>School District:</strong> <input type="text" name="query" />
                    <input type="submit" value="Search" id="customerSearchButton"/>
                </g:form>
            </div>
					
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<h1 style="display:inline"><g:message code="default.show.label" args="[entityName]" /></h1>  <h1 style="display:inline; margin-left:34%">FSD Login Information</h1>
			<br/>			
			<div style="float:left; width:40%;">
                <table>
                    <tbody>




                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">School District</td>
                            
                            <td valign="top" class="value">${customerInstance?.district}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Order Placed</td>
                            
                            <td valign="top" class="value"><sks:orderCheckbox id="${customerInstance?.id}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Assessment Taken</td>
                            
                            <td valign="top" class="value"><sks:assessmentCheckbox id="${customerInstance?.id}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Previous Participant</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="pastParticipant" property="pastParticipant" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Phone</td>
                            
                            <td valign="top" class="value">${customerInstance?.phone}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Fax</td>
                            
                            <td valign="top" class="value">${customerInstance?.fax}</td>
                            
                        </tr>
						<tr class="prop">
							<td class="name">&nbsp;</td>
							<td class="value">
								<h3>Food Service Director</h3>
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.fsdName.label" default="Name" /></label>
							</td>
							<td valign="top" class="value">
								${customerInstance?.fsdName}
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.fsdTitle.label" default="Title" /></label>
							</td>
							<td valign="top" class="value">
								${customerInstance?.fsdTitle}
							</td>
						</tr>
						<tr class="prop">
							<td class="name">&nbsp;</td>
							<td class="value">
								<h3>Chief Dietitian</h3>
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.cdName.label" default="Name" /></label>
							</td>
							<td valign="top" class="value">
								${customerInstance?.cdName}
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.cdEmail.label" default="Email" /></label>
							</td>
							<td valign="top" class="value">
								${customerInstance?.cdEmail}
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.cdTitle.label" default="Title" /></label>
							</td>
							<td valign="top" class="value">
								${customerInstance?.cdTitle}
							</td>
						</tr>
						<tr class="prop">
							<td class="name">&nbsp;</td>
							<td class="value">
								<h3>Nutritional Director</h3>
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.ndName.label" default="Name" /></label>
							</td>
							<td valign="top" class="value">
								${customerInstance?.ndName}
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.ndEmail.label" default="Email" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'ndEmail', 'errors')}">
								${customerInstance?.ndEmail}
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label><g:message code="customer.ndTitle.label" default="Title" /></label>
							</td>
							<td valign="top" class="value">
								${customerInstance?.ndTitle}
							</td>
						</tr>

                        <tr class="prop">
                            <td valign="top" class="name">Sign up Date</td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM/dd/yyyy" date="${customerInstance.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Last Updated Date</td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM/dd/yyyy" date="${customerInstance.lastUpdated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Address</td>
                            
                            <td valign="top" class="value">${customerInstance.address?.street}<br />
                            ${customerInstance.address?.street2}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">City, State Zip</td>
                            
                            <td valign="top" class="value">${customerInstance?.address?.city}, ${customerInstance.address?.state} ${customerInstance.address?.zip}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Added By</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Entry Name</td>
                            
                            <td valign="top" class="value">${customerInstance?.fsdName}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Delivery Information</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Address</td>
                            
                            <td valign="top" class="value">${customerInstance?.deliveryAddress.street}<br />
                            ${customerInstance?.deliveryAddress?.street2}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">City, State Zip</td>
                            
                            <td valign="top" class="value">${customerInstance?.deliveryAddress?.city}, ${customerInstance?.deliveryAddress.state} ${customerInstance?.deliveryAddress.zip}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Properties</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Proof and bake</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="hasBakery" property="hasBakery" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Bake Frozen Bread</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchaseFrozenBread" property="purchaseFrozenBread" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Purchase prepared foods</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchasePreparedFood" property="purchasePreparedFood" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Purchase frozen foods</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchaseFrozenFood" property="purchaseFrozenFood" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Purchase fresh bakery</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchaseFreshBread" property="purchaseFreshBread" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Student Information</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># of Facilities</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "facilities")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># of Students in District</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "studentsInDistrict")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># of Students Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "studentsInDistrict")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># Breakfasts Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "breakfastsServed")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># Lunches Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "lunchesServed")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># Snacks Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "snacksServed")}</td>
                            
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name">Entry Name</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdName")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>

				</div>

			<div style="float:left; margin-left:10px; width:40%;">

                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">Username</td>

                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "email")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Name</td>

                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdName")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Entry Date</td>

                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "dateCreated")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Last Login</td>

                            <td valign="top" class="value"></td>

                        </tr>

                    </tbody>
                </table>
				<h1>Order Details</h1>
				<g:if test="${customerInstance?.status != CustomerStatus.HAS_NOT_ORDERED}">
					<g:render template="ordered_items" model="[customerInstance: customerInstance, products: products, show: 'true']" />
				</g:if>
				<g:else>
					<g:render template="manual_order" model="[customerInstance: customerInstance, products: products,  show: 'true']" />
				</g:else>
				<p>&nbsp;</p>

                <h1>Customer Notes</h1>
                <p style="margin:2px; padding:5px; border:1px solid gray; height:150px; background:#F7F7F7">${customerInstance?.notes}</p>

            </div>


        </div>
    </body>
</html>s
