<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From ConAgra Foods"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="jquery" plugin="jquery"/>
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
		<li id="${link=='what_is' ? 'current' : ''}"><g:link controller="home" action="what_is"><span>What Is SuperKids?</span></g:link></li>
		<li id="${link=='ultragrain' ? 'current' : ''}"><g:link controller="home" action="ultragrain"><span>About Ultragrain</span></g:link></li>
		<li id="${link=='sustagrain' ? 'current' : ''}"><g:link controller="home" action="sustagrain"><span>About Sustagrain</span></g:link></li>
		<li id="${link=='products' ? 'current' : ''}"><g:link controller="home" action="order"><span>SuperKids Products</span></g:link></li>
		<li id="${link=='chef_jeff' ? 'current' : ''}"><g:link controller="home" action="chef_jeff"><span>Chef Jeff at SNA</span></g:link></li>
		<li id="${link=='what_are_whole_grains' ? 'current' : ''}"><g:link controller="home" action="what_are_whole_grains"><span>What Are Whole Grains?</span></g:link></li>
		<li id="${link=='whole_grain_list' ? 'current' : ''}"><g:link controller="home" action="whole_grain_list"><span>List of Whole Grains</span></g:link></li>
		<li id="${link=='whole_grain_benefits' ? 'current' : ''}"><g:link controller="home" action="whole_grain_benefits"><span>Benefits of Whole Grains</span></g:link></li>
		<li id="${link=='healthy_hunger_free' ? 'current' : ''}"><g:link controller="home" action="healthy_hunger_free"><span>Healthy Hunger-Free Kids Act</span></g:link></li>
		<li id="${link=='my_plate' ? 'current' : ''}"><g:link controller="home" action="my_plate"><span>MyPlate</span></g:link></li>
		<li id="${link=='whole_grain_studies' ? 'current' : ''}"><g:link controller="home" action="whole_grain_studies"><span>Whole Grains & Human Health</span></g:link></li>
		<li id="${link=='childhood_obesity' ? 'current' : ''}"><g:link controller="home" action="childhood_obesity"><span>Meeting the Challenge</span></g:link></li>
		<li id="${link=='council_tips' ? 'current' : ''}"><g:link controller="home" action="council_tips"><span>Whole Grains Council Tips</span></g:link></li>
		<li id="${link=='usda_standards' ? 'current' : ''}"><g:link controller="home" action="usda_standards"><span>New USDA School Nutrition Standards </span></g:link></li>
		<li id="${link=='aliance' ? 'current' : ''}"><g:link controller="home" action="alliance"><span>NConAgra Mills and the Alliance for a Healthier Generation</span></g:link></li>
      </ul>
      <div class="ad">
        <h3>Win Prizes <span>for Your School District</span></h3>
        <p><img src="${resource(dir:'images',file:'img_bills.jpg')}" title="Money" class="left" />If you’ve already received your free samples, you could win a $100 gift card for your school district just for sharing your opinion.</p>
        <p><a href="${createLink(controller: 'home', action: 'assess')}" title="" class="btn"><span>Tell us what you think</span></a>
      </div>
      <!--<div class="ad">
        <h3>Whole Grain Nutrition, White Flour Appeal</h3>
        <p><img src="${resource(dir:'images',file:'logo_ultragrain_small.png')}" title="Ultragrain logo" class="left" />Did you know that Ultragrain flour provides 100% whole wheat flour without sacrificing the appealing taste, texture and appearance of white flour. <a href="#">Learn more »</a></p>
      </div>-->
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