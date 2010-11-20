<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />

        <g:javascript library="jquery" plugin="jquery"/>
        <g:set var="products" value="${Product.findAllByLiveProduct(true)}" />

		<link rel="stylesheet"href="${resource(dir:'css', file:'flexcrollstyles.css')}" />
		<script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>


		<style type="text/css">
			#contentInsetUpper {
				width:601px;
				left:309px;

			}

			#contentInsetInner {
				width:581px;
				position:relative;
				left:40px;
			}

		</style>		
    </head>
    <body>
  <div id="body">

    <div id="secondaryContent">
        <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

        
        <div id="products">
          <sks:productBox />
        </div>
	</div>

        <div id="HeaderBar"> 
			<sec:ifLoggedIn>
           		<div align="right">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div>
      		</sec:ifLoggedIn>
        </div>

    <div id="nav">
      <g:link controller="home" action="learn">LEARN</g:link>
      <g:link controller="home" class="current" action="order">ORDER</g:link>
      <g:link controller="home" action="assess">ASSESS</g:link>
      <g:link controller="home" action="promote">PROMOTE</g:link>
      <span><g:link controller="logout">LOG OUT</g:link></span>
    </div>
    <div id="content">
		<div id="contentInsetUpper">
			<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" style="float:left" />
			<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" style="float:right" />
		</div>
		<div id="contentInset" style="height:478px; padding:0; right:15px">
			<g:layoutBody />
		</div>

		<div id="contentInsetLower" style="width:601px;left:309px; top:534px; height:50px; background:#FFC100; background-image:url('/SuperKids/images/YellowBar.gif')">
			<sks:hasNotPlacedCurrentOrder>
			<g:link controller="product" style="background:url('/SuperKids/images/layout/buttons/CheckoutButton.gif') no-repeat left top; height:34px; width:170px; position:absolute; top:10px; left:149px;" action="check_out"></g:link>
			<g:link controller="home" style="background:url('/SuperKids/images/layout/buttons/ContinueShoppingButton.gif') no-repeat left top; height:34px; width:175px; position:absolute; top:10px; left:303px;" action="order"></g:link>
			<a href="#" style="background:url('/SuperKids/images/layout/buttons/PrintButton.gif') no-repeat left top; height:34px; width:120px; position:absolute; top:10px; left:481px;" onclick="window.print(); return false;"></a>
		   </sks:hasNotPlacedCurrentOrder>
		</div>


		<div id="contentFooter">
			<img id="contentFooterBL" alt="" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
			<img id="contentFooterBR" alt="" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
		</div>
	</div>

    <div id="footer">
      <ul>
        <li><a href="${createLink(controller:'home', action:'index')}">Home</a> | </li>
        <li><a href="${createLink(controller:'home', action:'about')}">About Super Kids</a> | </li>
					<li><a href="${createLink(controller:'home', action:'ultragrain_general')}">Ultragrain<span style="font: normal 8px;"><sup>&reg;</sup></span></a> | </li>
					<li><a href="${createLink(controller:'home', action:'sustagrain_general')}">Sustagrain<span style="font: normal 8px;"><sup>&reg;</sup></span></a> | </li>
        <li><a href="${createLink(controller:'home', action:'about_manufacturers')}">About Our Manufacturers</a> | </li>
        <li><a href="${createLink(controller:'home', action:'where_to_find')}">Where to Find</a> | </li>
        <li><a href="${createLink(controller:'contactRequest', action:'create')}">Contact Us</a></li><br/>
        <li><a href="http://www.conagrafoods.com/utilities/legal.jsp">Legal Policy</a> | </li>
        <li><a href="http://www.conagrafoods.com/utilities/privacy.jsp">Privacy Policy</a> | </li>
        <li>&copy; ConAgra Foods, Inc. All rights reserved</li>
      </ul>

    </div>
  </div>

    </body>
</html>
