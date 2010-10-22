

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="learn" />
        <meta name="link" content="products" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>

           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
			<div id="contentInsetInner">
			   <h1>SuperKids Products</h1><br />
			   <h2>Would you like information about our new whole grain food products?</h2>
			   <p>Shown here is a full list of products available for school district sampling within the SuperKids Whole Grain Sampling Program.</p>
			   <p><strong>For product details, select 'Download PDF’ underneath the product pictures.</strong></p>
			   <p>&nbsp;</p>
				<div class="list">
					<g:each in="${productInstanceList}" var="productInstance">
						<h2>${productInstance.name}</h2>
						<div><br /><img src="${createLink(controller:'product', action:'displayImage', id:productInstance.id)}" align="left" /></div> ${productInstance.description}<br />
						<div><h4>${productInstance.sponsor.name}</h4>
						<p>${productInstance.sponsor.address.street}${productInstance.sponsor.address.street2 ? ", " + productInstance.sponsor.address.street2 : ""}, ${productInstance.sponsor.address.city}, ${productInstance.sponsor.address.state} ${productInstance.sponsor.address.zip}<br />
						${productInstance.sponsor.phone}<br />
						${productInstance.sponsor.website}<br />
						${productInstance.sponsor.sampleContact}
						</div>
					</g:each>
          	  </div>
			</div>	
    </body>
</html>
