<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'flexcrollstyles.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'tutorsty.css')}" />
      	<script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />

        <g:javascript library="jquery" plugin="jquery"/>
       <g:set var="products" value="${Product.findAllByLiveProduct(true)}" />
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <g:render template="/includes/google_analytics"/>
    </head>
    <body>
  <div id="body">

    <div id="secondaryContent">
        <g:link action="index"><img id="logo" style="margin-bottom:6px" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

		<h4 style="color:#88484C; font-size:10px; margin:0 0 0 57px; padding:0">SuperKids Participants</h4>
        <div id="Sponsordatabox">
        </div>

        <sks:sponsorList />

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
    <g:each in="${products}" var="product">
        <img alt="" src="${resource(dir:'uploads', file:product.backgroundImage)}" class="hoverProductAd" id="${product.id}"/>
    </g:each>
    <div id="content">
		<div id="contentInsetUpper">
			<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" style="float:left" />
			<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" style="float:right" />
		</div>
		<div id="contentInset" class="flexcroll" style="height:478px; padding:0; right:15px">

			<g:layoutBody />
		</div>

		<div id="contentInsetLower">
			<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" style="float:left" />
			<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" style="float:right" />
		</div>


		<div id="contentFooter">
			<img id="contentFooterBL" src="/images/layout/contentFooter-bl-bg.gif"/>
			<img id="contentFooterBR" src="/images/layout/contentFooter-br-bg.gif"/>
		</div>
	</div>

    <div id="footer">
      <ul>
        <li><a href="${createLink(controller:'home', action:'index')}">Home</a> | </li>
        <li><a href="${createLink(controller:'home', action:'about')}">About SuperKids</a> | </li>
					<li><a href="${createLink(controller:'home', action:'ultragrain_general')}">Ultragrain<span style="font: normal 8px;"><sup>&reg;</sup></span></a> | </li>
					<li><a href="${createLink(controller:'home', action:'sustagrain_general')}">Sustagrain<span style="font: normal 8px;"><sup>&reg;</sup></span></a> | </li>
        <li><a href="${createLink(controller:'home', action:'about_manufacturers')}">About The Manufacturers</a> | </li>
        <li><a href="${createLink(controller:'home', action:'where_to_find')}">Where to Find</a> | </li>
        <li><a href="${createLink(controller:'contactRequest', action:'create')}">Contact Us</a></li><br/>
        <li><a href="http://www.conagrafoods.com/utilities/legal.jsp">Legal Policy</a> | </li>
        <li><a href="http://www.conagrafoods.com/utilities/privacy.jsp">Privacy Policy</a> | </li>
        <li>&copy; Ardent Mills, Inc. All rights reserved.</li>
      </ul>

    </div>
  </div>

    </body>

    <script type="text/javascript">
      $(document).ready(function(){

          $('#products a img').hover(
              function(){
                var productId = $(this).parent().attr("class");
                var adId = "#" + productId;

                $(adId).fadeIn();



              },
              function(){
                var productId = $(this).parent().attr("class");
                var adId = "#" + productId;

                $(adId).fadeOut();
              }
          );

      });

    </script>

</html>
