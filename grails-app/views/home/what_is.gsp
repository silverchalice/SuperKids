

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="learn" />
        <meta name="link" content="what_is" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>

        <div style="width:450px">
           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
         <div id="contentInsetInner">${content}</div>
        </div>
    </body>
</html>
