<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.superkids.domain.Product" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:layoutTitle default="Review Your Order - SuperKids Sampling Program | From ConAgra Foods"/> </title>
    <g:render template="/includes/head_data" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="jquery" plugin="jquery"/>
    <g:set var="products" value="${Product.findAllByLiveProduct(true)}" />

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

</head>
<body id="checkout">
<div id="header-container">
    <div id="header">
        <div id="logo">
            <div id="account-bar">
                <g:render template="/includes/account_bar"/>
            </div>
            <a href="${createLink(uri: '/')}" title="Return to the homepage"><img src="${resource(dir:'images',file:'img_superkids_logo.jpg')}" alt="SuperKids Logo" /></a>
            <h2>Build SuperKids <span>with Healthier Whole Grain Foods</span></h2>
            <p>All made with Ultragrain&reg; and Sustagrain&reg;</p>
        </div>
        <g:render template="/includes/nav"/>
    </div>
</div>
<div id="main-container">
    <div id="main">
        <g:layoutBody />

    </div>
</div>

<div id="footer-container">
    <div id="footer">
        <g:render template="/includes/footer" />
    </div>
</div>
</body>
</html>
