<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page import="com.superkids.domain.Product" %>

<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
    </head>
    <body>

  <div id="body">

    <div id="secondaryContent">
      <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>
      <div class="clear"></div>

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
		<g:layoutBody />
	</div>

    <div id="footer">
      <ul>
        <li><a href="${createLink(controller:'home', action:'index')}">Home</a> | </li>
        <li><a href="${createLink(controller:'home', action:'about')}">About Super Kids</a> | </li>
					<li><a href="${createLink(controller:'home', action:'ultragrain_general')}">Ultragrain<span style="font: normal 8px;"><sup>&reg;</sup></span></a> | </li>
					<li><a href="${createLink(controller:'home', action:'sustagrain_general')}">Sustagrain<span style="font: normal 8px;"><sup>&reg;</sup></span></a> | </li>
        <li><a href="${createLink(controller:'home', action:'about_manufacturers')}">About The Manufacturers</a> | </li>
        <li><a href="${createLink(controller:'home', action:'where_to_find')}">Where to Find</a> | </li>
        <li><a href="${createLink(controller:'contactRequest', action:'create')}">Contact Us</a></li><br/>
        <li><a href="http://www.conagrafoods.com/utilities/legal.jsp">Legal Policy</a> | </li>
        <li><a href="http://www.conagrafoods.com/utilities/privacy.jsp">Privacy Policy</a> | </li>
        <li>&copy; ConAgra Foods, Inc. All rights reserved.</li>
      </ul>

    </div>
  </div>

    </body>
</html>
