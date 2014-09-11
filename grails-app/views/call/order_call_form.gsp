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

   			$("#callbackDateString").datepicker({dateFormat: 'mm/dd/yy'});

            var clicked = 'false';

			var changedFlag;
			$(':input').bind('change', function() {
			    //console.log('changedFlag = true')
				changedFlag = 'true';
			});

			//$("select#result").selectmenu({style:'dropdown'});
			$("select#shippingDate").selectmenu({style:'dropdown'});
             $("select#timezone").selectmenu({style:'dropdown'});

			$('#home').click(function (e) {
			   if(changedFlag == 'true' && $('#result').val() == "null") {
					return confirm('You made changes to the form, but did not click Finish - your changes will not be saved. Do you want to continue?')
				}
		   });

			$('#submit').click(function (e) {
                if(clicked == 'true') { return false };

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
                        clicked = 'true'
						return true

					}


					// more validation here...
					$('#loader').toggle();
                    clicked = 'true'
                    return true
				}
	  		});



			$('#startSubmit').click(function (e) {
                if(clicked == 'true') { return false };
                $('#loader').toggle();
                clicked = 'true'
                return true

            });


      });

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
			<g:actionSubmit id="home" controller="call" class="callerButton" style="width:60px; left:60px; position:absolute;" action="finish_call" value="Home" />

			<g:if test="${start && queue}">
				<g:hiddenField name="queue" value="${queue}" />
                <g:actionSubmit id="startSubmit" controller="call" class="callerButton" style="position:absolute; left:1080px; top:0px" action="next_order_call" value="Start Calling" />
                <span style="position:absolute; left:0; top:36px"><g:select id="timezone" name="timezone" from="${timezones}" /></span>
                <img id="loader" style="position:absolute; left:1175px; padding-top:3px; height:25px; display:none" src="${resource(dir:'images', file:'ajax-loader.gif')}"  alt="" />
			</g:if>

			<g:if test="${queue && !start}">
				 <g:actionSubmit id="submit" style="position:absolute; width:100px; left:1000px; top:0px;" class="callerButton" action="save_order_call" value="Next Call" />
				 <g:hiddenField name="queue" value="${queue}" />
                 <img id="loader" style="position:absolute; left:1105px; padding-top:3px; height:25px; display:none;" src="${resource(dir:'images', file:'ajax-loader.gif')}"  alt="" />
            </g:if>

			<g:if test="${single}">
				<g:hiddenField name="search" value="${search}" />
				<g:hiddenField name="query" value="${query}" />
				<g:hiddenField name="single" value="${single}" />
				<g:hiddenField name="cb" value="${cb}" />
				<g:hiddenField name="ocl" value="${ocl}" />
				<g:actionSubmit style="position:absolute; left:1080px; top:0; width:100px" class="callerButton" id="submit" action="save_order_call" value="Finish" />
			</g:if>


		</div>

		<div class="body" style="width:1200px">
			  <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
      </g:if>
			<div class="dialog">
				<div id="row1" style="width:400px; float:left; margin-right:10px; ">
				<table style="width:400px; margin: 10px 10px 0 0; margin-left:0">
					<tbody>
                     <tr class="prop">
                        <td valign="top" colspan="2">
                          <g:if test="${customerInstance?.pastParticipant}">
                              <span style="color:green; font-weight:bold;">Past participant</span>

                          </g:if>
                          <g:else>
                              <span style="color:gray">Has not participated in the past</span>
                          </g:else>
                        </td>
                     </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="source">Class.</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'source', 'errors')}">
                            ${customerInstance?.source}
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
								<g:textField class="textField" name="address.city" value="${customerInstance?.address?.city}" style="width:200px; margin-right:10px;" />
                            </td>
                        </tr>
                        <tr class="prop">
							<td valign="top" class="name">
								<label for="address.state"><g:message code="address.state.label" default="State" /></label>
							</td>
                            <td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'state', 'errors')}">
                               <g:select name="address.state" from="${states}" value="${customerInstance?.address?.state}" noSelection="['':'Select a State']"/>
								<label for="address.zip"><g:message code="address.zip.label" default="Zip" /></label>
								<g:textField class="textField" name="address.zip" value="${fieldValue(bean: customerInstance?.address, field: 'zip')}" style="width:80px" />
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
								<g:textArea cols="" rows="" style="width:355px; height:175px; background:none; margin-left:10px" name="opNotes" value="${customerInstance?.opNotes}"/>
							</td>
						</tr>
					</tbody>
				</table>
				</div>

				<div id="column2" style="width:500px; float:left">
				<table style="width:500px;margin-top: 10px; margin-left: 0px; margin-right:10px;">
					<tbody>

						<tr class="prop">
							<td valign="top">
								<label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
							</td>
							<td valign="top">
								<g:textField style="width:150px;" name="phone" value="${customerInstance?.phone}" />
								<label for="callbackDateString" style="padding: 0 5px 0 10px;"><g:message code="callback.date" default="Callback Date" /></label>
								<input type="text" style="width:90px" id="callbackDateString" name="callbackDateString"/>
							</td>

						</tr>

						<tr class="prop">
							<td valign="top">
								<label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
								<g:textField style="width:150px;" class="textField" name="fax" value="${customerInstance?.fax}" />
								<label for="callbackTime" style="padding: 0 5px 0 10px;"><g:message code="callback.time" default="Callback Time" /></label>
								<input type="text" style="width:90px" id="callbackTime" name="callbackTime" />
							</td>

						</tr>

						<tr class="prop">
							<td valign="top">
								<label for="website"><g:message code="customer.website.label" default="Website" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'website', 'errors')}">
								<g:textField class="textField" name="wbset" value="${customerInstance?.website}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top">
								<label for="deliveryAddress.street"><g:message code="address.street.label" default="Del. Street" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'street', 'errors')}">
								<g:textField class="textField" name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top">
								<label for="deliveryAddress.street2"><g:message code="address.street2.label" default="Del. Street 2" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street2', 'errors')}">
								<g:textField class="textField" name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top">
								<label for="deliveryAddress.city"><g:message code="address.city.label" default="Del. City" /></label>
							</td>
							<td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'city', 'errors')}">
								<g:textField class="textField" name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" style="width:120px; margin-right:10px;" />
								<label for="deliveryAddress.state"><g:message code="deliveryAddress.state.label" default="State" /></label>
                                <g:select name="deliveryAddress.state" from="${states}" value="${customerInstance?.deliveryAddress?.state}" noSelection="['':'Select...']"/>
								<label for="deliveryAddress.zip"><g:message code="deliveryAddress.zip.label" default="Zip" /></label>
								<g:textField class="textField" name="deliveryAddress.zip" value="${fieldValue(bean: customerInstance?.deliveryAddress, field: 'zip')}" style="width:75px" />

						</tr>
					</tbody>
				</table>
					  <table style="margin: 10px 10px 10px 0;width:500px; ">
						   <tbody>
                           <tr>
                               <td colspan="2">
                                   <strong>1.</strong>Approximately how many students are in your district?
                                   <input type="text" name="studentsInDistrict" size="15" maxlength="6" value="${customerInstance?.studentsInDistrict}"></td>

                           </tr>
                           <tr>
                               <td colspan="2">
                                   <strong>2.</strong>Approximately how many students participate in your foodservice program?
                                   <input type="text" name="studentsParticipate" size="10" maxlength="6" value="${customerInstance?.studentsParticipate}"></td>
                           </tr>
                           <tr>
                               <td colspan="2">
                                   <strong>3.</strong>	Is your foodservice program contract managed?
                                   <g:select name="contractManaged" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.contractManaged}"/>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">a) If yes, by who?
                                   <br/>
                                   <input type="text" name="contractManager" value="${customerInstance?.contractManager}" size="55" maxlength="1000"></td>
                           </tr>
                           <tr>
                               <td colspan="2"><strong>4.</strong>	Are you a member of a co-op? (Please enter Co-op Name) <input type="text" name="coOpName" value="${customerInstance?.coOpName}" size="55" maxlength="1000">
                               </td>
                           </tr>

                           <tr>
                               <td colspan="2">a)	If yes, would you like us to send samples to the co-op?
                                <g:select name="coOpSamples" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.coOpSamples}"/>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">b) Name and address for the co-op sample:
                                   <br/>
                                   <input type="text" name="coOpAddress" value="${customerInstance?.coOpAddress}" size="55" maxlength="1000"></td>
                           </tr>
                           <tr>

                               <td colspan="2"><strong>5.</strong>	Who are your primary foodservice distributors?
                                   <br/>
                                   <input type="text" name="callerBrokers" value="${customerInstance?.callerBrokers}" size="55" maxlength="1000"></td>
                           </tr>
                           <tr>
                               <td colspan="2"><strong>6.</strong> Do you bake from scratch in your district?
                               <g:select name="hasBakery" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.hasBakery}"/>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2"><strong>7.</strong> Do you buy USDA commodity flour?
                               <g:select name="buyCommodityFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.buyCommodityFlour}"/>
                               </td>
                           </tr>

                           <tr>
                               <td colspan="2"><strong>8.</strong> If you've participated in SuperKids in the past, did you add any of the items you sampled to your menu?
                                <g:select name="addedPastItemsToMenu" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.addedPastItemsToMenu}"/>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">a) If yes, do you recall any specifically?
                                   <br/>
                                   <input type="text" name="pastItemsAddedToMenu" value="${customerInstance?.pastItemsAddedToMenu}" size="55" maxlength="1000"></td>
                           </tr>
                           <tr>
                               <td colspan="2"><strong>9.</strong> Do you look for &#8220;Ultragrain&#8221; when trying new whole grain-rich foods?
                                <g:select name="useUltragrainFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainFlour}"/>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2"><strong>10.</strong> Do you participate in any rewards programs?
                                   <g:select name="participateInRewardsPrograms" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.participateInRewardsPrograms}"/>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">a) Which do you use?
                                   <br/>
                                   <input type="text" name="programsParticipatedIn" value="${customerInstance?.programsParticipatedIn}" size="55" maxlength="1000"></td>
                           </tr>
                           <tr>
                               <td colspan="2">b) How much do they influence you?
                                   <br/>
                                   <input type="text" name="programInfluence" value="${customerInstance?.programInfluence}" size="55" maxlength="1000"></td>
                           </tr>
                           <tr>
                               <td colspan="2"><strong>11.</strong> What&#8217;s your biggest concern regarding foodservice needs this year? <br/>
                                   <input type="text" name="biggestFoodserviceConcern" value="${customerInstance?.biggestFoodserviceConcern}" size="55" maxlength="1000"></td>
                           </tr>
                           <tr>
                               <td colspan="2"><strong>12.</strong> By subscribing to SuperKids, ConAgra Foods and/or its affiliates
              <br />may send you information about related events, webinars, products
              <br /> and services which we believe will be of interest to you.<br />
              <br />Check this box if you DO NOT wish to receive additional information
              <br />from ConAgra Foods and its affiliates. 
<g:checkBox name="doNotReceiveAdditionalInformation" value="${customerInstance?.doNotReceiveAdditionalInformation}" />
                               </td>
                           </tr>
                              <tr class="prop">
                                  <td>
                                      <label for="didNotReceiveMailing"><g:message code="customer.didNotReceiveMailing.label" default="Did NOT get mailing/email" /></label>
                                  </td>
                                  <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'didNotReceiveMailing', 'errors')}">
                                      <g:checkBox name="didNotReceiveMailing" value="${customerInstance?.didNotReceiveMailing}" />
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

					<table id="products" style="width:280px">
					  <tbody>
						<tr class="prop">
						  <td></td>
						  <td class="value"><h3>Order Samples</h3></td>
						</tr>

						<g:each in="${products}" var="product" >
						  <tr class="prop">
							<td>
							  <g:checkBox name="order_${product.id}" checked="${checkedProducts?.find {it.id == product.id}}"/>
							</td>
							<td class="value">
							  ${product.name}
							</td>
						  </tr>

						</g:each>
					  </tbody>
					</table>

					<table style="margin-top:10px; width:280px">
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
									  from="${ShippingDate.findAllByActive(true)}"
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
