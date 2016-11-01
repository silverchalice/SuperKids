<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Welcome to the SuperKids Sampling Program! | From Ardent Mills"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
</head>
<body id="about">
<div id="header-container">
    <div id="header">
        <div id="logo">
            <div id="account-bar" class="logged-out">
                <g:render template="/includes/account_bar"/>
            </div>
            <a href="${createLink(uri: '/')}" title="Return to the homepage"><img src="${resource(dir:'images',file:'logo_superkids.png')}" alt="SuperKids Logo" /></a>
            <h2>SuperKids: <span>The whole grain sampling program featuring</span></h2>
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
                <h3>About Us</h3>
                <li id="${link=='what_is' ? 'current' : ''}"><g:link controller="home" action="what_is"><span>What is SuperKids?</span></g:link></li>
                <li id="${link=='products' ? 'current' : ''}"><g:link controller="home" action="superkids_products"><span>SuperKids Products</span></g:link></li>
                <li id="${link=='products' ? 'current' : ''}"><g:link controller="home" action="about_manufacturers"><span>About the Manufacturers</span></g:link></li>
            </ul>
            <!--<div class="ad">
            <h3>Win Prizes <span>for Your School District</span></h3>
            <p><img src="${resource(dir:'images',file:'img_bills.jpg')}" title="Money" class="left" />If you’ve already received your free samples, you could win a $100 gift card for your school district just for sharing your opinion.</p>
            <p><a href="${createLink(controller: 'home', action: 'assess')}" title="" class="btn"><span>Tell us what you think</span></a>
        </div>   -->
            <div class="ad">
                <h3>Whole Grain Nutrition, White Flour Appeal</h3>
                <p><img src="${resource(dir:'images',file:'ultragrain_logo_3.0.png')}" title="Ultragrain logo" class="left" />Did you know that Ultragrain flour provides 100% whole grain nutrition without sacrificing the appealing taste, texture and appearance of white flour. <a href="${createLink(controller: 'home', action: 'ultragrain')}">Learn more »</a></p>
            </div>
        </div>
        <g:layoutBody/>
    </div>
</div>
<div id="logo-container">
    <div id="logos">
        <g:render template="/includes/logos" />
    </div>
</div>
<div id="footer-container">
    <div id="footer">
    <g:render template="/includes/footer" />
    </div>
</div>
</body>
</html>