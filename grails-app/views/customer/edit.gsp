

<%@ page import="com.superkids.domain.CustomerStatus; com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.ShippingDate" %>
<%@ page import="com.superkids.domain.CustomerStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
 		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources/>		
		<style type="text/css">
			input {
				width:auto
			}

			#assessForm {
				width:500px;
			}

			#assessForm input {
				width:auto
			}

		</style>
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
            <span class="menuButton"><g:link class="create" action="create">Add</g:link></span>
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
            <g:hasErrors bean="${customerInstance}">
                <div class="errors">
                    <g:renderErrors bean="${customerInstance}" as="list" />
                </div>
            </g:hasErrors>
            <h1 style="display:inline"><g:message code="default.edit.label" args="[entityName]" /></h1>  <h1 style="display:inline; margin-left:35%">Order Details</h1>
			<br/>

            <div style="float:left;">
            <g:form method="post">
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                <g:hiddenField name="offset" value="${offset}" />
                <g:hiddenField name="query" value="${query}" />
                <g:hiddenField name="sort" value="${sort}" />
                <g:hiddenField name="rController" value="${rController}" />
                <g:hiddenField name="rAction" value="${rAction}" />

                <div class="dialog">
				<div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
                    <table style=" width:380px;">
                        <tbody>
                            <tr class="prop">
                                <td class="name"></td>
                                <td class="value">
                                    <h3>Food Service Director</h3>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fsdName"><g:message code="customer.fsdName.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdName', 'errors')}">
                                    <g:textField class="textField" name="fsdName" value="${customerInstance?.fsdName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fsdTitle"><g:message code="customer.fsdTitle.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdTitle', 'errors')}">
                                    <g:textField class="textField" name="fsdTitle" value="${customerInstance?.fsdTitle}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="customer.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${customerInstance?.email}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="customer.password.label" default="Password" /></label>
                                </td>
                                <td valign="top">
                                    <g:link controller="home" action="a_change_c_password" id="${customerInstance?.id}">Change Password</g:link>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="customer.status.label" default="Status" /></label>
                                </td>
                                <td valign="top">
                                    <g:select name="status" from="${statusList}" optionKey="key" optionValue="value" value="${customerInstance?.status}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">Classification</td>

                               <td>
                                   <g:textField name="source" value="${customerInstance?.source}" />
                               </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="topCustomer">Top 100</label>
                                </td>
                                <td valign="top">
                                    <g:checkBox name="topCustomer" value="${customerInstance?.topCustomer}" />
                                </td>
                            </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="hasCompletedCurrentAssessment">Completed Assessment</label>
                            </td>
                            <td valign="top">
                                <g:checkBox name="hasCompletedCurrentAssessment" value="${customerInstance?.hasCompletedCurrentAssessment}" />
                            </td>
                        </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="newCustomer">New Customer</label>
                                </td>
                                <td valign="top">
                                    <g:checkBox name="newCustomer" value="${customerInstance?.newCustomer}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pastParticipant">Previous Participant</label>
                                </td>
                                <td valign="top">
                                    <g:checkBox name="pastParticipant" value="${customerInstance?.pastParticipant}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="invalidEmail">Invalid Email</label>
                                </td>
                                <td valign="top">
                                    <g:checkBox name="invalidEmail" value="${customerInstance?.invalidEmail}" />
                                </td>
                            </tr>

                            <tr class="prop">
								<td valign="top" class="name">
									   <label for="duplicate">Duplicate</label>
								   </td>
								   <td valign="top">
									   <g:checkBox name="duplicate" value="${customerInstance?.duplicate}" />
								   </td>
							   </tr>

                            <tr class="prop">
								<td valign="top" class="name">
									   <label for="deleted">Deleted</label>
								   </td>
								   <td valign="top">
									   <g:checkBox name="deleted" value="${customerInstance?.deleted}" />
								   </td>
							   </tr>
                            <tr class="prop">
								<td valign="top" class="name">
									   <label for="didNotReceiveMailing">Did Not Receive Email/Mailing</label>
								   </td>
								   <td valign="top">
									   <g:checkBox name="didNotReceiveMailing" value="${customerInstance?.didNotReceiveMailing}" />
								   </td>
							   </tr>
                            <tr class="prop">
                                <td class="name"></td>
                                <td class="value">
                                    <br />
                                    <h3>School District</h3>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="district"><g:message code="customer.district.label" default="District" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">
                                    <g:textField name="district" value="${customerInstance?.district}" />
                                </td>
                            </tr>
						<tr class="prop">
							<td valign="top" class="name">
							  <label for="timezone"><g:message code="customer.timezone.label" default="Timezone" /></label>
							</td>
							<td valign="top">
							   <g:textField name="timezone" value="${customerInstance?.timezone}" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
							  <label><g:message code="customer.address.street.label" default="Street" /></label>
							</td>
							<td valign="top">
							   <g:textField name="address.street" value="${customerInstance?.address?.street}" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
							  <label><g:message code="customer.address.street2.label" default="Street 2" /></label>
							</td>
							<td valign="top">
							   <g:textField name="address.street2" value="${customerInstance?.address?.street2}" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
							  <label><g:message code="customer.address.city.label" default="City" /></label>
							</td>
							<td valign="top">
							   <g:textField name="address.city" value="${customerInstance?.address?.city}" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
							  <label><g:message code="customer.deliveryAddress.state.label" default="State" /></label>
							</td>
							<td valign="top">
							   <g:textField name="address.state" value="${customerInstance?.address?.state}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
							  <label><g:message code="customer.address.zip.label" default="Zip" /></label>
							</td>
							<td valign="top">
							   <g:textField name="address.zip" value="${customerInstance?.address?.zip}" />
							</td>
						</tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.street.label" default="Del Street" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.street2.label" default="Del Street 2" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.city.label" default="Del City" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.state.label" default="Del State" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField name="deliveryAddress.state" value="${customerInstance?.deliveryAddress?.state}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.zip.label" default="Del Zip" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField name="deliveryAddress.zip" value="${customerInstance?.deliveryAddress?.zip}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${customerInstance?.phone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
                                    <g:textField name="fax" value="${customerInstance?.fax}" />
                                </td>
                            </tr>
						<tr class="prop">
							<td class="name"></td>
							<td class="value">
								<h3>Chief Dietitian</h3>
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
								<label for="cdName"><g:message code="customer.cdName.label" default="Name" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdName', 'errors')}">
								<g:textField class="textField" name="cdName" value="${customerInstance?.cdName}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label for="cdEmail"><g:message code="customer.cdEmail.label" default="Email" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdEmail', 'errors')}">
								<g:textField class="textField" name="cdEmail" value="${customerInstance?.cdEmail}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label for="cdTitle"><g:message code="customer.cdTitle.label" default="Title" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdTitle', 'errors')}">
								<g:textField class="textField" name="cdTitle" value="${customerInstance?.cdTitle}"/>
							</td>
						</tr>
						<tr class="prop">
							<td class="name"></td>
							<td class="value">
								<h3>Nutritional Director</h3>
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
								<label for="ndName"><g:message code="customer.ndName.label" default="Name" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'ndName', 'errors')}">
								<g:textField class="textField" name="ndName" value="${customerInstance?.ndName}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label for="ndEmail"><g:message code="customer.ndEmail.label" default="Email" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'ndEmail', 'errors')}">
								<g:textField class="textField" name="ndEmail" value="${customerInstance?.ndEmail}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label for="ndTitle"><g:message code="customer.ndTitle.label" default="Title" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'ndTitle', 'errors')}">
								<g:textField class="textField" name="ndTitle" value="${customerInstance?.ndTitle}" />
							</td>
						</tr>

                        </tbody>
                    </table>

                </div>

            </g:form>
            </div>
            <div style="float:left; margin-left:10px; width:420px;">

				<g:if test="${customerInstance.status != CustomerStatus.HAS_NOT_ORDERED}">
					<g:render template="ordered_items" model="[customerInstance: customerInstance, products: products]" />
				</g:if>
				<g:else>
					<g:render template="manual_order" model="[customerInstance: customerInstance, products: products]" />
				</g:else>

				<br/>


            <h1>Additional Information</h1>
            <table style="width: 360px;">
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="Students In District" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
                        <g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td colspan="2">Approximately how many students participate<br/> in your foodservice program?
                        <input type="text" name="studentsParticipate" size="4" maxlength="6" value="${customerInstance?.studentsParticipate}"></td>
                </tr>
                <tr class="prop">
                    <td colspan="2">
                        <strong>3.</strong>	Approximately what percent of those students<br/> are free or reduced?
                        <input  type="text" name="freeStudents" size="4" maxlength="6" value="${customerInstance?.freeStudents}"></td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="facilities"><g:message code="customer.facilities.label" default="Facilities" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'facilities', 'errors')}">
                        <g:textField name="facilities" value="${fieldValue(bean: customerInstance, field: 'facilities')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="breakfastsServed"><g:message code="customer.breakfastsServed.label" default="Breakfasts Served" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'breakfastsServed', 'errors')}">
                        <g:textField name="breakfastsServed" value="${fieldValue(bean: customerInstance, field: 'breakfastsServed')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="lunchesServed"><g:message code="customer.lunchesServed.label" default="Lunches Served" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'lunchesServed', 'errors')}">
                        <g:textField name="lunchesServed" value="${fieldValue(bean: customerInstance, field: 'lunchesServed')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="snacksServed"><g:message code="customer.snacksServed.label" default="Snacks Served" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'snacksServed', 'errors')}">
                        <g:textField name="snacksServed" value="${fieldValue(bean: customerInstance, field: 'snacksServed')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasBakery">We make our own bread products from
                        scratch in our bakery (proof & bake)</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'hasBakery', 'errors')}">
                        <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="monthlyFlourUsage">If yes, how much flour does your district use on a monthly basis in pounds?</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'monthlyFlourUsage', 'errors')}">
                        <g:textField class="textField" name="monthlyFlourUsage" value="${customerInstance?.monthlyFlourUsage}" />
                    </td>
                </tr>

                <tr>

                    <td colspan="2">When do you start look at new items for your menu?
                        <br/>
                        <input type="text" name="startLooking" value="${customerInstance?.startLooking}" size="55" maxlength="1000"></td>
                </tr>

                <tr>

                    <td colspan="2">When do you issue your bid?
                        <br/>
                        <input type="text" name="startBidding" value="${customerInstance?.startBidding}" size="55" maxlength="1000"></td>
                </tr>


                <tr>
                    <td colspan="2">Do you bake from scratch in your district? <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">a) If yes, do you use commodity flour? &nbsp; Whole Wheat Flour?  <g:checkBox name="useWholeWheatFlour" value="${customerInstance?.useWholeWheatFlour}" /> <br/> Ultragrain/ Healthy Choice T-2 with Ultragrain? <g:checkBox name="useUltragrainFlour" value="${customerInstance?.useUltragrainFlour}" />
                    </td>
                </tr>



                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="localBakeries">Do you work with a local bakery to supply your fresh bakery products?</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'localBakeries', 'errors')}">
                        <g:textField class="textField" name="localBakeries" value="${customerInstance?.localBakeries}" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">About Whole Grain Rich:
                    </td>
                </tr>
                <tr>
                    <td colspan="2">a) Are you ready for the 2013 Guidelines?  Yes: <g:checkBox name="readyFor2013" value="${customerInstance?.readyFor2013}" /> 2013 Guidelines? Yes: <g:checkBox name="readyFor2014" value="${customerInstance?.readyFor2014}" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">b)	What have been your biggest challenges? <br/>
                        <input type="text" name="wholeGrainChallenge" value="${customerInstance?.wholeGrainChallenge}" size="55" maxlength="1000"></td>
                </tr>
                <tr>
                    <td colspan="2">c)	What would you like to see food companies provide in terms of whole grain-rich? <br/>
                        <input type="text" name="wantedProducts" value="${customerInstance?.wantedProducts}" size="55" maxlength="1000"></td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Member of a Co-op</td>

                    <td valign="top" class="value"><g:checkBox name="coOpMember" value="${customerInstance?.coOpMember}"/></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Co-op Name</td>

                    <td valign="top" class="value"><g:textField class="texField" name="coOpName" value="${customerInstance.coOpName}" /></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Send Samples to Co-op</td>

                    <td valign="top" class="value"><g:checkBox name="coOpSamples" value="${customerInstance?.coOpSamples}"/></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Co-op Sample Delivery Address</td>

                    <td valign="top" class="value"><g:textField class="texField" name="coOpAddress" value="${customerInstance.coOpAddress}" /></td>
                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Contract Managed</td>

                    <td valign="top" class="value"><g:checkBox name="contractManaged" value="${customerInstance?.contractManaged}"/></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Contractor</td>

                    <td valign="top" class="value"><g:textField class="texField" name="contractManager" value="${customerInstance.contractManager}" /></td>
                </tr>


                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="seq"><g:message code="customer.seq.label" default="Sequence Number (DO NOT CHANGE)" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'seq', 'errors')}">
                        <g:textField name="seq" value="${fieldValue(bean: customerInstance, field: 'seq')}" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"  style="padding:0 0 0 0; line-height:13px;">Please list any special requests for the manufacturers you checked: <input type="text" name="otherComments" value="" size="25" maxlength="1000" style="float:right"></td>
                </tr>
                <tr class="prop">
                    <td colspan="2"><h3>Customer Notes</h3></td> </tr>
                <tr class="prop"><td colspan="2"><g:textArea cols="" rows="" value="${customerInstance?.opNotes}" name="opNotes" style="width:360px;"/></td></tr>
                </tbody>
            </table>


            <!-- <h1>Brokers/Distributors</h1>
            <table style="width:420px;">
                <thead>
                <th><strong>Name</strong></th>
                <th><strong>Email</strong></th>
                <th></th>
                </thead>
                <tbody>
                <g:each in="${customerInstance.brokers}" var="broker">
                    <tr>
                        <td>
                            ${broker?.name}
                        </td>
                        <td>
                            ${broker?.email}
                        </td>
                        <td>
                            <g:link controller="product" action="brokerEditFromEdit" id="${broker?.id}" params="[rController:'customer', rAction:'edit', rId:customerInstance.id]">Edit</g:link> | <g:link controller="product" action="brokerDeleteFromEdit" id="${broker?.id}" params="[rController:'customer', rAction:'edit', rId:customerInstance.id]">Delete</g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>

                <h1>Add Broker</h1>
				<g:form controller="${broker ? 'product' : 'home'}" action="${broker ? 'updateBroker': 'addBroker'}" method="post">
					<table cellpadding="5" cellspacing="0" border="0" style="width:420px;">

                          <tr> 
                              <td><strong>Broker/Distributor Name: </strong></td> 
                              <td><input type="text" name="name" size="20" maxlength="50" value="${broker?.name}"></td> 
                          </tr>                           <tr>
                              <td><strong>Representative Name: </strong></td> 
                              <td><input type="text" name="rep" size="20" maxlength="50" value="${broker?.rep}"></td>
                          </tr>
                          <tr> 
                              <td><strong>Email: </strong></td> 
                              <td><input type="text" name="email" size="20" maxlength="50" value="${broker?.email}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Telephone: </strong></td> 
                              <td><input type="text" name="phone" size="20" maxlength="50" value="${broker?.phone}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Fax: </strong></td> 
                              <td><input type="text" name="fax" size="20" maxlength="50" value="${broker?.fax}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Address: </strong></td> 
                              <td><input type="text" name="street" size="20" maxlength="255" value="${broker?.street}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong></strong></td> 
                              <td><input type="text" name="street2" size="20" maxlength="255" value="${broker?.street2}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>City: </strong></td> 
                              <td><input type="text" name="city" size="20" maxlength="50" value="${broker?.city}"></td> 
                          </tr> 
                          <tr> 			
                              <td><strong>State</strong></td> 
                              <td align="left"> 
                                    <g:select name="state" from="${states}"  value="${broker?.state}" />
                              </td> 
                          </tr> 
                          <tr> 
                              <td><strong>Zip: </strong></td> 
                              <td><input type="text" name="zip" size="10" maxlength="20" value="${broker?.zip}"></td> 
                          </tr> <g:hiddenField name="rController" value="customer" />
                              <g:hiddenField name="rAction" value="edit" />
                              <g:hiddenField name="rId" value="${customerInstance.id}" />
                              <g:hiddenField name="customerId" value="${customerInstance.id}" />
                              <g:hiddenField name="id" value="${broker?.id}" />
                          <tr>
                                <td>
                                    <input type="submit" name="add" value="Add" id="addBrokerButton" /> 
                                </td>
                          </tr>

					</table>
				</g:form>
                -->
			</div>
		</div>

    </body>

</html>
