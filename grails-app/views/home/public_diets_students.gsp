

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public_li" />
        <meta name="link" content="public_diets" />
        <title>SuperKids | Give Students Whole Grain Goodness</title>
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
