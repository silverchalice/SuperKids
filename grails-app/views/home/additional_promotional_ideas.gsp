

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="promote" />
        <meta name="link" content="additional_promotional_ideas" />
        <title>SuperKids | Additional Promotional Ideas</title>
    </head>
    <body>

           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
         <div id="contentInsetInner">${content}</div>

    </body>
</html>
