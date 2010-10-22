

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="learn" />
        <meta name="link" content="childhood_obesity" />
        <title>SuperKids | Meeting the Childhood Obesity</title>
    </head>
    <body>
         <div id="contentInsetInner">
			 <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
          	 </g:if>
			 ${content}
		 </div>

    </body>
</html>
