

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="broker" />
        <title>SuperKids | Broker</title>
    </head>
    <body>


	   <g:if test="${flash.message}">
		   <div class="message">${flash.message}</div>
	   </g:if>
	 <div id="contentInsetInner">
		 <div style="width:445px">${content}</div>

	 </div>

    </body>
</html>
