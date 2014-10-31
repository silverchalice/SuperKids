

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="cart" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

        <title>SuperKids | Checkout</title>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#submitButton").click(function () {
                    $("#submitOrderForm").submit();
                });
            });
        </script>

    </head>
    <body>
    <div id="content-container">
        <ol id="order-process">

            <li class="one"><a href="${createLink(controller: 'shopping', action: 'index')}">
                <span class="gradient">1</span> Review Your Order</a></li>
            <li class="two"><a href="${createLink(controller: 'product', action: 'check_out')}"><span>2</span> Provide Shipping Address</a></li>
            <li class="three active"><a href="#"><span>3</span> Place Your Free Order</a></li>

        </ol>
        <div id="content">
				<g:form name="submitOrderForm" action="place_order" method="post" >
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<g:hiddenField name="version" value="${customerInstance?.version}" />
                    <h1 style="text-align: center">Confirm & Place Your Order</h1>
                    <h3>If this sample order is correct, click the "Place Your Order" button at the bottom of the screen to complete order. If you do not confirm your order by pressing this button, the order will not be placed.</h3>
					   <h2>Your Shipping Information</h2>
					   <p>Please confirm the information shown. To  go back and change your contact information, click <g:link controller="product" action="check_out">here</g:link>.</p>

					   <table>
						   <tr>
							   <td class="name">Name: </td>
							   <td class="value">${customerInstance?.fsdName}</td>
						   </tr>
						   <tr>
							   <td class="name">School District:</td>
							   <td class="value">${customerInstance?.district}</td>
						   </tr>
						   <tr>
							   <td class="name">Delivery Address: </td>
							   <td class="value">
								   ${customerInstance?.deliveryAddress?.street}<br />

								   ${customerInstance?.deliveryAddress?.street2}<br/>
                                   ${customerInstance?.deliveryAddress?.city} ${customerInstance?.deliveryAddress?.state}, ${customerInstance?.deliveryAddress?.zip}
							   </td>
						   </tr>
						   <tr>
							   <td class="name">Phone Number:</td>
							   <td class="value">${customerInstance?.phone}</td>
						   </tr>
						   <tr>
							   <td class="name">Email Address:</td>
							   <td class="value">${customerInstance?.email}</td>
						   </tr>
					   </table>
					   <h2>The Samples Requested</h2>
                     <div id="shoppingCartContent">

                       <sks:eachInProducts>
                           <div class="order-item"><img src="${createLink(controller: 'product', action: 'displayImage', id: com.superkids.domain.Product.findByShoppingItem(it['item'])?.id)}" alt=""/>

                           <h2>${com.superkids.domain.Product.findByShoppingItem(it['item'])?.name}</h2>

                           <p>Made by ${com.superkids.domain.Product.findByShoppingItem(it['item'])?.sponsor?.name} </p>

                           <div class="remove">
                               &nbsp;

                           </div>
                           </div>
                       </sks:eachInProducts>

                       </div>
					   <p>Samples are limited and subject to availability. You will receive an email from our Fulfillment Center telling you the approximate date your samples will ship.</p>

						<h2>When to Ship</h2>
						<p>Please select when to ship your order:</p>
						<g:select name="shippingDate" optionKey="id" optionValue="${formatDate(format:'MMMM, yyyy', date:shipDate)}" from="${shippingDates}" />

						<h2>Rewards for Assessments</h2>
					
	<p>When you receive your samples and try them out, be sure to come back to SuperKidsSampling.com before March 23, 2015 -- you can earn special rewards for completing your assessments by this deadline. </p>
						<h3>If this sample order is correct, click the "Place Your Order" button to complete order. If you do not confirm your order by pressing this button, the order will not be placed.</h3>
                    <div style="clear: both; width: 890px; margin: 0 auto;">
                        <hr />
                        <a href="${createLink(controller: 'product', action: 'check_out')}">&laquo; Back</a><a id="submitButton" href="#" title="Move to the next step" class="btn arrow"><span>Place Your Order</span></a>
                    </div>
				</g:form>
			</div>
		</div>
    </body>
</html>
