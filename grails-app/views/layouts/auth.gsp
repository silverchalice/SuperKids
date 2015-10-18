<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From ConAgra Foods"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
</head>
<body>
<div id="header-container">
  <div id="header">
    <div id="logo">
      <div id="account-bar">
        <g:render template="/includes/account_bar"/>
      </div>
      <a href="#" title="Return to the homepage"><img src="${resource(dir:'images',file:'logo_superkids.png')}" alt="SuperKids Logo" /></a>
      <h2>SuperKids <span>The whole grain sampling program featuring</span></h2>

      <div id="grain-logos"><a href="#" title="Learn more about Ultragrain"><img src="${resource(dir:'images',file:'ultragrain_logo_small_2.0.png')}" alt="Ultragrain logo" class="first" /></a>
      </div>
    </div>
      <g:render template="/includes/nav"/>

  </div>
</div>
<div id="main-container">
   <g:layoutBody/>
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