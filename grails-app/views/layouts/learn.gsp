<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From ConAgra Foods"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
</head>
<body id="resources">
<div id="header-container">
  <div id="header">
    <div id="logo">
      <div id="account-bar" class="logged-out">
        <g:render template="/includes/account_bar"/>
      </div>
      <a href="${createLink(controller: 'home', action: 'index')}"" title="Return to the homepage"><img src="${resource(dir:'images',file:'img_superkids_logo.jpg')}" alt="SuperKids Logo" /></a>
      <h2>Build SuperKids <span>with Healthier Whole Grain Foods</span></h2>
    </div>
    <g:render template="/includes/nav"/>
  </div>
</div>
<div id="main-container">
  <div id="main">
    <div id="sidebar">
      <ul id="side-nav">
        <h3>All Resources</h3>
		<li id="${link=='chef_jeff' ? 'current' : ''}"><g:link controller="home" action="chef_jeff"><span>Chef Jeff at SNA</span></g:link></li>
        <li id="${link=='usda_standards' ? 'current' : ''}"><g:link controller="home" action="usda_standards"><span>New USDA Nutrition Standards </span></g:link></li>
		<li id="${link=='my_plate' ? 'current' : ''}"><g:link controller="home" action="my_plate"><span>MyPlate</span></g:link></li>
		<li id="${link=='childhood_obesity' ? 'current' : ''}"><g:link controller="home" action="childhood_obesity"><span>Meeting the Challenge</span></g:link></li>
		<li id="${link=='council_tips' ? 'current' : ''}"><g:link controller="home" action="council_tips"><span>Whole Grains Council Tips</span></g:link></li>
		<li id="${link=='aliance' ? 'current' : ''}"><g:link controller="home" action="alliance"><span>Alliance for a Healthier Generation</span></g:link></li>
         <li id="${link=='promotion_tools_and_resources' ? 'current' : ''}"><g:link controller="home" action="promotion_tools_and_resources"><span>Promotional Tools & Resources</span></g:link></li>
        <li id="${link=='additional_promotional_ideas' ? 'current' : ''}"><g:link controller="home" action="additional_promotional_ideas"><span>Additional Promotional Ideas</span></g:link></li>

      </ul>
      <!--<div class="ad">
        <h3>Win Prizes <span>for Your School District</span></h3>
        <p><img src="${resource(dir:'images',file:'img_bills.jpg')}" title="Money" class="left" />If you’ve already received your free samples, you could win a $100 gift card for your school district just for sharing your opinion.</p>
        <p><a href="${createLink(controller: 'home', action: 'assess')}" title="" class="btn"><span>Tell us what you think</span></a>
      </div>   -->
      <div class="ad">
        <h3>Whole Grain Nutrition, White Flour Appeal</h3>
        <p><img src="${resource(dir:'images',file:'logo_ultragrain_small.png')}" title="Ultragrain logo" class="left" />Did you know that Ultragrain flour provides 100% whole grain nutrition without sacrificing the appealing taste, texture and appearance of white flour. <a href="${createLink(controller: 'home', action: 'ultragrain')}">Learn more »</a></p>
      </div>
    </div>
    <g:layoutBody/>
  </div>
</div>
<div id="footer-container">
  <div id="logos">
      <g:render template="/includes/logos" />
  </div>
  <div id="footer">
      <g:render template="/includes/footer" />
  </div>
</div>
</body>
</html>