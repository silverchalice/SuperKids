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

        <div id="PublicSubNav">
                <h3>Menu</h3>
                <ul>
                    <li id="${link=='public_products' ? 'current' : ''}"><g:link controller="home" action="public_products">SuperKids Products</g:link></li>

                    <li id="${link=='public_whole_grain_benefits' ? 'current' : ''}"><g:link controller="home" action="public_whole_grain_benefits">Benefits of Whole Grains</g:link></li>

                    <li id="${link=='public_whole_grain_studies' ? 'current' : ''}"><g:link controller="home" action="public_whole_grain_studies">Whole Grains & Human Health</g:link></li>

                    <li id="${link=='public_diets' ? 'current' : ''}"><g:link controller="home" action="public_diets">Adding Whole Grains In Children's Diets</g:link></li>

                    <li id="${link=='public_other_products' ? 'current' : ''}"><g:link controller="home" action="public_other_products">Other Products With Ultragrain</g:link></li>

                    <li id="${link=='public_whole_grain_in_schools' ? 'current' : ''}"><g:link controller="home" action="public_whole_grain_in_schools">Incorporating Whole Grains Into School Menus</g:link></li>

                    <li><g:link controller="contactRequest" action="create">Contact Us</g:link></li>

                </ul>
        </div>

        <div class="clear"></div>

		<div id="factoidsContainer">
			<strong>SuperKids Facts</strong>
			<div id="factoids">
			</div>
		</div>

	</div>

	<sks:factoidList />

	<div id="HeaderBar">

		<sec:ifLoggedIn>
			<div align="right">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div>
		</sec:ifLoggedIn>
		<sec:ifNotLoggedIn>
			&nbsp;
		</sec:ifNotLoggedIn>
	</div>
    <div id="nav">
      <span><g:link controller="home" action="index">LOG OUT</g:link></span>
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
        <li>&copy; ConAgra Foods, Inc. All rights reserved.</li>
      </ul>

    </div>


    </body>
</html>
