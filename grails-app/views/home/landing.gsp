

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="customer" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>
        <h1>Landing Page</h1>
        <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
        </g:if>
        <p>You are not dead yet. But watch for further reports.</p>
    </body>
</html>
