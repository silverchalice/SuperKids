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
        <div id="SubNavBox">
            <div><img src="images/layout/SubNav/SubNavTop.gif" style="width:255; height:16"></div>
            <div id="SubNavLeft"></div>
            <div id="SubNavMain">
                <div id="SubNavTitle">Broker/Distributor Menu<br /></div>

                <div id="SubNavText">
                    <div style="float:left;width:10px;">&middot;&nbsp;</div><div style="float:left;width:195px;"><g:link controller="home" action="broker_products">SuperKids Products</g:link></div>
                    <div style="clear:both;"></div>
                    <div style="float:left;width:10px;">&middot;&nbsp;</div><div style="float:left;width:195px;"><g:link controller="home" action="broker_whole_grain_benefits">Benefits of Whole Grains</g:link></div>
                    <div style="clear:both;"></div>
                    <div style="float:left;width:10px;">&middot;&nbsp;</div><div style="float:left;width:195px;"><g:link controller="home" action="broker_whole_grain_studies">Whole Grains & Human Health</g:link></div>
                    <div style="clear:both;"></div>
                    <div style="float:left;width:10px;">&middot;&nbsp;</div><div style="float:left;width:195px;"><g:link controller="home" action="incorporating_whole_grains_in_schools">Incorporating Whole Grains Into School Menus</g:link></div>
                    <div style="clear:both;"></div>
                    <div style="float:left;width:10px;">&middot;&nbsp;</div><div style="float:left;width:195px;"><g:link controller="home" action="broker_participate">How You Can Participate</g:link></div>
                    <div style="clear:both;"></div>
                    <div style="float:left;width:10px;">&middot;&nbsp;</div><div style="float:left;width:195px;"><g:link controller="home" action="broker_ecard">Send An eCard</g:link></div>
                    <div style="clear:both;"></div>
                </div>
            </div>
        </div>
        <div  id="SubNavRight"></div>
        <div style="clear:both;"></div>
        <div><img SRC="images/layout/SubNav/SubNavBtm.gif" WIDTH="255" HEIGHT="20"></div>
        <div class="clear"></div>
        <div id="factoids">
            <p> <strong>Lorem Ipsum</strong><br/>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lobortis lectus sit amet diam rhoncus sodales. In massa enim, fermentum nec pulvinar non
            </p>
        </div>
	</div>

    <div id="nav">
      <g:link controller="home" action="index">LOG OUT</g:link>
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
