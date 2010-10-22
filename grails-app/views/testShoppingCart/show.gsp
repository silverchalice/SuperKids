<%@ page import="com.superkids.domain.Product" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="cart" />
        <title>SuperKids | Cart</title>         
        <g:javascript plugin="jquery" library="jquery" />

		
    </head>
    <body>

        <div id="contentInsetInner">
            <h1>Sample Cart</h1>
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
