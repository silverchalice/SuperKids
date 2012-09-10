<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From ConAgra Foods"/> </title>
<title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From ConAgra Foods"/> </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="SuperKids is a unique, FREE sampling program for K-12 foodservice directors featuring whole grain products made with Ultragrain whole wheat and Sustagrain, the ultra-high fiber whole grain. It offers multiple options for introducing higher fiber and healthy whole grains into snack, breakfast and lunch school district menus. SuperKids gives foodservice directors the opportunity to easily evaluate new whole grain products for taste, texture and appearance. With SuperKids, every snack and meal can deliver more whole grains and taste great. " />
    <meta name="keywords" content="foodservice, school lunch, lunch food, superkids, super kids, food sampling program, conagra mills, conagra foods, ultragrain, sustagrain" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'screen.css')}" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="jquery" plugin="jquery"/>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-18800741-2']);
        _gaq.push(['_trackPageview']);

       (function() {
           var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
           ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
           var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
       })();
    </script>
    <!--[if gte IE 9]>
      <style type="text/css">
        .gradient {
           filter: none;
        }
      </style>
    <![endif]-->
    <!--[if lt IE 9]>
     <link href="css/ie8.css" rel="stylesheet" type="text/css" media="screen"   />
     <![endif]-->
    <!--[if lt IE 8]>
     <link href="css/ie7.css" rel="stylesheet" type="text/css" media="screen"   />
     <![endif]-->
    <!--[if lt IE 7]>
     <link href="css/ie6.css" rel="stylesheet" type="text/css" media="screen"   />
     <![endif]-->
    <link rel="shortcut icon" type="image/ico" href="favicon.ico" />
</head>
<body id="home">
<div id="header-container">
  <div id="header">
    <div id="logo">
      <div id="account-bar">
          <sec:ifNotLoggedIn>
              <span><g:link controller="login" action="auth">LOG IN</g:link></span>
          </sec:ifNotLoggedIn>
          <sec:ifLoggedIn>
              <a href="#" class="order" title="Review your order and check out">Your Order (3 items)</a> <span class="sep">|</span> <g:link controller="home" action="edit_profile" title="Review and edit your account email">Your Account</g:link> <span class="sep">|</span> <g:link controller="logout" action="index" title="Log in to your account to order">Log Out</g:link>
          </sec:ifLoggedIn>

      </div>
      <a href="#" title="Return to the homepage"><img src="${resource(dir:'images',file:'img_superkids_logo.jpg')}" alt="SuperKids Logo" /></a>
      <h2>Build SuperKids <span>with Healthier Whole Grain Foods</span></h2>
      <div id="grain-logos"><a href="#" title="Learn more about Ultragrain"><img src="${resource(dir:'images',file:'logo_ultragrain_small_ie6.png')}" alt="Ultragrain logo" class="first" /></a><a href="#" title="Learn more about Sustagrain"><img src="${resource(dir:'images',file:'logo_sustagrain_small_ie6.png')}" alt="Sustagrain logo" /></a>
        <p>Featuring Ultragrain&reg; <span class="amp">&amp;</span> Sustagrain&reg;</p>
      </div>
    </div>
    <?php include('nav.php') ?>
  </div>
</div>
<div id="main-container">
  <div id="main">
   <g:layoutBody/>
  </div>
</div>
<div id="footer-container">
  <div id="logos">
      <h5>We&#8217;re Proud to Feature These Great Brands <span>&#8212; All made with Ultragrain&reg; or Sustagrain&reg;</span></h5>
      <a href="#" title="View this company's product samples"><img src="${resource(dir:'images',file:'logo_azteca.jpg')}" alt="Azteca logo" /></a>
      <a href="#" title="View this company's product samples"><img src="${resource(dir:'images',file:'logo_conagra_mills.jpg')}" alt="ConAgra Mills logo" /></a>
      <a href="#" title="View this company's product samples"><img src="${resource(dir:'images',file:'logo_dominos.jpg')}" alt="Domino's Pizza logo" /></a>
      <a href="#" title="View this company's product samples"><img src="${resource(dir:'images',file:'logo_pepperidge_farm.jpg')}" alt="Pepperidge Farm logo" /></a>
      <a href="#" title="View this company's product samples"><img src="${resource(dir:'images',file:'logo_eoni.jpg')}" alt="Eoni logo" /></a>
      <a href="#" title="View this company's product samples"><img class="last" src="${resource(dir:'images',file:'logo_kelloggs.jpg')}" alt="Kellogg's logo" /></a>
  </div>
  <div id="footer">
      <ul id="page-links">
        <li><a href="${createLink(controller:'home', action:'index')}" title="#">Home</a></li>
        <li><a href="${createLink(controller:'home', action:'about')}" title="#">About SuperKids</a></li>
        <li><a href="${createLink(controller:'home', action:'ultragrain_general')}">Ultragrain</a></li>
        <li><a href="${createLink(controller:'home', action:'sustagrain_general')}">Sustagrain</a></li>
        <li><a href="${createLink(controller:'home', action:'about_manufacturers')}">The Manufacturers</a></li>
        <li><a href="${createLink(controller:'home', action:'where_to_find')}">Where to Find</a></li>
        <li><a href="${createLink(controller:'contactRequest', action:'create')}" title="#">Contact Us</a></li>
      </ul>
      <p id="legal"> <a href="http://www.conagrafoods.com/utilities/legal.jsp" title="#">Legal Policy</a> <span class="sep">|</span> <a href="http://www.conagrafoods.com/utilities/privacy.jsp" title="#">Privacy Policy</a> <span class="sep">|</span> &copy; <a href="http://www.conagrafoods.com/" title="Visit ConAgra Foods">ConAgra Foods</a>, Inc. All rights reserved. </p>
  </div>
</div>
</body>
</html>