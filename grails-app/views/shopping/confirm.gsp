

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="checkout" />
        <g:javascript plugin="jquery" library="jquery" />

        <title>SuperKids | Checkout</title>
		<style type="text/css">
			td.name {
				text-align:right;
				width:140px;
				line-height:16px;
				font-size:12px;
				font-weight:bold;
			}

			td.value {
				line-height:16px;
			}

			label {width:auto}

			strong {
				font-weight:normal;
			}

			td {
				padding:0;
				line-height:21px;
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
			   <h1>Checkout Step 2 of 2</h1>
				<g:form action="place_order" method="post" >
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<g:hiddenField name="version" value="${customerInstance?.version}" />
				

					   <h1>Your Contact Information</h1> <br/>
					   <p style="font-size:12px;">Please confirm the information shown. To change your contact information, click <g:link controller="product" action="check_out">here</g:link>. <br/>
						To add a sample, click <g:link controller="home" action="order">here</g:link>.</p>

					   <table style="margin-left:20px; border:0; line-height:10px">
						   <tr>
							   <td class="name">Name: </td>
							   <td class="value">${customerInstance.fsdName}</td>
						   </tr>
						   <tr>
							   <td class="name">School District:</td>
							   <td class="value">${customerInstance.district}</td>
						   </tr>
						   <tr>
							   <td class="name">Shipping Address: </td>
							   <td class="value">
								   ${customerInstance.address.street}<br />

								   ${customerInstance.address.street2}
							   </td>
						   </tr>
						   <tr>
							   <td class="name">Phone Number:</td>
							   <td class="value">${customerInstance.phone}</td>
						   </tr>
						   <tr>
							   <td class="name">Email Address:</td>
							   <td class="value">${customerInstance.email}</td>
						   </tr>
					   </table>
					   <h1>The Samples Requested</h1>
                                             <div id="shoppingCartContent">
						   <table style="border:0">
							   <tbody>
								   <g:each in="${products.sort{it.id}}" var="product">
									  <tr>
										   <td style="width:110px; margin-left:0; padding-left:18px"><img src="${createLink(controller:'product', action:'displayImage', id:product?.id)}" alt="" /> </td>

										   <td valign="center" style="width: 260px;padding-top:30px; font-size:12px; font-weight:bolder;">
											   ${product}<br/>

										   </td>

										   <td style="width: 100px;padding-top:30px;"><g:remoteLink controller="product" action="remove"
											   params="${[id:product.id, confirm:true, controller:shopping, action:confirm]}"
											   update="shoppingCartContent">
											   REMOVE
										   </g:remoteLink></td>
									   </tr>
								   </g:each>
							   </tbody>
						   </table>
                                               </div>
					   <p>Samples are limited and subject to availability. You will receive an email from our Fulfillment Center telling you the approximate date your samples will ship.</p>

						<h2>When to Ship</h2>
						<p>Please select when to ship your order:</p>
						<g:select name="shippingDate" optionKey="id" optionValue="${formatDate(format:'MMMM, yyyy', date:shipDate)}" from="${shippingDates}" />

						<h2>Rewards for Assessments</h2>
					
	<p>When you receive your samples and try them out, be sure to come back to SuperKidsSampling.com before March 5, 2010 -- you can earn special rewards for completing your assessments by this deadline. Click Assess to learn more. </p>
						<p>If this sample order is correct, click here to complete order. If you do not confirm your order by pressing this button, the order will not be placed.</p>
						<span class="button"><g:submitButton name="create" class="save" value="Continue" /></span>

				</g:form>
			</div>
		</div>
    </body>
</html>
