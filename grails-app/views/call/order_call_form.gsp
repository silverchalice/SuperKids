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
      $(document).ready(function()
      {
        $("#callbackDate").datepicker({dateFormat: 'mm/dd/yy'});
      })
      
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

    <g:form controller="call">

		<g:hiddenField name="id" value="${customerInstance?.id}" />
		<g:hiddenField name="offset" value="${offset}" /> 

		<div class="nav" style="padding: 1px 12px; height:27px; line-height:27px;">
			<g:render template="caller_nav"/>
			<g:if test="${queue}"><g:render template="caller_controls" model="[customerInstance: customerInstance]"/> </g:if>
			<g:else>
				<span  style="margin-left:340px;" class="callerButton"><g:link controller="call" action="next_order_call">Start Calling</g:link></span>
			</g:else>

		</div>

		<div class="body" style="width:1200px">
			<div class="dialog">

				<div id="row1" style="width:400px; float:left; margin-right:10px; ">
				<table style="width:400px; margin: 10px 10px 0px 0; margin-left:0">
					<tbody>

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
					 </tbody>
				 </table>
				<table class="contact" style="width:400px">
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
								<label for="fsdEmail"><g:message code="customer.fsdEmail.label" default="Email" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdEmail', 'errors')}">
								<g:textField class="textField" name="fsdEmail" value="${customerInstance?.fsdEmail}" />
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
					</tbody>
				 </table>
				 <table class="contact">
					<tbody>
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
					</tbody>
				</table>
				 <table class="contact">
					<tbody>
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
				<table style="margin:10px 10px 0px 0px; width:400px; border:none; height:250px;">
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

						</tr>
					</tbody>
				</table>
					  <table style="margin: 10px 10px 10px 0;width:500px; ">
						   <tbody>
							   <tr class="prop">
								   <td valign="top" class="name">
									   <label for="hasBakery"><g:message code="customer.hasBakery.label" default="Has Bakery" /></label>
								   </td>
								   <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'hasBakery', 'errors')}">
									   <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
								   </td>
							   </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchaseFreshBread"><g:message code="customer.purchaseFreshBread.label" default="Purchase Fresh Bread" /></label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFreshBread', 'errors')}">
									  <g:checkBox name="purchaseFreshBread" value="${customerInstance?.purchaseFreshBread}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchaseFrozenBread"><g:message code="customer.purchaseFrozenBread.label" default="Purchase Frozen Bread" /></label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFrozenBread', 'errors')}">
									  <g:checkBox name="purchaseFrozenBread" value="${customerInstance?.purchaseFrozenBread}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchaseFrozenFood"><g:message code="customer.purchaseFrozenFood.label" default="Purchase Frozen Food" /></label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFrozenFood', 'errors')}">
									  <g:checkBox name="purchaseFrozenFood" value="${customerInstance?.purchaseFrozenFood}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchasePreparedFood"><g:message code="customer.purchasePreparedFood.label" default="Purchase Prepared Food" /></label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchasePreparedFood', 'errors')}">
									  <g:checkBox name="purchasePreparedFood" value="${customerInstance?.purchasePreparedFood}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="receivedCurrentMailing"><g:message code="customer.receivedCurrentMailing.label" default="Received Current Mailing" /></label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'receivedCurrentMailing', 'errors')}">
									  <g:checkBox name="receivedCurrentMailing" value="${customerInstance?.receivedCurrentMailing}" />
								  </td>
							  </tr>
							  <tr class="prop">
									<td valign="top" class="name">
										<label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="Students In District" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
										<g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
									</td>
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

						   </tbody>
						</table>
				</div>

				<div id="column3" style="width:280px; float:right">
					  <table style="margin: 10px 0 0 0; width:280px; padding:0px;">
						<tbody>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="result"><strong>Call Result</strong></label>
								</td>
								<td valign="top" class="value">
									 <g:select style="width:175px" id="result" name='result' value="${call?.result?.id}"
										noSelection="${['null':'Select One...']}"
										from='${CallResult.enumConstants}'></g:select>
							</tr>

						</tbody>
					</table>

					<table style="margin: 10px 0 10px 0; width:280px" class="callerRecord">
						<tbody>
							<tr>
							  <td></td>
							  <td>
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

					<table>
					  <tbody>
						<tr class="prop">
						  <td class="name"></td>
						  <td class="value"><h3>Order Samples</h3></td>
						</tr>

						<g:each in="${products}" var="product" >
						  <tr class="prop">
							<td class="name">
							  <g:checkBox name="order.${product.name}"/>
							</td>
							<td class="value">
							  ${product.name}
							</td>
						  </tr>

						</g:each>
					  </tbody>
					</table>

					<table style="margin-top:10px">
						<tbody>
							<tr class="prop">
								<td>
									<h3>I would like my order sent in</h3>
								</td>
							</tr>
							<tr class="prop">
								<td>
									<g:select name="order.shippingDate"
									  from="${ShippingDate.list()}"
									  style="width:220px;"
									  noSelection="${['null':'Select a Shipping Date...']}" />
								</td>
							</tr>
						</tbody>
					</table>

				</div>

				</div>

			</div>
		</div>
    </g:form>
</body>
</html>