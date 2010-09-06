<%@ page import="com.superkids.domain.Product" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="products" />
        <title>Shopping Cart</title>    
		<g:javascript library="application" />     
        <g:javascript library="prototype" />
        <g:javascript library="scriptaculous" />
    </head>
    <body>

        <div class="body">
            <h1>Shopping Cart</h1>
            <div class="list">
                    <div id="shoppingCartContent">
                      <sks:hasNotPlacedCurrentOrder>
                        <g:render template="/shopping/shoppingCartContent"/><br />
                      </sks:hasNotPlacedCurrentOrder>
                      <sks:hasPlacedCurrentOrder>
                          <sks:orderList />
                      </sks:hasPlacedCurrentOrder>
			</div>
        </div>
    </body>
</html>
