<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From ConAgra Foods"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="jquery" plugin="jquery"/>
</head>
<body id="home">
<div id="header-container">
  <div id="header">
    <div id="logo">
      <div id="account-bar">
        <g:render template="/includes/account_bar"/>
      </div>
      <a href="${createLink(uri: '/')}" title="Return to the homepage"><img src="${resource(dir:'images',file:'img_superkids_logo.jpg')}" alt="SuperKids Logo" /></a>
      <h2>Build SuperKids <span>with Healthier Whole Grain Foods</span></h2>
      <div id="grain-logos"><a href="#" title="Learn more about Ultragrain"><img src="${resource(dir:'images',file:'logo_ultragrain_small_ie6.png')}" alt="Ultragrain logo" class="first" /></a><a href="#" title="Learn more about Sustagrain"><img src="${resource(dir:'images',file:'logo_sustagrain_small_ie6.png')}" alt="Sustagrain logo" /></a>
        <p>Featuring Ultragrain&reg; <span class="amp">&amp;</span> Sustagrain&reg;</p>
      </div>
    </div>
      <g:render template="/includes/nav"/>

  </div>
</div>
<div id="main-container">
  <div id="main">
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