<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'flexcrollstyles.css')}" />

        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:set var="link" value="${pageProperty(name: 'meta.link')}"/>
        <g:layoutHead />
        <g:javascript library="jquery" plugin="jquery"/>
        <script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>
    </head>
    <body>
  <div id="body">

    <div id="secondaryContent">
        <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

        <div id="AssessSubNav">
                <h3>Assess Menu</h3>
                <ul>
                    <li><g:link controller="assessment" action="assess_process">Begin Online Assessment</g:link></li>

                    <li id="${link=='assessment_drawing_rules' ? 'current' : ''}"><g:link controller="home" action="assessment_drawing_rules">Assessment Drawing Rules</g:link></li>

                    <li id="${link=='assessment_tools' ? 'current' : ''}"><g:link controller="home" action="assessment_tools">Other Assessment Tools</g:link></li>

                </ul>
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
			<sec:ifLoggedIn>
           		<div align="right">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div>
      		</sec:ifLoggedIn>
        </div>
    <div id="nav">
      <g:link controller="home" action="learn">LEARN</g:link>
      <g:link controller="home" action="order">ORDER</g:link>
      <g:link class="current" controller="home" action="assess">ASSESS</g:link>
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
