

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public_li" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            ${content}
    </body>
</html>
