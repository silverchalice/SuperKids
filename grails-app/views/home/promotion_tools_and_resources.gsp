

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="promote" />
        <meta name="link" content="promotion_tools_and_resources" />
        <title>SuperKids | Promotional Tools & Resources</title>
    </head>
    <body>
           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
        <div id="contentInsetInner">${content}</div>

    </body>
</html>
