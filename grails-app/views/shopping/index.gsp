

<%@ page import="com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.Product" %>
<%@ page import="com.metasieve.shoppingcart.Shoppable" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="customer" />
        <g:javascript library="prototype"/>
        <g:javascript library="scriptaculous" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>

        <div style="width:600px">
           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
         <h1>This is the new shopping/index page.</h1>
         <p><strong>This page is currently undergoing maintenance.</strong> We apologize for its sheer overwhelming awesomeness.</p>
         <table>
                    <thead>
                        <tr>
                        
                   	        <th>Product</th>
                        
                   	        <th>Qty</th>

                   	        <th>&nbsp;</th>

                   	        <th>&nbsp;</th>

                   	        <th>&nbsp;</th>
                   	    
                        </tr>
                    </thead>
                    <tbody id="shoppingCartContent">
						<g:render template="shoppingCartContent"/>
					</tbody>
				</table>
				<br />
				<g:remoteLink action="checkOut"
					update="shoppingCartContent"
					onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
					Check out
				</g:remoteLink>
			</div>
			<h1>Products</h1>
			<div class="list">
                <table>
         <p><g:remoteLink controller="product" action="add"
				params="${[id:1, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Healthy Hot Dog</g:remoteLink></p>
        </div>
    </body>
</html>
