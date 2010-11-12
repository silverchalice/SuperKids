<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Superkids Sampling</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'public.css')}" media="screen" />
     <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<meta name="layout" content="public" />
	<style type="text/css">
			#contentInset {
				overflow:visible;
			}
	</style>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
</head>
	<body>

		<img alt="kid" src="${resource(dir:'images',file:'layout/kid.jpg')}" id="kid"/>
		<div id="contentInsetInner">
			<div style="width:520px">
			<span id="headline">Welcome to the SuperKids Whole Grain Sampling Program</span>
			<h2>Online information guide and program directory</h2>
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<h3>Featuring free samples of better-for-you whole grain products for <br/>K–12
			 from these manufacturers:</h3>

			<img id="sponsors" alt="sponsors" src="${resource(dir:'images',file:'sponsors.png')}" />

			<p>SuperKids is a unique, FREE sampling program for K-12 foodservice directors featuring whole grain products made with Ultragrain whole wheat and Sustagrain, the ultra-high fiber whole grain. It offers multiple options for introducing higher fiber and healthy whole grains into snack, breakfast and lunch school district menus.</p>

			<p>SuperKids gives foodservice directors the opportunity to easily evaluate new whole grain products for taste, texture and appearance. With SuperKids, every snack and meal can deliver more whole grains and taste great. <br/>
			<br/><strong>To get started, click the login button in the upper-right corner.</strong></p>
			</div>

  		</div>
	</body>
</html>
