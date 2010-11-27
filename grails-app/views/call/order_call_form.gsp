<%@ page import="com.superkids.domain.ShippingDate; com.superkids.domain.CallResult;" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="caller" />
	<title>Caller Home</title>


</head>
<body>
	<link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'ui.selectmenu.css')}" />
	<script type="text/javascript" src="${resource(dir:'js', file:'ui.selectmenu.js')}"></script>
	<script type="text/javascript">
   		$(document).ready(function() {

   			$("#callbackDate").datepicker({dateFormat: 'mm/dd/yy'});

			var changedFlag;
			$(':input').bind('change', function() {
			    //console.log('changedFlag = true')
				changedFlag = 'true';
			});

			$("select#result").selectmenu({style:'dropdown'});
			$("select#shippingDate").selectmenu({style:'dropdown'});
             $("select#timezone").selectmenu({style:'dropdown'});

			$('#submit').click(function (e) {

				if(changedFlag == 'true' && $('#result').val() == "null") {
					return confirm('You made changes to the form, but did not choose a Call Result - your changes will not be saved. Do you want to continue?')
				} else {

					var productsChecked;
					var shippingDateSelected;
					var qualifiedSelected;
					var order;


					if ($("#products input:checked").length > 0) {
						productsChecked = 'true';
						order = 'true';
						//alert('productsChecked = true!');
					} else {
						productsChecked = 'false';
						//alert('productsChecked = false!');
					}

					if($('#shippingDate').val() == "null") {
						shippingDateSelected = 'false'
						//alert('shippingDateSelected = false!');
					} else {
						shippingDateSelected = 'true';
						order = 'true';
						//alert('shippingDateSelected = true!');
					}

					if($('#result').val() == "QUALIFIED") {
						qualifiedSelected = 'true';
						order = 'true';
						//alert('qualifiedSelected = true!')
					} else {
						qualifiedSelected = 'false';
						//alert('qualifiedSelected = false!')
					}

					if(order == 'true') {

						if(productsChecked == 'false') {
							alert('You have not selected any products');
							return false
						}						

						if(qualifiedSelected == 'false') {
							return confirm('You have selected products to order, but have not chosen a Call Result of Qualified - no order will be saved. Do you wish to continue?');
						}						

						if(shippingDateSelected == 'false') {
							alert('You have not selected a Shipping Date');
							return false;
						}
											

                        $('#loader').toggle();
						return true

					}


					// more validation here...
					$('#loader').toggle();
                    return true
				}
	  		});

			 


      })
      
    </script>

    <style type="text/css">

        html {
          background-color: #f4f2f2;
        }

        body {
          background-color: #f4f2f2;
        }

        label {
          font-weight:bold;
          font-size:12px;
        }

        input, select, textarea {

        }

        .prop .textField {
            width:300px
        }

        input.ui-button {
          padding: 5px 4px 4px 4px;
        }


        a#timezone-button {
          width: 74px; position:relative; bottom:31px;;left:980px;
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
		<g:hiddenField name="currentTimezone" value="${currentTimezone}" />

		<div class="callerNavBar">
			<g:link class="callerButton" style="left:10px; position:absolute;" action="finish_call" id="${customerInstance?.id}"><g:message code="default.home.label"/></g:link>
			<g:if test="${queue}">
				<g:actionSubmit id="submit" style="position:absolute; width:100px; left:1000px; top:63px;" class="callerButton" action="save_order_call" value="Next Call" />
                 <img id="loader" style="position:absolute; left:1105px; padding-top:3px; height:25px; display:none;" src="${resource(dir:'images', file:'ajax-loader.gif')}"  alt="" />
            </g:if>

			<g:elseif test="${single}">
					<g:hiddenField name="single" value="${single}" />
					<g:actionSubmit style="position:absolute; left:1080px; top:63px; width:100px" class="callerButton" id="submit" action="save_order_call" value="Finish" />

			</g:elseif>
			<g:else>

                <g:actionSubmit controller="call" class="callerButton" style="position:absolute; left:1080px; top:63px" action="next_order_call" value="Start Calling" />
                <span style="position:absolute; left:0; top:96px"><g:select id="timezone" name="timezone" from="${timezones}" /></span>

			</g:else>

		</div>

		<div class="body" style="width:1200px">
			<div class="dialog">
				<div id="row1" style="width:400px; float:left; margin-right:10px; ">
				<table style="width:400px; margin: 10px 10px 0 0; margin-left:0">
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
								<g:textField class="textField" name="address.city" value="${customerInstance?.address?.city}" style="width:200px; margin-right:10px;" />
                            </td>
                        </tr>
                        <tr class="prop">
							<td valign="top" class="name">
								<label for="address.state"><g:message code="address.state.label" default="State" /></label>
							</td>
                            <td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'state', 'errors')}">

								<g:textField class="textField" name="address.state" value="${customerInstance?.address?.state}" style="width:35px;  margin-right:10px;"/>
								<label for="address.zip"><g:message code="address.zip.label" default="Zip" /></label>
								<g:textField class="textField" name="address.zip" value="${fieldValue(bean: customerInstance?.address, field: 'zip')}" style="width:60px" />
                          </td>
						</tr>
					 </tbody>
				 </table>
				<table class="contact" style="width:400px">
					<tbody>
						<tr class="prop">
							<td class="name"></td>
							<td class="value">
								<h3>Food Service Director/Main Contact</h3>
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
								<label for="email"><g:message code="customer.email.label" default="Email" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
								<g:textField class="textField" name="email" value="${customerInstance?.email}" />
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
								<h3>Alternate Contact</h3>
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

				<table style="margin:10px 10px 0px 0px; width:400px; border:none; height:250px;">
					<tbody>
						<tr>
							<td class="prop" style=" background-image:url(${resource(dir:'images', file:'callnote.png')}); background-repeat:no-repeat">
								<h3 style="padding-top:10px; padding-left:10px">Operator Comments</h3>
								<br />
								<g:textArea cols="" rows="" style="width:355px; height:175px; background:none; margin-left:10px" name="notes" value="${customerInstance?.notes}"/>
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
								<label for="callbackDate" style="padding: 0 5px 0 10px;"><g:message code="callback.date" default="Callback Date" /></label>
								<input type="text" style="width:90px" id="callbackDate" name="callbackDate"/>
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
								<g:textField style="width:150px;" class="textField" name="fax" value="${customerInstance?.fax}" />
								<label for="callbackTime" style="padding: 0 5px 0 10px;"><g:message code="callback.time" default="Callback Time" /></label>
								<input type="text" style="width:90px" id="callbackTime" name="callbackTime" />
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
									   <label for="hasBakery">We make our own bread products from<br/>
										   scratch in our bakery (proof & bake)</label>
								   </td>
								   <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'hasBakery', 'errors')}">
									   <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
								   </td>
							   </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchaseFreshBread">We purchase fresh bakery and bread products</label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFreshBread', 'errors')}">
									  <g:checkBox name="purchaseFreshBread" value="${customerInstance?.purchaseFreshBread}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchaseFrozenBread">We purchase frozen bread products and/or<br/>  bread mixes and bake them in our bakery</label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFrozenBread', 'errors')}">
									  <g:checkBox name="purchaseFrozenBread" value="${customerInstance?.purchaseFrozenBread}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchaseFrozenFood">We purchase frozen foods</label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFrozenFood', 'errors')}">
									  <g:checkBox name="purchaseFrozenFood" value="${customerInstance?.purchaseFrozenFood}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="purchasePreparedFood">We purchase prepared foods</label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchasePreparedFood', 'errors')}">
									  <g:checkBox name="purchasePreparedFood" value="${customerInstance?.purchasePreparedFood}" />
								  </td>
							  </tr>

							  <tr class="prop">
								  <td valign="top" class="name">
									  <label for="didNotReceiveMailing"><g:message code="customer.didNotReceiveMailing.label" default="Did NOT get mailing/email" /></label>
								  </td>
								  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'didNotReceiveMailing', 'errors')}">
									  <g:checkBox name="didNotReceiveMailing" value="${customerInstance?.didNotReceiveMailing}" />
								  </td>
							  </tr>
							  <tr class="prop">
									<td valign="top" class="name">
										<label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="# of Students In District" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
										<g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="facilities"><g:message code="customer.facilities.label" default="# of Facilities" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'facilities', 'errors')}">
										<g:textField name="facilities" value="${fieldValue(bean: customerInstance, field: 'facilities')}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="breakfastsServed"><g:message code="customer.breakfastsServed.label" default="# of Breakfasts Served" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'breakfastsServed', 'errors')}">
										<g:textField name="breakfastsServed" value="${fieldValue(bean: customerInstance, field: 'breakfastsServed')}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="lunchesServed"><g:message code="customer.lunchesServed.label" default="# of Lunches Served" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'lunchesServed', 'errors')}">
										<g:textField name="lunchesServed" value="${fieldValue(bean: customerInstance, field: 'lunchesServed')}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="snacksServed"><g:message code="customer.snacksServed.label" default="# of Snacks Served" /></label>
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
									 <g:select style="width:175px" id="result" name='result' value="${call?.result?.id}" valueMessagePrefix="call.result" optionKey="key"
										noSelection="${['null':'Select One...']}"
										from='${CallResult.enumConstants}' />


								</td>
							</tr>

						</tbody>
					</table>

					<table style="margin: 10px 0 10px 0; width:280px" class="callerRecord">
						<tbody>
							<g:render template="previousCall" model="['customerInstance': customerInstance ]" />
						</tbody>
					</table>

					<table id="products">
					  <tbody>
						<tr class="prop">
						  <td class="name"></td>
						  <td class="value"><h3>Order Samples</h3></td>
						</tr>

						<g:each in="${products}" var="product" >
						  <tr class="prop">
							<td class="name">
							  <g:checkBox name="order_${product.name}"/>
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
									<g:select name="shippingDate"
									  id="shippingDate"
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
