<%@ page import="com.superkids.domain.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From Ardent Mills"/> </title>
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
      <a href="${createLink(controller: 'home', action: 'index')}" title="Return to the homepage"><img src="${resource(dir:'images',file:'logo_superkids.png')}" alt="SuperKids Logo" /></a>
      <h2>Build SuperKids <span>with Healthier Whole Grain Foods</span></h2>
        <div id="grain-logos">
            <a href="#" title="Learn more about Ultragrain">
                <img src="${resource(dir:'images',file:'ultragrain_logo_3.0.png')}" alt="Ultragrain logo" class="first" />
            </a>
        </div>
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
    </div>
    <div id="content">
        <g:layoutBody />
    </div>
  </div>
</div>

<div id="logo-container">
    <div id="logos" style="text-align:center">
      <g:render template="/includes/logos" />
  </div>
</div>
</div><div id="footer-container"><div id="footer">
      <g:render template="/includes/footer" />
  </div>
</div>
</body>
</html>
