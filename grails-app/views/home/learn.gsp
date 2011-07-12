<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="learn" />
        <title>SuperKids | Learn</title>
    </head>
    <body>
	     <g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>


		<div id="contentInsetInner">${content}
			<img src="${resource(dir:'images', file:'LearnKid.jpg')}" style="position:absolute; top:6px; left:475px; z-index:0" />

		</div>
    </body>
</html>
