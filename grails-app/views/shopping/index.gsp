

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="broker" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>

        <div style="width:600px">
           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
         <h1>This is the new shopping/index page.</h1>
         <p><strong>This page is currently undergoing maintenance.</strong> We apologize for its sheer overwhelming awesomeness.</p>
        </div>
    </body>
</html>
