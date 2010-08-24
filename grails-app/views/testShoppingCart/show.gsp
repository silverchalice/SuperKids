<%@ page import="com.superkids.domain.Product" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="customer" />
        <title>Shopping Cart</title>    
		<g:javascript library="application" />     
        <g:javascript library="prototype" />
        <g:javascript library="scriptaculous" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Shopping Cart</h1>
            <div class="list">
                    <div id="shoppingCartContent">
                        <g:render plugin="shoppingCart" template="shoppingCartContent"/>
                        <p><g:remoteLink action="checkOut"
					update="shoppingCartContent"
					onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
					Check out
				</g:remoteLink>
			</div>
			<h1>Products</h1>
			<div class="list">
                        <g:each in="${Product.list()}" var="product">
                            <p>${product.name}
                            <g:remoteLink action="add"
                                          params="${[id:product.id, class:product.class, version:product.version]}"
                                          update="shoppingCartContent"
                                          onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
                                          Add
                            </g:remoteLink>
                        </g:each>
        </div>
    </body>
</html>
