
<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="products" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <g:javascript library="jquery" plugin="jquery"/>
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'ui-lightness/jquery-ui-1.8.5.custom.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<style type="text/css">
			.contentInset {
			  width:516px;
			  padding:0;
			  height:483px;
			  margin:0 auto;
			  position:absolute;
			  top:100px;
			  right:15px;
			  overflow: auto;
			}


			.contentInsetUpper {
				width:486px;
				position:absolute;
				left:424px;
				top:90px;
				background:white;
				height:10px
			}

			.contentInsetLower {
				width:486px;
				position:absolute;
				left:424px;
				top:578px;
				background:white;
				height:7px;
				z-index:2;
				clear:both;
				padding-top:1px;
			}

			.contentInset p {
			  font-size:10px;
			  margin-top:0px;
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
			  background:url(../images/layout/contentFooter-bg.gif) repeat-x;
			  width:728px;
			  margin-left:4px;
			  position:absolute;
			  top:591px;
			  height:17px
			}


			ul.tabs {
				margin: 0;
				padding: 0;
				float: left;
				list-style: none;
				height: 32px; /*--Set height of tabs--*/
				border-bottom: 1px solid #999;
				border-left: 1px solid #999;
			}
			ul.tabs li {
				margin: 0;
				padding: 0;
				height: 31px; /*--Subtract 1px from the height of the unordered list--*/
				line-height: 31px; /*--Vertically aligns the text within the tab--*/
				border: 1px solid #999;
				border-left: none;
				margin-bottom: -1px; /*--Pull the list item down 1px--*/
				overflow: hidden;
				position: relative;
				background: #e0e0e0;
			}
			ul.tabs li a {
				text-decoration: none;
				color: #000;
				font-size: 1.2em;
				padding: 0 20px;
				
				outline: none;
			}
			ul.tabs li a:hover {
				background: #ccc;
			}
			html ul.tabs li.active, html ul.tabs li.active a:hover  { /*--Makes sure that the active tab does not listen to the hover properties--*/
				background: #fff;
				border-bottom: 1px solid #fff; /*--Makes the active tab look like it's connected with its content--*/
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
				font-size: 1.2em;
			}
		</style>

    </head>
    <body>
	    <ul class="tabs" style="position:relative; top:40px; left:31px">
			<li><g:link>Order Sample</g:link></li>
			<li><g:link controller="testShoppingCart" action="show">View Cart</g:link></li>
			<li id="productAd"><a href="#tab1">Product Ad</a></li>
			<li><a href="#tab2">Sample Details</a></li>
			<li><a href="#tab3">Nutritional Info</a></li>
			<li><a href="#tab4">Manufacturer</a></li>
			<li><g:link action="downloadSummary" id="${productInstance.id}">View Summary PDF</g:link></li>
		</ul>
		<div id="tab1" class="tab_content">
			<div class="contentInsetUpper">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" alt="" style="float:right" />
			</div>
			<div class="contentInset">

				<div style="width:500px; padding:0 10px 10px 10px; background:white; min-height:468px; right:30px; position:absolute; height:auto !important; height:468px;">
				</div>
			</div>

			<div class="contentInsetLower">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" alt="" style="float:right" />
			</div>


			<div class="contentFooter" style="position:absolute; right:0; width:815px; margin-right:0; background:url('/SuperKids/images/layout/contentFooter-bg.gif') repeat-x;">
				<img class="contentFooterBL" style="float:left" alt="" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
				<img class="contentFooterBR" style="float:right" alt="" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
			</div>
		</div>

		<div id="tab2" class="tab_content">
			<div class="contentInsetUpper">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" alt="" style="float:right" />
			</div>
			<div class="contentInset">

				<div style="width:500px; padding:0 10px 10px 10px; background:white; min-height:468px; right:30px; position:absolute; height:auto !important; height:468px;">
					<h2>${productInstance?.name}</h2>
					${productInstance?.description}<br/>
					${productInstance?.details}
				</div>
			</div>

			<div class="contentInsetLower">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" alt="" style="float:right" />
			</div>


			<div class="contentFooter" style="position:absolute; right:0; width:815px; margin-right:0; background:url('/SuperKids/images/layout/contentFooter-bg.gif') repeat-x;">
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

				<div style="width:500px; padding:0 10px 10px 10px; background:white; min-height:468px; right:30px; position:absolute; height:auto !important; height:468px;">
					<p>${productInstance?.nutrition}</p>
				</div>
			</div>

			<div class="contentInsetLower">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" alt="" style="float:right" />
			</div>


			<div class="contentFooter" style="position:absolute; right:0; width:815px; margin-right:0; background:url('/SuperKids/images/layout/contentFooter-bg.gif') repeat-x;">
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

				<div style="width:500px; padding:0 10px 10px 10px; background:white; min-height:468px; right:30px; position:absolute; height:auto !important; height:468px;">
					<p>${productInstance?.sponsor?.encodeAsHTML()}</p>
				</div>
			</div>

			<div class="contentInsetLower">
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" alt="" style="float:left" />
				<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" alt="" style="float:right" />
			</div>


			<div class="contentFooter" style="position:absolute; right:0; width:815px; margin-right:0; background:url('/SuperKids/images/layout/contentFooter-bg.gif') repeat-x;">
				<img class="contentFooterBL" style="float:left" alt="" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
				<img class="contentFooterBR" style="float:right" alt="" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
			</div>								
		</div>




		<script type="text/javascript">
			jQuery.noConflict()

			jQuery(document).ready(function(){
				//When page loads...
				jQuery(".tab_content").hide(); //Hide all content
				jQuery("ul.tabs li#productAd").addClass("active").show(); //Activate first tab
				jQuery(".tab_content:first").show(); //Show first tab content


				//On Click Event
				jQuery("ul.tabs li").click(function() {

					jQuery("ul.tabs li").removeClass("active"); //Remove any "active" class
					jQuery(this).addClass("active"); //Add "active" class to selected tab
					jQuery(".tab_content").hide(); //Hide all tab content

					var activeTab = jQuery(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
					jQuery(activeTab).show(); //Fade in the active ID content
					return false;
				});

			});
   		</script>	
    </body>
</html>
