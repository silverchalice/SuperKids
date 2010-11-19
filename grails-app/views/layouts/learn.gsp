<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>

        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'flexcrollstyles.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'tutorsty.css')}" />

		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:set var="link" value="${pageProperty(name: 'meta.link')}"/>
        <g:layoutHead />
        <g:javascript library="application" />
        <g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources />
    </head>
    <body>
		<script type="text/javascript" src="${resource(dir:'js', file:'flexcroll.js')}"></script>

  		<div id="body">

			<div id="secondaryContent">
				<g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

				<div id="LearnSubNav">
						<h3 style="margin-left:62px; margin-top:5px; font-size:14px">Learn Menu</h3>
						<ul>
							<li id="${link=='what_is' ? 'current' : ''}"><g:link controller="home" action="what_is">What Is SuperKids?</g:link></li>

							<li id="${link=='ultragrain' ? 'current' : ''}"><g:link controller="home" action="ultragrain">About Ultragrain</g:link></li>

							<li id="${link=='sustagrain' ? 'current' : ''}"><g:link controller="home" action="sustagrain">About Sustagrain</g:link></li>

							<li id="${link=='products' ? 'current' : ''}"><g:link controller="product" action="list">SuperKids Products</g:link></li>

							<li id="${link=='testimonials' ? 'current' : ''}"><g:link controller="home" action="testimonials">Testimonials</g:link></li>

							<li id="${link=='what_are_whole_grains' ? 'current' : ''}"><g:link controller="home" action="what_are_whole_grains">What Are Whole Grains?</g:link></li>

							<li id="${link=='whole_grain_list' ? 'current' : ''}"><g:link controller="home" action="whole_grain_list">List of Whole Grains</g:link></li>

							<li id="${link=='whole_grain_benefits' ? 'current' : ''}"><g:link controller="home" action="whole_grain_benefits">Benefits of Whole Grains</g:link></li>

							<li id="${link=='whole_grain_studies' ? 'current' : ''}"><g:link controller="home" action="whole_grain_studies">Whole Grains & Human Health</g:link></li>

							<li id="${link=='childhood_obesity' ? 'current' : ''}"><g:link controller="home" action="childhood_obesity">Meeting the Challenge</g:link></li>

							<li id="${link=='council_tips' ? 'current' : ''}"><g:link controller="home" action="council_tips">Whole Grains Council Tips</g:link></li>

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
			<sec:ifLoggedIn>
				<div id="HeaderBar">
					<sec:ifLoggedIn>
						<div align="right">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div>
					</sec:ifLoggedIn>
				</div>
			</sec:ifLoggedIn>
				<div id="nav">
				  <g:link controller="home" class="current" action="learn">LEARN</g:link>
				  <g:link controller="home" action="order">ORDER</g:link>
				  <g:link controller="home" action="assess">ASSESS</g:link>
				  <g:link controller="home" action="promote">PROMOTE</g:link>
				  <span id="login"><g:link controller="logout">LOG OUT</g:link></span>
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
