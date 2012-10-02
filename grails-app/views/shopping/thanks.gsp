

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="cart" />
        <title>SuperKids | Thank You</title>
    </head>
    <body>
    <div id="content-container">
        <ol id="order-process">

            <li class="one complete"><a href="#"><span class="gradient">1</span> Review Your Order</a></li>
            <li class="two complete"><a href="#"><span>2</span> Provide Shipping Address</a></li>
            <li class="three complete"><a href="#"><span>3</span> Place Your Free Order</a></li>

        </ol>
        <div id="content">
			<h1>Thanks For Your Order!</h1>
			<h2 style="display:inline">You'll receive an email</h2><p style="display:inline"> from our fulfillment center telling you when your samples will ship.
        Ask your network administrator to allow emails from <a href="mailto:melissac@sdastl.com" style="color:#FF6600"> melissac@sdastl.com</a>. </p>

			<h2>Your samples may require refrigeration or frozen storage.</h2>  <p>Packaging will only maintain products during shipment. Please open the box upon arrival and store samples accordingly. A street address is required for your shipment. Be sure to verify your contact information and shipping address.  <strong>Click <a href="${createLink(controller: 'home', action: 'edit_profile')}">Your Account</a> to update your contact information.</strong></p>
			<h2>Rewards for completing assessments.</h2>
            <p>Your feedback will be invaluable in helping us get more whole grain foods into foodservice distribution and helping our manufacturers better understand your needs. After you receive your samples, be sure to complete your assessment by March 4, 2013 so you can qualify to win a $200 Gift Card or other great prizes in our sweepstakes drawing. <strong> <g:link controller="home" action="assessment_drawing_rules">Click here for more details.</g:link></strong> </p>

			<h2>Sample documentation.</h2> <p>Click on the Product Samples tab for product information PDFs which include heating and baking instructions. This information will be helpful to you when you receive your sample products. <strong><a href="${createLink(controller: 'home', action: 'order')}">Browse samples to download product information.</a></strong></p>
			<h2>Promote whole grain products.</h2>  <p>Refer others to the SuperKids Whole Grain Sampling Program. <strong><g:link controller="home" action="learn">Click here for Promotional Ideas</g:link> </strong></p>
        </div>
        <div style="clear: both; width: 890px; margin: 0 auto; padding-top: 20px">
            <hr />
            <a href="${createLink(controller: 'home', action: 'index')}" title="Home page" class="btn arrow"><span>Return to the Home Page</span></a>
        </div>
        </div>
    </body>
</html>
