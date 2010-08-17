<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
  <div id="body">

    <div id="secondaryContent">
      <g:link action="index"><img id="logo" src="${resource(dir:'images',file:'logo.png')}" /></g:link>

      <div id="sideLogoBox">
        <g:link action='ultragrain'><img src="${resource(dir:'images',file:'ultragrain.gif')}" /></g:link>
        <g:link action='sustagrain'><img src="${resource(dir:'images',file:'sustagrain.gif')}" /></g:link>
      </div>

      <div class="clear"></div>

      <div id="factoids">

        <p> <strong>Lorem Ipsum</strong><br/>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lobortis lectus sit amet diam rhoncus sodales. In massa enim, fermentum nec pulvinar non
        </p>
      </div>

    </div>
    <div id="nav">
      <g:link controller="login" action="auth">LOG IN</g:link>
    </div>

    <g:layoutBody />

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
