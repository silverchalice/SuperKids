<%@ page import="com.superkids.domain.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From ConAgra Foods"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="jquery" plugin="jquery"/>
</head>
<body id="product">
<div id="header-container">
  <div id="header">
    <div id="logo">
      <div id="account-bar">
          <g:render template="/includes/account_bar"/>
           </div>
      <a href="${createLink(controller: 'home', action: 'index')}" title="Return to the homepage"><img src="${resource(dir:'images',file:'img_superkids_logo.jpg')}" alt="SuperKids Logo" /></a>
      <h2>Build SuperKids <span>with Healthier Whole Grain Foods</span></h2>
      <p>All made with Ultragrain&reg; and Sustagrain&reg;</p>
    </div>
    <g:render template="/includes/nav"/>
  </div>
</div>
<div id="main-container">
  <div id="main">
    <div id="sidebar">
      <ul id="side-nav">
        <h3>Full Product List</h3>
        <g:each in="${Product.topLevelProducts()}" var="product">

            <sks:productMenuItem id="${product?.id}" active="${productInstance?.id ?: ''}" />

        </g:each>

      </ul>
      <!--<div class="ad">
        <h3>Win Prizes <span>for Your School District</span></h3>
        <p><img src="${resource(dir:'images',file:'img_bills.jpg')}" title="Money" class="left" />If you’ve already received your free samples, you could win a $200 gift card for your school district just for sharing your opinion.</p>
        <p><a href="${createLink(controller: 'home', action: 'assess')}" title="" class="btn"><span>Tell us what you think</span></a>
      </div>
      <div class="ad">
        <h3>Whole Grain Nutrition, White Flour Appeal</h3>
        <p><img src="${resource(dir:'images',file:'logo_ultragrain_small.png')}" title="Ultragrain logo" class="left" />Did you know that Ultragrain flour provides 100% whole grain nutrition without sacrificing the appealing taste, texture and appearance of white flour. <a href="${createLink(controller: 'home', action: 'ultragrain_general')}">Learn more »</a></p>
      </div>  -->
    </div>
    <div id="content">
        <g:layoutBody />
    </div>
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
