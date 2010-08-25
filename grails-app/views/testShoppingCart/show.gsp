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

        <div class="body">
            <h1>Shopping Cart</h1>
            <div class="list">
                    <div id="shoppingCartContent">
                        <g:render template="/shopping/shoppingCartContent"/><br />
			</div>
			<h1>Products</h1><br />
			<div class="list">
                   <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="item" title="Product" />
                            <g:if test="${!session.checkedOutItems}">
                                <th> </th>
                            </g:if>

                        </tr>
                    </thead>
                    <tbody>
                      <g:each in="${Product.list()}" var="product">
                        <tr>
                        
                            <td>${product.name}</td>

                            <g:if test="${!session.checkedOutItems}">
                               <td><g:remoteLink controller="product" action="add"
                                              params="${[id:product.id, class:product.class, version:product.version, cartPage:true]}"
                                              update="shoppingCartContent"
                                              onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
                                              Add
                               </g:remoteLink>
                              </td>
                            </g:if>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
        </div>
    </body>
</html>
