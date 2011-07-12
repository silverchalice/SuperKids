

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="broker" />
        <meta name="link" content="broker_participate" />
        <title>SuperKids | How You Can Participate</title>
    </head>
    <body>

		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
                <div id="contentInsetInner">${content}</div>
    </body>
</html>
