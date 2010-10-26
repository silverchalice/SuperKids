

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="learn" />
        <meta name="link" content="products" />
        <title>SuperKids | SuperKids Products</title>
    </head>
    <body>

			<div id="contentInsetInner"><h1>SuperKids Products</h1><br />
			   <h2>Would you like information about our new whole grain food products?</h2>
			   <p style="font-size:12px">Shown here is a full list of products available for school district sampling within the SuperKids Whole Grain Sampling Program.</p>
			   <strong style="color:#993300;">For product details, select 'Download PDF’ underneath the product pictures.</strong>
			   <p>&nbsp;</p>
					<g:each in="${productInstanceList}" var="productInstance">
						<table style="border:0; margin-bottom:35px;">
							<tbody>
								<tr>
									<td colspan="2"><h2>${productInstance?.name}</h2></td>
								</tr>
								<tr>
									<td valign="top" rowspan="2" style="width:150px;">

									<img alt="${productInstance?.name}" src="/SuperKids/uploads/${productInstance?.backgroundImage}" style="width:150px; height:180px; margin-bottom:15px; border:1px yellow solid; float:left" /><br />
									<br />
									<div style="line-height:30px;">
									<img style="float:left; border:0; height:30px; width:30px" alt="Download PDF" src="/SuperKids/images/pdficon.gif" />&nbsp; <a target="_blank" href="/userfiles/file/PDF/ConAgra%20Foods%20Downloadable%20PDF.pdf"><span style="color: rgb(255, 102, 0);">Download PDF</span></a>
									</div>
									</td>
									<td>
									${productInstance?.description}   <br/>
									${productInstance?.nutrition}
									</td>
								</tr>
								<tr>
									<td>
									<h3 style="color:#D16B00; font-weight:normal">${productInstance.sponsor.name}</h3>
									<p style="font-size:11px">${productInstance.sponsor.address.street}${productInstance.sponsor.address.street2 ? ", " + productInstance.sponsor.address.street2 : ""} ${productInstance.sponsor.address.city}, ${productInstance.sponsor.address.state} ${productInstance.sponsor.address.zip}<br />
									${productInstance.sponsor.phone}
									<a target="_blank" href="${productInstance.sponsor.website}"><strong style="color: rgb(255, 102, 0);">	${productInstance.sponsor.website}</strong></a>

									${productInstance.sponsor.sampleContact}</p>

									</td>
								</tr>
							</tbody>
						</table>
					</g:each>
			</div>	
    </body>
</html>
