<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page import="com.superkids.domain.Product" %>

<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:set var="currentProductId" value="${pageProperty(name: 'meta.currentProductId')}"/>
        <g:layoutHead />
		<link rel="stylesheet" href="${resource(dir:'css',file:'flexcrollstyles.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'tutorsty.css')}" />
		<g:javascript library="jquery" plugin="jquery" />
    </head>
    <body>



	<script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>

 	<div id="body">

    <div id="secondaryContent">
      <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

      <div class="clear"></div>

      <div id="assessProducts">
		    <div id="assessProductsUpper"></div>
		    <div id="assessProductsInner" class="flexcroll">
                            <g:if test="${products}">
				<g:each in="${products}" var="product">
					<div class="${product?.id.toInteger() == currentProductId?.toInteger() ? 'assessmentProductHover' : 'assessmentProduct'}">
						<g:link controller="assessment" action="start" id="${product.id}"><img src="${createLink(controller:'product', action:'displayImage', id:product.id)}"/></g:link>
						<div class="assessmentProductText" style="padding-top:5px; ">
						<span style="font-size:11px;">${product.name}</span> <br/>
						<span style="font-size:9px;">${product.sponsor.name}</span><br />
						</div>
						<g:link controller="assessment" action="dnr" class="assessmentDNR" id="${product.id}">Did Not Receive?</g:link>
					</div>
				</g:each>
                            </g:if>
                            <g:else>
                            <p style="border:1px solid; margin-left:10px; padding:15px 10px; height:270px; width:160px; background-color:#FFEBA8;"><strong>You haven't ordered any samples yet.</strong> When your order is completed, the samples in your order will appear here and you can assess them.</p>
                            </g:else>
			</div>
		    <div id="assessProductsLower"></div>
      </div>

    </div>
        <div id="HeaderBar">
			<sec:ifLoggedIn>
           		<div align="right">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div>
      		</sec:ifLoggedIn>
			<sec:ifNotLoggedIn>
				&nbsp;
			</sec:ifNotLoggedIn>
        </div>
    <div id="nav">
      <g:link controller="home" action="learn">LEARN</g:link>
      <g:link controller="home" action="order">ORDER</g:link>
      <g:link controller="home" class="current" action="assess">ASSESS</g:link>
      <g:link controller="home" action="promote">PROMOTE</g:link>
      <span><g:link controller="logout">LOG OUT</g:link></span>
    </div>
	<div id="content">
		<div id="contentInsetUpper">
			<img src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" style="float:left" />
			<img src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" style="float:right" />
		</div>
		<div id="contentInset" class="flexcroll">
			<g:layoutBody />
		</div>

		<div id="contentInsetLower">
			<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" style="float:left" />
			<img src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" style="float:right" />
		</div>


		<div id="contentFooter">
			<img id="contentFooterBL" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
			<img id="contentFooterBR" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
		</div>
	</div>

    <div id="footer">
      <ul>
        <li><a href="#">Home</a> | </li>
        <li><a href="#">About Super Kids</a> | </li>
        <li><a href="#">Ultragrain&reg;</a> | </li>
        <li><a href="#">Sustagrain&reg;</a> | </li>
        <li><a href="#">About Our Manufacturers</a> | </li>
        <li><a href="#">Where to Find</a> | </li>
        <li><a href="#">Contact Us</a></li><br/>
        <li><a href="#">Legal Policy</a> | </li>
        <li><a href="#">Privacy Policy</a> | </li>
        <li>&copy; ConAgra Foods, Inc. All rights reserved</li>
      </ul>

    </div>
  </div>

    </body>
</html>
