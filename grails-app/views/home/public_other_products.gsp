

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public_li" />
        <meta name="link" content="public_other_products" />
        <title>SuperKids | Other Products With Ultragrain</title>
    </head>
    <body>          
         <div id="contentInsetInner" style="overflow:auto">
			 <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
			 ${content}</div>

    </body>
</html>
