<%@ page import="com.superkids.domain.Product" %>

<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:set var="products" value="${Product.list()}" />
    </head>
    <body>
  <div id="body">

    <div id="secondaryContent">
      <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

      <div id="sideLogoBox">
        <g:link action='ultragrain'><img src="${resource(dir:'images',file:'ultragrain.gif')}" /></g:link>
      </div>

      <div class="clear"></div>

      <div id="factoids">
          <p>
          <g:each in="${products}" var="product">
              <g:link controller="product" action="show" id="${product.id}"><img src="${createLink(controller:'product', action:'displayImage', id:product.id)}" width="65" height="50" style="margin:3px;" /></g:link>
          </g:each>
          </p>
      </div>

    </div>
      <sec:ifLoggedIn>
        <div id="HeaderBar"> 
            <div align="right" style="padding-top: 15px;">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div> 
        </div>
        </sec:ifLoggedIn>
    <div id="nav">
      <g:link controller="home" action="learn">LEARN</g:link>
      <g:link controller="home" action="order">ORDER</g:link>
      <g:link controller="home" action="assess">ASSESS</g:link>
      <g:link controller="home" action="promote">PROMOTE</g:link>
      <span><g:link controller="logout">LOG OUT</g:link></span>
    </div>
    <div id="content">
        <div id="contentInset">
            <g:layoutBody />
        </div>
        <div id="contentFooter" style="margin-left:227px">
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
