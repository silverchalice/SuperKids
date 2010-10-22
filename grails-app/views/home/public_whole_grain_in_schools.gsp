

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public_li" />
        <meta name="link" content="public_whole_grain_in_schools" />
        <title>SuperKids | Incorporating Whole Grains Into School Menus</title>
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
