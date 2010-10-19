<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <g:javascript library="jquery" plugin="jquery"/>
    </head>
    <body>
  <div id="body">

    <div id="secondaryContent">
        <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

        <div id="SubNav">
                <h3>Broker/Distributor Menu</h3>
                <ul>
                    <li><g:link controller="home" action="broker_products">SuperKids Products</g:link></li>

                    <li><g:link controller="home" action="broker_whole_grain_benefits">Benefits of Whole Grains</g:link></li>

                    <li><g:link controller="home" action="broker_whole_grain_studies">Whole Grains & Human Health</g:link></li>

                    <li><g:link controller="home" action="incorporating_whole_grains_in_schools">Incorporating Whole Grains Into School Menus</g:link></li>

                    <li><g:link controller="home" action="broker_participate">How You Can Participate</g:link></li>

                    <li><g:link controller="home" action="broker_ecard">Send An eCard</g:link></li>

                </ul>
        </div>

        <div class="clear"></div>
        <div id="factoids">
            <p> <strong>Lorem Ipsum</strong><br/>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lobortis lectus sit amet diam rhoncus sodales. In massa enim, fermentum nec pulvinar non
            </p>
        </div>
	</div>
        <div id="HeaderBar">
			<sec:ifLoggedIn>
           		<div align="right">Welcome <sec:loggedInUserInfo field="username"/> - <g:link controller="home" action="edit_profile">Edit Profile</g:link></div>
      		</sec:ifLoggedIn>
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
