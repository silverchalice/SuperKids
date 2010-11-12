
<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="products" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <g:javascript library="jquery" plugin="jquery"/>
		
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'ui-lightness/jquery-ui-1.8.5.custom.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'flexcrollstyles.css')}" />

        <script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>

        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<style type="text/css">
			.contentInset {
			  width:518px;
			  padding:0;
			  height:483px;
			  margin:0 auto;
			  position:absolute;
			  top:100px;
			  left:419px;
			  overflow: auto;
			}


			.contentInsetUpper {
				width:491px;
				position:absolute;
				left:420px;
				top:90px;
				background:white;
				height:10px
			}

			.contentInsetLower {
				width:491px;
				position:absolute;
				left:420px;
				top:577px;
				background:white;
				height:7px;
				z-index:2;
				clear:both;
				padding-top:1px;
			}

			.contentInset p {
			  font-size:10px;
			  margin-top:0;
			  margin-bottom:13px;
			  padding-left:1px;
			}

			.contentInset strong {
			  font-size:12px;
			  font-weight:bold;
			  color:#333333;
			  padding-left:1px;
			}

			.contentFooter {
			  margin-left:4px;
			  position:absolute;
			  top:591px;
			  height:17px;
			  right:0;
			  width:815px;
		      margin-right:0;
			  background:url('/SuperKids/images/layout/contentFooter-bg.gif') repeat-x;
			}

			.productAd {
				width:521px;
				padding:0;
				height:495px;
				margin:0 auto;
				position:absolute;
				top:90px;
				right:15px;
				overflow: hidden;
			}

			#productAdContainer {
				width:491px;
				padding:0;
				background: #fa9f00;
				min-height:495px;
				right:29px;
				position:absolute;
				height:auto !important;
				height:495px;
			}

			img.productAdImage {
              display:none;
				padding:0;
				margin:0;
				width:491px;
				height:495px;
			}


			ul.tabs {
				margin: 0;
				padding: 0;
				list-style: none;
				height: 32px; /*--Set height of tabs--*/
				border: 0;
				position:relative;
				top:37px;
				width:134px;
				left:66px
			}
			ul.tabs li {
				margin-bottom: 8px;
				padding: 0;
				width:134px;
				height: 44px; /*--Subtract 1px from the height of the unordered list--*/
				line-height: 45px; /*--Vertically aligns the text within the tab--*/
				border: 0;				
				overflow: hidden;
				position: relative;

			}
			ul.tabs li a {
				text-decoration: none;
				color: white;
				display:block;
				width:134px;
				font-size: 14px;
				padding: 14px 0 14px 5px;
				height:44px;
				line-height:15px;
				outline: none;

			}
			
			ul.tabs li a:hover {
				
			}
			html ul.tabs li.active, html ul.tabs li.active a:hover  { /*--Makes sure that the active tab does not listen to the hover properties--*/
				 /*--Makes the active tab look like it's connected with its content--*/
			}

			.tab_container {
				border: 1px solid #999;
				border-top: none;
				overflow: hidden;
				clear: both;
				float: left; width: 100%;
				background: #fff;
			}
			.tab_content {
				padding: 20px;
			}

            table {
              border: none;
            }

            .name {
              color:#993300;
              font-weight:bold;
              text-align:right;
              width:160px;
            }

            .value {
              text-align:left;
            }





			#orderSample a { background-image:url('/SuperKids/images/layout/buttons/OrderOrderButton.gif'); }
			#orderSample a:hover { background-image:url('/SuperKids/images/layout/buttons/OrderOrderButton-on.gif'); }
			
			#viewCart { margin-bottom:58px }
			#viewCart a { background-image:url('/SuperKids/images/layout/buttons/OrderCartButton.gif'); }
			#viewCart a:hover { background-image:url('/SuperKids/images/layout/buttons/OrderCartButton-on.gif'); }

			#productAd { margin-bottom:10px; }
			#productAd a { background-image:url('/SuperKids/images/layout/buttons/OrderProductButton.gif'); }
			#productAd a:hover { background-image:url('/SuperKids/images/layout/buttons/OrderProductButton-on.gif'); }

			#details { margin-bottom:13px; }
			#details a { background-image:url('/SuperKids/images/layout/buttons/OrderSamplePackButton.gif'); }
			#details a:hover { background-image:url('/SuperKids/images/layout/buttons/OrderSamplePackButton-on.gif'); }

			#nutritional { margin-bottom: 9px }
			#nutritional a { background-image:url('/SuperKids/images/layout/buttons/OrderNutriButton.gif'); }
			#nutritional a:hover { background-image:url('/SuperKids/images/layout/buttons/OrderNutriButton-on.gif'); }

			#manufacturer { margin-bottom:68px; }
			#manufacturer a { background-image:url('/SuperKids/images/layout/buttons/OrderManufButton.gif'); }
			#manufacturer a:hover { background-image:url('/SuperKids/images/layout/buttons/OrderManufButton-on.gif'); }

			#viewSummary a { background-image:url('/SuperKids/images/layout/buttons/PrintAdButton.gif'); }
			#viewSummary a:hover { background-image:url('/SuperKids/images/layout/buttons/PrintAdButton-on.gif'); }


		</style>

    </head>
    <body>
 	    <link rel="stylesheet" href="${resource(dir:'css',file:'flexcrollstyles.css')}" />
	    <ul class="tabs">
			<g:if test="${!inCart && !customer.hasPlacedCurrentOrder}">
				<li id="orderSample"><g:link controller="product" action="add" id="${productInstance?.id}">&nbsp;</g:link></li>
				<li id="viewCart"><g:link controller="testShoppingCart" action="show">&nbsp;</g:link></li>
			</g:if>
			<g:else>
				<li id="viewCart" style="margin-top:50px"><g:link controller="testShoppingCart" action="show">&nbsp;</g:link></li>
			</g:else>
			<li class="tabbed" id="productAd"><a href="#tab1">&nbsp;</a></li>
			<li class="tabbed"  id="details"><a href="#tab2">&nbsp;</a></li>
			<li class="tabbed"  id="nutritional"><a href="#tab3">&nbsp;</a></li>
			<li class="tabbed"  id="manufacturer"><a href="#tab4">&nbsp;</a></li>
			<li id="viewSummary"><g:link action="downloadSummary" id="${productInstance.id}">&nbsp;</g:link></li>
		</ul>
		<div id="tab1" class="tab_content">

			<div class="productAd">

				<div id="productAdContainer">
					<img src="/SuperKids/uploads/${productInstance?.backgroundImage}" alt="Background Image" class="productAdImage" />
				</div>

			</div>

			<div class="contentFooter">
				<img class="contentFooterBL" style="float:left" alt="" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
				<img class="contentFooterBR" style="float:right" alt="" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
			</div>
		</div>

		<div id="tab2" class="tab_content">
			<div class="contentInsetUpper">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" alt="" style="float:right" />
			</div>
			<div  id="detailsContent" style="width:521px; padding:0; height:483px; margin:0 auto; position:absolute; top:100px; left:419px; overflow: auto;">

				<div style="width:471px; padding:0 10px 10px 10px; background:white; left:1px; height:100%; overflow:visible; position:relative;">
					<h2>${productInstance?.name} &reg;</h2>      <br/>
					${productInstance?.description}<br/>
					${productInstance?.details}
				</div>
			</div>

			<div class="contentInsetLower">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" alt="" style="float:right" />
			</div>


			<div class="contentFooter">
				<img class="contentFooterBL" style="float:left" alt="" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
				<img class="contentFooterBR" style="float:right" alt="" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
			</div>
		</div>

		<div id="tab3" class="tab_content">
			<div class="contentInsetUpper">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" alt="" style="float:right" />
			</div>
			<div class="contentInset">

				<div style="width:471px; padding:0 10px 10px 10px; background:white; min-height:468px; left:1px; position:absolute; height:auto !important; height:468px;">
					${productInstance?.nutrition}
				</div>
			</div>

			<div class="contentInsetLower">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" alt="" style="float:right" />
			</div>


			<div class="contentFooter">
				<img class="contentFooterBL" style="float:left" alt="" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
				<img class="contentFooterBR" style="float:right" alt="" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
			</div>
		</div>

		<div id="tab4" class="tab_content">
			<div class="contentInsetUpper">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" alt="" style="float:right" />
			</div>
			<div class="contentInset">

				<div style="width:471px; padding:0 10px 10px 10px; background:white; min-height:468px; left:1px; position:absolute; height:auto !important; height:468px;">
                    <h2>${productInstance?.name} &reg;</h2>      <br/>

                    <table>
                      <tr>
                        <td class="name" style="width:110px;">Manufacturer</td>
                        <td class="value">${productInstance?.sponsor?.name}</td>
                      </tr>

                      <tr>
                        <td class="name" style="width:110px;">Company Address</td>
                        <td class="value">${productInstance?.sponsor?.address}</td>
                      </tr>

                      <tr>
                        <td class="name" style="width:110px;">Main Telephone #</td>
                        <td class="value">${productInstance?.sponsor?.phone}</td>
                      </tr>

                      <tr>
                        <td class="name" style="width:110px;">Website Address</td>
                        <td class="value">${productInstance?.sponsor?.website}</td>
                      </tr>

                      <tr>
                        <td class="name" style="width:110px;">Sales Contact</td>
                        <td class="value">${productInstance?.sponsor?.salesContact}</td>
                      </tr>

                      <tr>
                        <td class="name" style="width:110px;">Sample Contact</td>
                        <td class="value">${productInstance?.sponsor?.salesContact}</td>
                      </tr>
                    </table>


				</div>
			</div>

			<div class="contentInsetLower">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" alt="" style="float:right" />
			</div>


			<div class="contentFooter">
				<img class="contentFooterBL" style="float:left" alt="" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
				<img class="contentFooterBR" style="float:right" alt="" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
			</div>
		</div>

		<script type="text/javascript">
			jQuery.noConflict()

			jQuery(document).ready(function(){
				//When page loads...
				jQuery(".tab_content").hide(); //Hide all content
				jQuery("ul.tabs li#details").addClass("active").show(); //Activate first tab
				jQuery(".tab_content:first").show(); //Show first tab content


				//On Click Event
				jQuery("ul.tabs li.tabbed").click(function() {


					jQuery("ul.tabs li.tabbed").removeClass("active"); //Remove any "active" class
					jQuery(this).addClass("active"); //Add "active" class to selected tab
					jQuery(".tab_content").hide(); //Hide all tab content

					var activeTab = jQuery(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
					jQuery(activeTab).show(); //Fade in the active ID content

                    fleXenv.fleXcrollMain("detailsContent");
					return false;
				});

			});
   		</script>
		<script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>
    </body>
</html>
