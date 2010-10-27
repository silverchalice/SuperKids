

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public_li" />
        <meta name="link" content="about" />
        <title>SuperKids | About SuperKids</title>
    </head>
    <body>

		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
                <div id="contentInsetInner">${content}</div>
    </body>
</html>
