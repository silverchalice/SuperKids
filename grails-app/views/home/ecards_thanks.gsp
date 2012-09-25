

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="promote" />
        <meta name="link" content="broker_ecard" />
        <title>SuperKids | Thank You</title>
    </head>
    <body>


               <h1>Send an Ecard</h1>
               <g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
                    <br />
               </g:if>
               <p><strong>Thank you for helping us to promote whole grain nutrition.</strong></p>

    </body>
</html>
