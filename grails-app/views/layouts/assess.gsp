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
                <h3>Assess Menu</h3>
                <ul>
                    <li><g:link controller="assessment" action="start">Began Online Assessment</g:link></li>

                    <li><g:link controller="home" action="assessment_drawing_rules">Assessment Drawing Rules</g:link></li>

                    <li><g:link controller="home" action="assessment_tools">Other Assessment Tools</g:link></li>

                </ul>
        </div>

        <div class="clear"></div>
        <div id="factoids">
            <p> <strong>Lorem Ipsum</strong><br/>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lobortis lectus sit amet diam rhoncus sodales. In massa enim, fermentum nec pulvinar non
            </p>
        </div>
	</div>
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