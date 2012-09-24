
<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <title>${productInstance.name} - SuperKids Sampling Program | From ConAgra Foods</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="products" />
        <meta name="active" content="${productInstance?.id}" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />

    </head>
    <body>
    <h1>${productInstance?.title}</h1>
        <div id="order-container"><img src="${createLink(controller: 'product', action: 'displayImage', id: productInstance.id)}" alt="${productInstance.name}" class="${productInstance.ultragrain ? 'ultragrain ' : ''} ${productInstance.sustagrain ? ' sustagrain ' : ''}" />
	    <g:if test="${productInstance.ultragrain}">
            <a href="${createLink(controller: 'home', action: 'ultragrain_general')}" title="Learn more about this grain"><p class="made-with-ultra">Made with Ultragrain</p>
	    </g:if>
        <g:if test="${productInstance.sustagrain}">
               <a href="${createLink(controller: 'home', action: 'sustagrain_general')}" title="Learn more about this grain"><p class="made-with-susta">Made with Sustagrain</p>
        </g:if>
	    </a>
            <div class="order-info">
                <sec:ifNotLoggedIn>
                    <p>To order samples, you must be a foodservice director & you must <a href="${createLink(controller: 'login', action: 'auth')}" title="Log in to order free samples">log in</a>.</p>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <g:if test="${customer?.hasPlacedCurrentOrder}">
                        Your Order Has Been Placed
                    </g:if>
                    <g:elseif test="${inCart}">
                        <p class="remove"><a href="${createLink(controller: 'product', action: 'remove', id: productInstance.id)}" title="Remove this sample from your free order">Remove from your order</a></p>
                        <a class="btn arrow" href="${createLink(controller: 'shopping', action: 'index')}" title="Place your free order" class="btn arrow"><span>Checkout</span></a>
                    </g:elseif>
                    <g:else>
                        <a href="${createLink(controller: 'product', action: 'add', id: productInstance?.id)}" title="Add this product to your order" class="btn"><span>Add to your free order</span></a>
                    </g:else>
                </sec:ifLoggedIn>

            </div>
            <p><g:link class="pdf" action="downloadSummary" id="${productInstance.id}">Download Summary</g:link> <span class="sep">|</span> <a href="/SuperKids/uploads/${productInstance?.backgroundImage}">View Product Ad</a></p>
        </div>
        <div id="order-intro">
            ${productInstance?.description}
        </div>
        <h2>Sample Specifics</h2>
          <div id="nutrition">
              <h4>Nutrition Facts</h4>
              ${productInstance?.nutrition}
          </div>

        ${productInstance?.details}

        <h2>Manufacturer Information</h2>
        ${productInstance.sponsor.details}

        <!--<h2>Recipes from the Manufacturer</h2>
        <p>Download recipes</p>
        <ul>
          <li><a href="xyz.pdf" title="Download this recipe in PDF format">Recipe Name</a> [PDF]</li>
          <li><a href="xyz.jpg" title="Download this recipe in .jpg format">Recipe Name</a> [JPG/GIF/PNG/TIF]</li>
          <li><a href="xyz.doc" title="Download this recipe in .doc format">Recipe Name</a> [DOC/DOCX]</li>
        </ul>                                                             -->
    </body>
</html>
