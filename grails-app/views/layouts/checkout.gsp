<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />

		<link rel="stylesheet" href="${resource(dir:'css',file:'flexcrollstyles.css')}" />
		<script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <g:render template="/includes/google_analytics" />

    </head>
    <body>
  <div id="body">

    <div id="secondaryContent">
      <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

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
        <sec:ifLoggedIn>
            <g:link controller="home" action="learn">LEARN</g:link>
            <g:link class="current" controller="home" action="order">ORDER</g:link>
            <g:link controller="home" action="assess">ASSESS</g:link>
            <g:link controller="home" action="promote">PROMOTE</g:link>
            <span><g:link controller="logout">LOG OUT</g:link></span>
        </sec:ifLoggedIn>
      <sec:ifNotLoggedIn>
          <span><g:link controller="login" action="auth">LOG IN</g:link></span>
      </sec:ifNotLoggedIn>
    </div>
	<div id="content">
		<div id="contentInsetUpper">
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" style="float:left" />
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" style="float:right" />
		</div>
		<div id="contentInset" style="height:478px; overflow:auto" class="flexcroll">
			<g:layoutBody />
		</div>

		<div id="contentInsetLower">
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" style="float:left" />
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" style="float:right" />
		</div>


		<div id="contentFooter">
			<img alt="" id="contentFooterBL" src="/images/layout/contentFooter-bl-bg.gif"/>
			<img alt="" id="contentFooterBR" src="/images/layout/contentFooter-br-bg.gif"/>
		</div>
	</div>

    <div id="footer">
      <ul>
        <li><a href="${createLink(controller:'home', action:'index')}">Home</a> | </li>
        <li><a href="${createLink(controller:'home', action:'about')}">About SuperKids</a> | </li>
        <li><a href="${createLink(controller:'home', action:'ultragrain_general')}">Ultragrain&reg;</a> | </li>
        <li><a href="${createLink(controller:'home', action:'sustagrain_general')}">Sustagrain&reg;</a> | </li>
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
</html>
