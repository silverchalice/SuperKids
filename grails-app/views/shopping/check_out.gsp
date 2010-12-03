

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="checkout" />

        <title>SuperKids | Checkout</title>
		
 		<g:javascript library="jquery" plugin="jquery" />
		<jqui:resources />


		<script type="text/javascript">
			jQuery.noConflict();


			jQuery(document).ready(function() {
				var width = jQuery(document).width() / 2.75;

				jQuery('#help').dialog({
					autoOpen:false,
					width:460,
					position:[width, 170]
				});

				jQuery('#helpPopUp').click(function(){
					jQuery('#help').dialog('open');
				});

				jQuery('#closeHelpPopUp').click(function(){
					jQuery('#help').dialog('close');
				});

			});


		</script>

		<style type="text/css">
			td.name {
				text-align:right;
				width:140px;
				line-height:20px;
			}

			label {width:auto}

			td {
				padding:.5px;
			}

			div.errors {
				background: #fff3f3;
				border: 1px solid red;
				color: #cc0000;
				margin: 10px 0 5px 0;
				padding: 5px 0 5px 0;
			}

			div.errors ul {
				list-style: none;
				padding: 0;
			}

			div.errors li {
				background: url(../images/skin/exclamation.png) 8px 0% no-repeat;
				line-height: 16px;
				padding-left: 30px;
			}

			td.errors select {
				border: 1px solid red;
			}

			td.errors input {
				border: 1px solid red;
			}
		</style>		
    </head>
    <body>

		<div id="contentInsetInner">
			<div style="width: 610px;">
			<h1>Checkout Step 1 of 2</h1>

			<br />
			<h1>School District Profile</h1><br />
                        <g:if test="${flash.message}">
                            <div class="message">${flash.message}</div><br />
                        </g:if>
			<div  style="float:left;width:300px;">
            <g:form controller="shopping" action="confirm" method="post" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
				 <table style="width:300px; border:0;">

					 <tr>
						 <td valign="top" class="name" style="color:red">
						   <label for="fsdName"><g:message code="customer.fsdName.label" default="Your Name" /></label>
						 </td>
						 <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdName', 'errors')}">
							 <g:textField name="fsdName" value="${customerInstance?.fsdName}" />
						 </td>
					 </tr>
					 <tr>
						 <td valign="top" class="name" style="color:red">
						   <label for="district"><g:message code="customer.district.label" default="School District Name" /></label>
						 </td>
						 <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">
							 <g:textField name="district" value="${customerInstance?.district}" />
						 </td>
					 </tr>

					<tr class="prop">
						 <td valign="top" class="name">
						   <label><g:message code="customer.address.street.label" default="School District Address" /></label>
						 </td>
						 <td valign="top">
							<g:textField name="address.street" value="${customerInstance?.address?.street}" />
						 </td>
					 </tr>
					 <tr class="prop">
						 <td valign="top" class="name">
						   <label><g:message code="customer.address.street2.label" default="" /></label>
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
					 </tr>
					 <tr>
						 <td valign="top" class="name">
						   <label><g:message code="customer.address.state.label" default="State" /></label>
						 </td>
						 <td valign="top">
												<g:if test="${customerInstance?.address?.state}">
								<g:select from="${states}" name="address.state" value="${customerInstance?.address?.state}" noSelection="${['null':'']}" />
												</g:if>
												<g:else>
								<g:select from="${states}" name="address.state" noSelection="${['null':'']}" />
												</g:else>
						 </td>
					 </tr>
					 <tr>
						 <td valign="top" class="name">
						   <label><g:message code="customer.address.zip.label" default="Zip" /></label>
						 </td>
						 <td valign="top">
							<g:textField name="address.zip" value="${customerInstance?.address?.zip}" />
						 </td>
					 </tr>

					 <tr>
						 <td valign="top" class="name">
						   <label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
						 </td>
						 <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'phone', 'errors')}">
							 <g:textField name="phone" value="${customerInstance?.phone}" />
						 </td>
					 </tr>

					 <tr>
						 <td valign="top" class="name">
						   <label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
						 </td>
						 <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
							 <g:textField name="fax" value="${customerInstance?.fax}" />
						 </td>
					 </tr>

					 <tr>
						 <td valign="top" class="name" style="color:red">
							 <label for="email"><g:message code="customer.email.label" default="Email" /></label>
						 </td>
						 <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
							 <g:textField name="email" value="${customerInstance?.email}" />
						 </td>
					 </tr>

					 <tr>
						 <td valign="top" class="name" style="color:red">
						   <label><g:message code="customer.deliveryAddress.street.label" default="Delivery Address" /></label>
						 </td>
						 <td valign="top">
							<g:textField name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" />
						 </td>
					 </tr>
					 <tr>
						 <td valign="top" class="name">
						   <label><g:message code="customer.deliveryAddress.street2.label" default=" " /></label>
						 </td>
						 <td valign="top">
							<g:textField name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}" />
						 </td>
					 </tr>
					 <tr>
						 <td valign="top" class="name" style="color:red">
						   <label><g:message code="customer.deliveryAddress.city.label" default="City" /></label>
						 </td>
						 <td valign="top">
							<g:textField name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" />
						 </td>
					 </tr>
					 <tr>
						 <td valign="top" class="name"style="color:red">
						   <label><g:message code="customer.deliveryAddress.state.label" default="State" /></label>
						 </td>
						 <td valign="top">
												<g:if test="${customerInstance?.deliveryAddress?.state}">
								<g:select from="${states}" name="deliveryAddress.state" value="${customerInstance?.deliveryAddress?.state}" noSelection="${['null':'']}" />
												</g:if>
												<g:else>
								<g:select from="${states}" name="deliveryAddress.state" noSelection="${['null':'']}" />
												</g:else>
						 </td>
					 </tr>
					 <tr>
						 <td valign="top" class="name" style="color:red">
						   <label><g:message code="customer.deliveryAddress.zip.label" default="Zip" /></label>
						 </td>
						 <td valign="top">
							<g:textField name="deliveryAddress.zip" value="${customerInstance?.deliveryAddress?.zip}" />
						 </td>
					 </tr>
				 </table>

				 </div>
				 <div style="float:left;width:300px;">

				 <table style="width:300px; border:0">
					 <tr>
						 <td colspan="2">
							 <div style="font-weight:bold;font-size:12px;">
							 <span style="font-size:14px;">Please Correct or Change Any Incorrect or Incomplete Information.<br/><br/></span>
							 Samples are limited and subject to availabilty.<br/><br />
							 Please tell us about your school district foodservice program
							 </div>
						 </td>

					 </tr>
					 <tr style="padding-bottom:10px;">
					 <td valign="top" style="text-align:right">
							<g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
						</td>
						 <td>
							<label for="hasBakery">Make our own bread products from<br/>
								scratch in our bakery (proof & bake)</label>
						</td>

					</tr>

					 <tr style="padding-bottom:10px;">
					   <td valign="top" style="text-align:right">
						   <g:checkBox name="purchaseFrozenBread" value="${customerInstance?.purchaseFrozenBread}" />
					   </td>
					   <td>
						   <label for="purchaseFrozenBread">Purchase frozen bread products and/or<br/>  bread mixes and bake them in our bakery</label>
					   </td>

					 </tr>
					 <tr style="padding-bottom:10px;">
					   <td valign="top" style="text-align:right">
						   <g:checkBox name="purchasePreparedFood" value="${customerInstance?.purchasePreparedFood}" />
					   </td>
					   <td>
						   <label for="purchasePreparedFood">Purchase prepared foods</label>
					   </td>

					 </tr>

					 <tr style="padding-bottom:10px;">
					   <td valign="top" style="text-align:right">
						   <g:checkBox name="purchaseFrozenFood" value="${customerInstance?.purchaseFrozenFood}" />
					   </td>
					   <td>
						   <label for="purchaseFrozenFood">We purchase frozen foods</label>
					   </td>

					 </tr>

					 <tr>
						 <td>&nbsp;</td>
						 <td>Other, please describe: <g:textField name="otherFoodProgram" value=""/></td>

					 </tr>
					 <tr>
						 <td colspan="2">
							 Number of students in your school district
							 <g:select name="studentsInDistrict" from="${['Less than  500', '500 - 1,000', '1,000 - 2,000', '3,000 - 5,000', '5,000 - 10,000', '10,000 - 20000', '20,000 - 50,000', 'Over 50,000']}"  value="${customerInstance?.studentsInDistrict}"/>
						 </td>
					 </tr>
					 <tr>
						 <td colspan="2">
							 Approximate number of cafeterias, food courts or other eating facilities(District Total)
							 <g:select name="facilities" from="${['Less than 3', '3-5', '6-10', 'More than 10']}" value="${customerInstance?.facilities}"/>
						 </td>
					 </tr>
					 <tr>
						 <td colspan="2">
							 Number of students served daily (in your total school district - not just your individual school). Please confirm/enter these numbers.
						 </td>
					 </tr>
					 <tr>
						 <td><g:textField name="breakfastsServed" value="${fieldValue(bean: customerInstance, field: 'breakfastsServed')}"  style="width:40px"  /></td>

						 <td><label for="breakfastsServed"><g:message code="customer.breakfastsServed.label" default="Breakfasts"/></label> </td>
					 </tr>
					 <tr>
						 <td><g:textField name="lunchesServed" value="${fieldValue(bean: customerInstance, field: 'lunchesServed')}" style="width:40px" /></td>
						 <td><g:message code="customer.lunchesServed.label" default="Lunches" /></td>
					 </tr>
					 <tr>
						 <td><g:textField name="snacksServed" value="${fieldValue(bean: customerInstance, field: 'snacksServed')}" style="width:40px" /></td>

						 <td><g:message code="customer.snacksServed.label" default="Snacks" /></td>
					 </tr>

				 </table>
				 </div>
			 <div style="clear:both;width:600px; border:0; text-align:center">
				 <div style="float:left;">
				 <a id="helpPopUp">Help</a>

                                 <p>
                                 <br />
                                     <input type="image" src="/SuperKids/images/ContinueButton-green.gif" style="margin-left:220px;" width="123" height="40" name="save">
                                 </p>
				 </div>
				 <div style="float:left; text-align:left;padding-left:20px;">
				 You must click <img src="/SuperKids/images/ContinueButton-green.gif" width="62" height="20" /> to continue.  If possible, please update or
				 provide the optional broker/distributor information below before doing so.
				 </div>
				 <div style="clear:both;"></div>
			 </div>
			 </g:form>

			 <div id="help">
				 <h2>Purpose</h2>
				 <p>
					 Your School District Profile is used to determine the types of products that you can order.
					 For example, flour products are only available to school districts that proof and bake, and some products
					 are not available in all regions and states.
				 </p>
				 <h2>Required Fields	</h2>
				 <p>
					 Fields in red are required so that we have the right address to send your samples to, and so that
					 we can send you an email telling you when your sample order has shipped.
				 </p>
				 <h2>Number of Students</h2>
				 <p>
					 Select the option that comes closest to the total number of students served in your entire school
					 district - not just the number of students in your immediate school or location.

				 </p>
				 <h2>Approximate Number of Cafeterias, <br/>Food Courts, etc.	</h2>

				 <p>Select the option that comes closest to the total number of eating facilities in your entire school district.
				 </p>
				 <a id="closeHelpPopUp">Close</a>
			 </div>





















				
			<br />
			<table style="border:0">
			<tr><td colspan="2">
			<span style="color: rgb(153, 51, 0);">
					<span style="font-size: 16px;">

						<h3 style="color:#993300">Optional Broker/Distributor Information</h3>
					</span>
				</span>
				<div style="font-size: 10px;">
					One of the objectives of the SuperKids Whole Grain Sampling Program is to communicate demand for these products to
					foodservice distributors and brokers.
					<BR /><BR />
					Although it is not mandatory that you provide broker or distributor information below, it will help ensure that
					the right people know about your interest in these products and improve the  likelihood that you will receive more
					whole grain foods in the future.  Please provide the following if available.
					<br /><br />
				</div>

			</td>
			</tr>
			<tr>
				<td valign="top">
				<strong>Current Broker/Distributors:</strong><br/><br/>

				<table style="width:250px; border:1px #eee solid">
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
						   		<g:link action="brokerEditFromEdit" id="${broker?.id}" params="[rController:'product', rAction:'check_out']">Edit</g:link> |
								<g:link action="brokerDeleteFromEdit" id="${broker?.id}" params="[rController:'product', rAction:'check_out']">Delete</g:link>
							</td>
						</tr>
					  </g:each>
					</tbody>
				</table>
			</td><td valign="top">

			<g:form controller="${broker ? 'product' : 'home'}" action="${broker ? 'updateBroker': 'addBroker'}" method="post">
            <div style="width:300px; float:left;">
                      <table style="border:0; width:300px">
                          <tr>
                              <td><strong>Broker/Distributor Name: </strong></td>
                              <td><input type="text" name="name" size="20" maxlength="50" value="${broker?.name}"></td>
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
                              <td>State</td>
                              <td align="left">
                                    <g:select name="state" from="${states}" value="${broker?.state}" />
                              </td>
                          </tr>
                          <tr>
                              <td><strong>Zip: </strong></td>
                              <td><input type="text" name="zip" size="10" maxlength="20" value="${broker?.zip}"></td>
                          </tr>
                          <tr>
                              <td><g:hiddenField name="rController" value="product" />
                              <g:hiddenField name="rAction" value="check_out" />
                              <g:hiddenField name="id" value="${broker?.id}" /></td>
                          </tr>
                            <tr>
                                <td>
                                    <div class="buttons">
                                        <br />
                                        <span class="button"><g:submitButton name="create" class="save" value="Add" /></span>
                                    </div>
                                </td>
                            </tr>

                      </table>
            		  </g:form>
					</td>
				</tr>
			</table>
			</div>

		</div>
    </body>
</html>
