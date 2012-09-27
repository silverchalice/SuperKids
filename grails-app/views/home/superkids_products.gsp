<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="about" />
        <meta name="link" content="products" />
        <title>SuperKids | SuperKids Products</title>


        <style type="text/css">
            .productListItem {
                margin-bottom: 50px;
            }

            .productListItem h2 {
                font-size: 20px
            }

            .productListItem img.ad {
                float:right;
                width:275px;
                margin: 0 5px;
                box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.25);

            }

            .productListItem a {
                background: none;
                padding: 0;
            }

            .productListItem a.pdf {
                background:url('../images/icon_pdf.png') no-repeat right center;
                padding:3px 22px 3px 0;
            }
        </style>
    </head>
    <body>

          <div id="content">
              <h1>All SuperKids Products</h1>
              <h2>Would you like information about our new whole grain food products?</h2>
              <p>Shown here is a full list of products available for school district sampling within the SuperKids Whole Grain Sampling Program.</p>
          <p><strong>For product details, select 'Download PDF’ underneath the product pictures.</strong>


              <g:each in="${products}" var="productInstance">
                  <div class="productListItem">

                      <a href="/SuperKids/uploads/${productInstance?.backgroundImage}" target="_blank"><img class="ad" src="/SuperKids/uploads/${productInstance?.backgroundImage}" /></a>
                      ${productInstance.description}
                      <p><g:link class="pdf" controller="product" action="downloadSummary" id="${productInstance.id}">Download Summary</g:link></p>

                  </div>
                  <div class="clear" style="clear: both">&nbsp;</div>
              </g:each>

          </div>

    </body>
</html>
