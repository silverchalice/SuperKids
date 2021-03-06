<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From Ardent Mills"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="jquery" plugin="jquery"/>
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

    </div>
      <g:render template="/includes/nav"/>

  </div>
</div>
<div id="main-container">
  <div id="main" style="overflow: hidden"> <!-- FireFox Hack -->
   <g:layoutBody/>
  </div>
</div>
<div id="footer-container">
  <div id="logos" style="text-align:center">
      <g:render template="/includes/logos" />
  </div>
  <div id="footer">
      <g:render template="/includes/footer" />
  </div>
</div>
</body>
</html>