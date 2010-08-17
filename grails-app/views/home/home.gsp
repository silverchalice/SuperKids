<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Superkids Sampling</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'public.css')}" media="screen" />
     <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<meta name="layout" content="public" />

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script type="text/javascript" src="script.js"></script>
</head>
  <body>


    <div id="content">
      <div id="contentInset">
        <span id="headline">Welcome to the SuperKids Whole Grain Sampling Program</span>
        <h2>Online information guide and program directory</h2>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <h3>Featuring free samples of better-for-you whole grain products for K–12<br/>
         from these manufacturers:</h3>

        <img id="sponsors" src="${resource(dir:'images',file:'sponsors.jpg')}" />

        <p style="width:500px;">SuperKids is a unique, FREE sampling program for K-12 foodservice directors featuring whole grain products made with Ultragrain whole wheat and Sustagrain, the ultra-high fiber whole grain. It offers multiple options for introducing higher fiber and healthy whole grains into snack, breakfast and lunch school district menus.</p>

        <p style="width:510px;">SuperKids gives foodservice directors the opportunity to easily evaluate new whole grain products for taste, texture and appearance. With SuperKids, every snack and meal can deliver more whole grains and taste great.</p>

        <strong>To get started, click the login button in the upper-right corner.</strong>
      </div>
      <div id="contentRightEdge">
        <img src="${resource(dir:'images',file:'layout/kid.jpg')}" id="kid"/>
      </div>

      <div id="contentFooter">
      <img id="contentFooterBL" src="${resource(dir:'images',file:'layout/contentFooter-bl-bg.gif')}"/>
      <img id="contentFooterBR" src="${resource(dir:'images',file:'layout/contentFooter-br-bg.gif')}"/>
      </div>

    </div>


  </body>
</html>
