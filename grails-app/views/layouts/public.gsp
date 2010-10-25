<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'flexcrollstyles.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <g:javascript library="jquery" plugin="jquery"/>
    </head>
    <body>
  <div id="body">
	<script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>
    <div id="secondaryContent">
      <g:link action="index"><img id="logo" alt="SuperKids" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

      <div id="sideLogoBox">
          <g:link action='ultragrain'><img alt="ultragrain" src="${resource(dir:'images',file:'ultragrain.gif')}" /></g:link>
          <g:link action='sustagrain'><img alt="sustagrain" src="${resource(dir:'images',file:'sustagrain.gif')}" /></g:link>
      </div>

      <div class="clear"></div>

		<div id="factoidsContainer">
			<strong>SuperKids Facts</strong>
			<div id="factoids">
			</div>
		</div>

        <sks:factoidList />

    </div>
	<div id="HeaderBar">
		&nbsp;
		<sec:ifLoggedIn>
			<div style="float:right">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div>
		</sec:ifLoggedIn>
	</div>

    <div id="nav">
      <span><g:link controller="login" action="auth">LOG IN</g:link></span>
    </div>
	  
	<div id="content">
		<div id="contentInsetUpper">
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-InnerUpLeft.gif')}" style="float:left" />
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-innerUpRight.gif')}" style="float:right" />
		</div>
		<div id="contentInset" class="flexcroll">
			<g:layoutBody />
		</div>

		<div id="contentInsetLower">
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-InnerBtmLt.gif')}" style="float:left" />
			<img alt="" src="${resource(dir:'images/layout', file:'SDA-InnerBtmRight.gif')}" style="float:right" />
		</div>


		<div id="contentFooter">
			<img alt=""id="contentFooterBL" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
			<img alt="" id="contentFooterBR" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>
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
