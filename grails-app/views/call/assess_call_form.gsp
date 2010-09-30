<%@ page import="com.superkids.domain.ShippingDate; com.superkids.domain.CallResult;" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="caller" />
<g:javascript library="jquery" plugin="jquery"/>
  <jqui:resources/> 
<title>Caller Home</title>
</head>
<body>

	<script type="text/javascript">
		$(document).ready(function(){

			$("#callbackDate").datepicker({dateFormat: 'mm/dd/yy'});

			//When page loads...
			$(".tab_content").hide(); //Hide all content
			$("ul.tabs li:first").addClass("active").show(); //Activate first tab
			$(".tab_content:first").show(); //Show first tab content

			//On Click Event
			$("ul.tabs li").click(function() {

				$("ul.tabs li").removeClass("active"); //Remove any "active" class
				$(this).addClass("active"); //Add "active" class to selected tab
				$(".tab_content").hide(); //Hide all tab content

				var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
				$(activeTab).fadeIn(); //Fade in the active ID content
				return false;
			});

		});
    </script>

    <style type="text/css">

        input, select, textarea {
          background:#FFF3E0;
        }

        .prop .textField {
            width:300px
        }

        .contact {
            width:400px;
            margin: 10px 10px 0 0;
        }

        .contact td {
            padding:0 5px;
        }
    </style>

    <g:form>

		<g:hiddenField name="id" value="${customerInstance?.id}" />

		<div class="nav" style="padding: 0 12px; height:27px; line-height:27px">
			<g:render template="caller_nav"/>
				<g:if test="${queue}"><g:render template="caller_assess_controls" model="[customerInstance: customerInstance]"/> </g:if>
				<g:else>
					<span  style="margin-left:290px;" class="callerButton"><g:link controller="call" action="next_assess_call">Start Calling</g:link></span>
				</g:else>
		</div>

		<div class="body" style="width:1250px">
			<ul class="tabs">
				<li><a href="#tab1">Customer Information</a></li>
				<sks:productAssessmentNav id="${customerInstance?.id}"/>
				<!-- <li><a href="#tab4">Final Questions</a></li> -->
			</ul>

				<div id="tab1" class="tab_content">
					<div class="dialog">
						<div id="column1" style="width:415px; float:left">
						<table style="width:400px; margin: 10px 10px 0px 0; margin-left:0">
							<tbody>
							<tr class="prop">
								<td valign="top" class="name">
									<label><g:message code="customer.id.label" default="ID" /></label>
								</td>
								<td valign="top" class="value">
									<span style="padding:0px 5px; line-height:20px;">${customerInstance?.id}</span>
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="district"><g:message code="customer.district.label" default="District" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">

									<g:textField class="textField" name="district" value="${customerInstance?.district}" style="width:300px;" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="address.street"><g:message code="address.street.label" default="Street" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street', 'errors')}">
									<g:textField class="textField" name="address.street" value="${customerInstance?.address?.street}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="address.street2"><g:message code="address.street2.label" default="Street 2" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street2', 'errors')}">
									<g:textField class="textField" name="address.street2" value="${customerInstance?.address?.street2}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="address.city"><g:message code="address.city.label" default="City" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'city', 'errors')}">
									<g:textField class="textField" name="address.city" value="${customerInstance?.address?.city}" style="width:150px; margin-right:10px;" />
									<label for="address.state"><g:message code="address.state.label" default="State" /></label>
									<g:textField class="textField" name="address.state" value="${customerInstance?.address?.state}" style="width:35px;  margin-right:10px;"/>
									<label for="address.zip"><g:message code="address.zip.label" default="Zip" /></label>
									<g:textField class="textField" name="address.zip" value="${fieldValue(bean: customerInstance?.address, field: 'zip')}" style="width:50px" />
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="Students" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
									<g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="column2" style="width:500px; float:left">
					<table style="width:500px;margin-top: 10px; margin-left: 0px; margin-right:10px;">
						<tbody>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
								</td>
								<td valign="top">
									<g:textField style="width:150px;" name="phone" value="${customerInstance?.phone}" />
									<label for="callbackDate" style="padding: 0 10px 0 50px;"><g:message code="callback.date" default="Callback Date" /></label>
									<input type="text" style="width:90px" id="callbackDate" />
								</td>

							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
									<g:textField style="width:150px;" class="textField" name="fax" value="${customerInstance?.fax}" />
									<label for="callbackTime" style="padding: 0 10px 0 50px;"><g:message code="callback.date" default="Callback Time" /></label>
									<input type="text" style="width:90px" id="callbackTime" />
								</td>

							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="fax"><g:message code="customer.website.label" default="Website" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'website', 'errors')}">
									<g:textField class="textField" name="fax" value="${customerInstance?.website}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="deliveryAddress.street"><g:message code="address.street.label" default="Del. Street" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'street', 'errors')}">
									<g:textField class="textField" name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="deliveryAddress.street2"><g:message code="address.street2.label" default="Del. Street 2" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street2', 'errors')}">
									<g:textField class="textField" name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="deliveryAddress.city"><g:message code="address.city.label" default="Del. City" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'city', 'errors')}">
									<g:textField class="textField" name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" style="width:150px; margin-right:10px;" />
									<label for="deliveryAddress.state"><g:message code="deliveryAddress.state.label" default="State" /></label>
									<g:textField class="textField" name="deliveryAddress.state" value="${customerInstance?.deliveryAddress?.state}" style="width:35px;  margin-right:10px;"/>
									<label for="deliveryAddress.zip"><g:message code="deliveryAddress.zip.label" default="Zip" /></label>
									<g:textField class="textField" name="deliveryAddress.zip" value="${fieldValue(bean: customerInstance?.deliveryAddress, field: 'zip')}" style="width:50px" />
								</td>
							</tr>
						</tbody>
					</table>

					<table style="width:500px;margin-top: 10px; margin-left: 0px; margin-right:10px;">
					</table>


				</div>

				<div id="column3" style="width:280px; float:right">

				<table style="margin: 10px 0 10px 0; width:280px" class="callerRecord">
						<tbody>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="call.result"><strong>Call Result</strong></label>
								</td>
								<td valign="top" class="value">
									 <g:select style="width:175px" id="call.result" name='type.id' value="${call?.result?.id}"
										noSelection="${['null':'Select One...']}"
										from='${CallResult.enumConstants}'></g:select>
								</td>
							</tr>
							<tr>
							  <td></td>
							  <td>
								<br />
								<h3>Previous Calls</h3>
								<br/>
							  </td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									Caller:
								</td>
								<td valign="top" class="value">
									Mr. Second Caller
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									Date
								</td>
								<td valign="top" class="value">
									1/12/2010
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									Result
								</td>
								<td valign="top" class="value">
									Voicemail/Answering Machine
								</td>
							</tr>

							<tr>
							  <td class="name">
							  &nbsp;
							  </td>
							  <td class="value">
							  &nbsp;
							  </td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									Caller:
								</td>
								<td valign="top" class="value">
									Mr. First Caller
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									Date
								</td>
								<td valign="top" class="value">
									7/16/2009
								</td>
							</tr>


							<tr class="prop">
								<td valign="top" class="name">
									Result
								</td>
								<td valign="top" class="value">
									Voicemail/Answering Machine
								</td>
							</tr>
						</tbody>
					</table>

				</div>

					</div>
				</div>

				<sks:productAssessmentTabs id="${customerInstance?.id}" />
				<table style="margin:10px 10px 0px 0px; width:393px; position:absolute; top:465px; left:845px; border:none; height:250px;">
					<tbody>
						<tr>
							<td class="prop" style=" background-image:url(${resource(dir:'images', file:'callnote.png')}); background-repeat:no-repeat">
								<h3 style="padding-top:10px; padding-left:10px">Operator Comments</h3>
								<br />
								<g:textArea style="width:355px; height:175px; background:none; margin-left:10px" name="notes" value="${callInstance?.notes}"/>
							</td>
						</tr>
					</tbody>
				</table>


			</table>



		</div>
	</g:form>

</body>
</html>